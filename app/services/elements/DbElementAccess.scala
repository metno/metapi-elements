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

package services.elements

import play.api.Play.current
import play.api._
import play.api.db._
import anorm._
import anorm.SqlParser._
import java.sql.Connection
import javax.inject.Singleton
import scala.language.postfixOps
import models.{Element, LegacyMetNoConvention, CfConvention}

//$COVERAGE-OFF$Not testing database queries
@Singleton
class DbElementAccess extends ElementAccess("") {

  val parser: RowParser[Element] = {
    get[String]("element_id") ~
    get[String]("element_name") ~
    get[String]("element_description") ~
    get[String]("element_unit") ~
    get[Option[String]]("element_codeTable") ~
    get[Option[String]]("kdvh_code") ~
    get[Option[String]]("kdvh_category") ~
    get[Option[String]]("kdvh_unit") ~
    get[Option[String]]("cf_standard_name") ~
    get[Option[String]]("cf_cell_method") ~
    get[Option[String]]("cf_unit") ~
    get[Option[String]]("cf_status") map {
      case id~name~desc~unit~codeTable~kdvhCode~kdvhCategory~kdvhUnit~cfName~cfMethod~cfUnit~cfStatus => Element(id.toLowerCase, name, desc, unit, codeTable, LegacyMetNoConvention(kdvhCode, kdvhCategory, kdvhUnit), CfConvention(cfName, cfMethod, cfUnit, cfStatus))
    }
  }

  def getElements(id: Option[String], code: Option[String], lang: Option[String]): List[Element] = {
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
      s"UPPER(kdvh_code) IN ('$qCodeList')"
    } ) getOrElse "kdvh_code IS NOT NULL"
    val localeQ = "element_description_locale = '" + lang.getOrElse("en") + "'";
    val query = s"""
      |SELECT
        |element_id, element_name, element_description, element_unit, element_codetable, min(kdvh_code) AS kdvh_code, kdvh_unit, kdvh_category, cf_standard_name, cf_cell_method, cf_unit, cf_status
      |FROM
        |element_kdvh_xref_v
      |WHERE
        |$elemQ AND
        |$kdvhQ AND
        |$localeQ
      |GROUP BY
        |element_id, element_name, element_description, element_unit, element_codetable, kdvh_unit, kdvh_category, cf_standard_name, cf_cell_method, cf_unit, cf_status
      |ORDER BY
        |element_id desc""".stripMargin

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
        |element_id, element_name, element_description, element_unit, element_codetable, min(kdvh_code) AS kdvh_code, kdvh_unit, kdvh_category, cf_standard_name, cf_cell_method, cf_unit, cf_status
      |FROM
        |element_kdvh_xref_v
      |WHERE
        |UPPER(element_id) = '$idQ' AND
        |$localeQ
      |GROUP BY
        |element_id, element_name, element_description, element_unit, element_codetable, kdvh_unit, kdvh_category, cf_standard_name, cf_cell_method, cf_unit, cf_status
      |ORDER BY
        |element_id desc""".stripMargin

    Logger.debug(query)

    DB.withConnection("elements") { implicit connection =>
      SQL(query).as( parser * )
    }
  }
}
// $COVERAGE-ON$
