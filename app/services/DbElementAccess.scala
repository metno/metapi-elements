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

//$COVERAGE-OFF$Not testing database queries
@Singleton
class DbElementAccess extends ElementAccess("") {

  val parser: RowParser[Element] = {
    get[String]("element_name") ~
    get[String]("element_unit") ~
    get[String]("element_description") ~
    get[Option[String]]("cf_standard_name") ~
    get[Option[String]]("cf_cell_method") ~
    get[Option[String]]("cf_unit") ~
    get[Option[String]]("kdvh_code") ~
    get[Option[String]]("kdvh_unit") ~
    get[Option[String]]("kdvh_ref") map {
      case id~unit~desc~cfName~cfMethod~cfUnit~kdvhCode~kdvhUnit~kdvhRef => Element(id.toLowerCase, unit, desc, cfName, cfMethod, cfUnit, kdvhCode, kdvhUnit, kdvhRef)
    }
  }

  def getElements(id: Option[String], code: Option[String], lang: Option[String]): List[Element] = {
    val idList = id map { _.toUpperCase } map { _.replaceAll("\\s+", " ") } map { _.trim } filter { _.length != 0 }
    val elemQ = idList map (idStr => {
      val ids = idStr.split(",").map(_.trim)
      val qIdList = ids.mkString("','")
      s"UPPER(element_name) IN ('$qIdList')"
    } ) getOrElse "element_name IS NOT NULL"
    val codeList = code map { _.toUpperCase } map { _.replaceAll("\\s+", " ") } map { _.trim } filter { _.length != 0 }
    val kdvhQ = codeList map (codeStr => {
      val codes = codeStr.split(",").map(_.trim)
      val qCodeList = codes.mkString("','")
      s"UPPER(kdvh_code) IN ('$qCodeList')"
    } ) getOrElse "kdvh_code IS NOT NULL"
    val localeQ = "element_description_locale = '" + lang.getOrElse("en") + "'";
    val query = s"""
      |SELECT
        |element_name, element_unit, element_description, cf_standard_name, cf_cell_method, cf_unit, string_agg(distinct kdvh_code, ',') as kdvh_code,  string_agg(distinct kdvh_unit, ',') as kdvh_unit, string_agg(distinct kdvh_table, ',') as kdvh_ref
      |FROM
        |element_kdvh_xref_v
      |WHERE
        |$elemQ AND
        |$kdvhQ AND
        |$localeQ
      |GROUP BY
        |element_name, element_unit, element_description, cf_standard_name, cf_cell_method, cf_unit
      |ORDER BY
        |cf_standard_name desc""".stripMargin

    Logger.debug(query)

    DB.withConnection("elements") { implicit connection =>
      SQL(query).as( parser * )
    }
  }

  def getElementById(id: String, lang: Option[String]): List[Element] = {
    val idQ = id.toUpperCase.replaceAll("\\s+", " ").trim
    val localeQ = "element_description_locale = '" + lang.getOrElse("en") + "'";
    val query = s"""
      |SELECT
        |element_name, element_unit, element_description, cf_standard_name, cf_cell_method, cf_unit, string_agg(distinct kdvh_code, ',') as kdvh_code,  string_agg(distinct kdvh_unit, ',') as kdvh_unit, string_agg(distinct kdvh_table, ',') as kdvh_ref
      |FROM
        |element_kdvh_xref_v
      |WHERE
        |UPPER(element_name) = '$idQ' AND
        |$localeQ
      |GROUP BY
        |element_name, element_unit, element_description, cf_standard_name, cf_cell_method, cf_unit
      |ORDER BY
        |cf_standard_name desc""".stripMargin

    Logger.debug(query)

    DB.withConnection("elements") { implicit connection =>
      SQL(query).as( parser * )
    }
  }
}
// $COVERAGE-ON$
