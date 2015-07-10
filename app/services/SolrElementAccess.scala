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

import play.api._
import javax.inject.Singleton
import jp.sf.amateras.solr.scala._
import jp.sf.amateras.solr.scala.CaseClassQueryResult
import models.Element

object SolrElement {

    /**
   * Parse and trim a list of element IDs separated by comma to a list of IDs separated by whitespace,
   * suitable to be used in a Solr database
   * @param id String containing comma-separated list of ids
   * @return String containing white-space separated list of ids or None
   */
  def parseId(id: Option[String]) : String = {
    val idList = id map { _.toLowerCase } map { _.replace(',', ' ') } map { _.replaceAll("\\s+", " ") } map { _.trim } filter { _.length != 0 }
    idList match {
      case Some(idList) => "(" + idList  + ")"
      case None => "(*:*)"
    }
  }

    /**
   * Parse and trim a list of KDVH codes separated by comma to a list of codes separated by whitespace,
   * suitable to be used in a Solr database
   * @param id String containing comma-separated list of ids
   * @return String containing white-space separated list of ids or None
   */
  def parseCode(code: Option[String]) : String = {
    val codeList = code map { _.toUpperCase } map { _.replace(',', ' ') } map { _.replaceAll("\\s+", " ") } map { _.trim } filter { _.length != 0 }
    codeList match {
      case Some(codeList) => "(" + codeList  + ")"
      case None => "(*:*)"
    }
  }

}


//$COVERAGE-OFF$Not testing database queries
@Singleton
class SolrElementAccess extends ElementAccess(Play.current.configuration.getString("met.solr.elements").get) {

  val client = new SolrClient(url)

  def getElements(id: Option[String], code: Option[String]): List[Element] = {
    // Query the DB
    client.query("id:$id$,code:$code$")
        .id("id")
        .fields("id", "siUnit", "description", "cfName", "cfUnit", "cfCellMethods", "kdvhCode", "kdvhUnit", "kdvhRef")
        .sortBy("id", Order.asc)
        .getResultAs[Element](Map("id" -> SolrElement.parseId(id), "code" -> SolrElement.parseCode(code))).documents
  }

  def getElementById(id: String): List[Element] = {
    // Query the DB
    client.query("id:$id$")
        .id("id")
        .fields("id", "siUnit", "description", "cfName", "cfUnit", "cfCellMethods", "kdvhCode", "kdvhUnit", "kdvhRef")
        .sortBy("id", Order.asc)
        .getResultAs[Element](Map("id" -> id)).documents
  }

}
// $COVERAGE-ON$
