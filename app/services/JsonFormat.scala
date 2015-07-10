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

import play.api.mvc._
import play.api.libs.json._
import com.github.nscala_time.time.Imports._
import models.{ Element, ResponseData }
import no.met.data.BasicResponseData
import no.met.data.format.json.BasicJsonFormat

/**
 * Creating a json representation of elements data
 */
object JsonFormat extends BasicJsonFormat {

  implicit val elementWriter: Writes[Element] = new Writes[Element] {

    private def withoutValue(v: JsValue): Boolean = v match {
      case JsNull => true
      case JsString("") => true
      case _ => false
    }

    def writesCf(element: Element): Option[JsObject] = {
      element.cfName match {
        case Some(theValue) => {
          val js = Json.obj(
            "standard_name" -> element.cfName,
            "unit" -> element.cfUnit,
            "cell_methods" -> element.cfCellMethods)
          Some(JsObject(js.fields.filterNot(t => withoutValue(t._2))))
        }
        case None => None
      }
    }

    def writesKdvh(element: Element): Option[JsObject] = {
      element.kdvhCode match {
        case Some(theValue) => {
          val js = Json.obj(
            "code" -> element.kdvhCode,
            "unit" -> element.kdvhUnit,
            "ref"  -> element.kdvhRef)
          Some(JsObject(js.fields.filterNot(t => withoutValue(t._2))))
        }
        case None => None
      }
    }

    def writes(element: Element): JsObject = {
      val js = Json.obj(
        "@type" -> "Element",
        "id" -> element.id,
        "siUnit" -> element.siUnit,
        "description" -> element.description,
        "cfConvention" -> writesCf(element),
        "kdvhConvention" -> writesKdvh(element))
      JsObject(js.fields.filterNot(t => withoutValue(t._2)))
    }
  }

  implicit val responseDataWrites: Writes[ResponseData] = new Writes[ResponseData] {
    def writes(response: ResponseData): JsObject = {
      header(response.header) + ("data", Json.toJson(response.data))
    }
  }

  /**
   * Create json representation of the given list
   *
   * @param start Start time of the query processing.
   * @param elements The list to create a representation of.
   * @return json representation, as a string
   */
  def format[A](start: DateTime, elements: Traversable[Element])(implicit request: Request[A]): String = {
    val size = elements.size
    val duration = new Duration(DateTime.now.getMillis() - start.getMillis())
    // Create json representation
    val header = BasicResponseData("Response", "Elements", "v0", duration, size, size, size, 0, None, None)
    val response = ResponseData(header, elements)
    Json.prettyPrint(Json.toJson(response))
  }

}
