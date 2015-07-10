/*
    MET-API

    Copyright (C) 2014 met.no
    Contact information:
    Norwegian Meteorological Institute
    Box 43 Blindern
    0313 OSLO
    NORWAY
    E-mail: met-api@met.no

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
    MA 02110-1301, USA
*/

package services

import play.api.Play.current
import play.api._
import play.api.db._
import anorm._
import anorm.SqlParser._
import java.sql.Connection
import javax.inject.Singleton
import models.Element

/*
 * KDVH Mapping Table Schema
 * ELEM_CODE
 * TABLE_NAME
 * STANDARD_NAME
 * CALCULATION_METHOD
 * TIMESPAN
 * REFTIME
 * SENSOR_NR
 * SENSOR_LEVEL
 * AUDIT_DATO
 * NUM_STATIONS
 * ELEMENT_ID
 * TS_ELEM_TABLE_NAME
 * LEVEL_UNIT
 * FLAG_TABLE_NAME
 */

//$COVERAGE-OFF$Not testing database queries
@Singleton
class KdvhElementAccess extends ElementAccess("") {

  val parser: RowParser[Element] = {
    get[String]("element_id") ~
    get[String]("standard_name") ~
    get[String]("elem_code") map {
      case id~cfName~kdvhCode => Element(id.toLowerCase, "-", "Missing description", Some(cfName), Some("-"), Some("-"), Some(kdvhCode), Some("-"), Some("-"))
    }
  }

  def getElements(id: Option[String], code: Option[String]): List[Element] = {
    val idList = id map { _.toUpperCase } map { _.replaceAll("\\s+", " ") } map { _.trim } filter { _.length != 0 }
    val elemQ = idList map (idStr => {
      val ids = idStr.split(",").map(_.trim)
      val qIdList = ids.mkString("','")
      s"UPPER(element_id) IN ('$qIdList')"
    } ) getOrElse "element_id IS NOT NULL"
    val codeList = code map { _.toUpperCase } map { _.replaceAll("\\s+", " ") } map { _.trim } filter { _.length != 0 }
    val kdvhQ = codeList map (codeStr => {
      val codes = codeStr.split(",").map(_.trim)
      val qCodeList = codes.mkString("','")
      s"UPPER(elem_code) IN ('$qCodeList')"
    } ) getOrElse "elem_code IS NOT NULL"
    val query = s"""
      |SELECT
        |element_id, standard_name, elem_code
      |FROM
        |kportal.t_elem_map_cfnames
      |WHERE
        |$elemQ AND
        |$kdvhQ
      |ORDER BY
        |standard_name desc""".stripMargin

    Logger.debug(query)

    DB.withConnection("elements") { implicit connection =>
      SQL(query).as( parser * )
    }
  }

  def getElementById(id: String): List[Element] = {
    val idQ = id.toUpperCase.replaceAll("\\s+", " ").trim
    val query = s"""
      |SELECT
        |element_id, standard_name, elem_code
      |FROM
        |kportal.t_elem_map_cfnames
      |WHERE
        |UPPER(element_id) = '$idQ'
      |ORDER BY
        |standard_name desc""".stripMargin

    Logger.debug(query)

    DB.withConnection("elements") { implicit connection =>
      SQL(query).as( parser * )
    }
  }
}
// $COVERAGE-ON$
