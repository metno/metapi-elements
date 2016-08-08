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

@Api(value = "elements")
class ElementsController @Inject()(elementService: ElementAccess) extends Controller {

  /**
   * GET element metadata data from elements-db
   */
  @ApiOperation(
    value = "Get metadata about MET API elements.",
    notes = "Get metadata about the weather and climate elements that are defined for use in the MET API, as filtered by the query parameters.",
    response = classOf[String],
    httpMethod = "GET")
  @ApiResponses(Array(
    new ApiResponse(code = 200, message = "OK"),
    new ApiResponse(code = 400, message = "Invalid parameter value or malformed request."),
    new ApiResponse(code = 401, message = "Unauthorized client ID."),
    new ApiResponse(code = 404, message = "No data was found for the list of query Ids."),
    new ApiResponse(code = 500, message = "Internal server error.")))
  def getElements( // scalastyle:ignore public.methods.have.type
    @ApiParam(value = "The MET API element ID(s) that you want metadata for as a comma-separated list.",
              allowMultiple = true,
              example="air_temperature",
              required = false)
              id: Option[String],
    @ApiParam(value = "The legacy MET Norway element code that you want metadata for as a comma separated list.",
              example = "TA",
              required = false)
              legacyElemCode: Option[String],
    @ApiParam(value = "ISO language/locale of return values.",
              allowableValues = "en-US,nb-NO,nn-NO",
              defaultValue = "en-US",
              required = false) lang: Option[String],
    @ApiParam(value = "output format",
              allowableValues = "jsonld",
              defaultValue = "jsonld",
              required = true)
              format: String) = no.met.security.AuthorizedAction {
    implicit request =>
    // Start the clock
    val start = DateTime.now(DateTimeZone.UTC)
    Try  {
      elementService.getElements(id, legacyElemCode, lang)
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
   * GET element metadata data from elements-db
   */
  @ApiOperation(
    value = "Get metadata about a single MET API element.",
    notes = "Get metadata for a single weather or climate element available in the MET API.",
    response = classOf[String],
    httpMethod = "GET")
  @ApiResponses(Array(
    new ApiResponse(code = 200, message = "OK"),
    new ApiResponse(code = 400, message = "Invalid parameter value or malformed request."),
    new ApiResponse(code = 401, message = "Unauthorized client ID."),
    new ApiResponse(code = 404, message = "No data was found for the list of query Ids."),
    new ApiResponse(code = 500, message = "Internal server error.")))
  def getElementById( // scalastyle:ignore public.methods.have.type
    @ApiParam(value = "The MET API element ID that you want to retrieve metadata for.",
              example="air_temperature",
              required = true)
              id: String,
    @ApiParam(value = "ISO language/locale of return values.",
              allowableValues="en-US,nb-NO,nn-NO",
              defaultValue="en-US",
              required = false) lang: Option[String],
    @ApiParam(value = "output format",
              allowableValues = "jsonld",
              defaultValue = "jsonld",
              required = true)
              format: String) = no.met.security.AuthorizedAction {
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
