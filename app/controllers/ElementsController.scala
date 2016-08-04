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

package controllers

import play.api._
import play.api.mvc._
import play.api.http.Status._
import com.github.nscala_time.time.Imports._
import javax.inject.Inject
import io.swagger.annotations._
import scala.language.postfixOps
import util._
import models.Element
import services.elements.{ ElementAccess, JsonFormat }

// scalastyle:off magic.number

@Api(value = "/elements", description = "Descriptions of MET API elements")
class ElementsController @Inject()(elementService: ElementAccess) extends Controller {

  /**
   * GET elements data from solr/elements
   * @param ids list of ids to retrieve, comma-separated
   */
  @ApiOperation(
    nickname = "getElements",
    value = "Returns information about the elements of the API",
    response = classOf[String],
    httpMethod = "GET")
  @ApiResponses(Array(
    new ApiResponse(code = 400, message = "An error in the request"),
    new ApiResponse(code = 404, message = "No data was found")))
  def getElements( // scalastyle:ignore public.methods.have.type
    @ApiParam(value = "If specified, select the element ids listed.", required = false) id: Option[String],
    @ApiParam(value = "If specified, select the element matching the KDVH code.", required = false) code: Option[String],
    @ApiParam(value = "Language of return values. Valid languages are en (English), no (Norwegian bokmål) and es (Norwegian nynorsk). English is the default", required = false) lang: Option[String],
    @ApiParam(value = "output format", required = true, allowableValues = "jsonld",
      defaultValue = "jsonld") format: String) = no.met.security.AuthorizedAction {
    implicit request =>
    // Start the clock
    val start = DateTime.now(DateTimeZone.UTC)
    Try  {
      elementService.getElements(id, code, lang)
    } match {
      case Success(data) =>
        if (data isEmpty) {
          NotFound("Could not find any data elements for id " + id)
        } else {
          format.toLowerCase() match {
            case "jsonld" => Ok(JsonFormat.format(start, data)) as "application/vnd.no.met.data.elements-v0+json"
            case x        => BadRequest(s"Invalid output format: $x")
          }
        }
      case Failure(x) => BadRequest(x getLocalizedMessage)
    }
  }

  /**
   * GET elements data from solr/elements
   * @param id single elementId to retrieve
   */
  @ApiOperation(
    nickname = "getElementById",
    value = "Returns information about a single element from the API",
    response = classOf[String],
    httpMethod = "GET")
  @ApiResponses(Array(
    new ApiResponse(code = 200, message = "The request was successfully completed"),
    new ApiResponse(code = 400, message = "An error in the request"),
    new ApiResponse(code = 401, message = "The authentication credentials included with this request are missing or invalid"),
    new ApiResponse(code = 404, message = "No data was found for the specified ID"),
    new ApiResponse(code = 500, message = "The service encountered an unexpected server-side condition which prevented it from fulfilling the request")))
  def getElementById( // scalastyle:ignore public.methods.have.type
    @ApiParam(value = "Id of the element to retrieve metadata for", required = false) id: String,
    @ApiParam(value = "Language of return values. Valid languages are en (English), no (Norwegian bokmål) and es (Norwegian nynorsk). English is the default", required = false) lang: Option[String],
    @ApiParam(value = "output format", required = true, allowableValues = "jsonld",
      defaultValue = "jsonld") format: String) = no.met.security.AuthorizedAction {
    implicit request =>
    // Start the clock
    val start = DateTime.now(DateTimeZone.UTC)
    Try {
      elementService.getElementById(id, lang)
    } match {
      case Success(data) =>
        if (data isEmpty) {
          NotFound("Could not find any data elements for id " + id)
        } else {
          format.toLowerCase() match {
            case "jsonld" => Ok(JsonFormat.format(start, data)) as "application/vnd.no.met.data.elements-v0+json"
            case x        => BadRequest(s"Invalid output format: $x")
          }
        }
      case Failure(x) => BadRequest(x getLocalizedMessage)
    }
  }

}

// scalastyle:on
