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
import no.met.data._
import models.Element
import services.elements.{ ElementAccess, JsonFormat }

@Api(value = "elements")
class ElementsController @Inject()(elementService: ElementAccess) extends Controller {

  /**
   * GET element metadata data from elements-db
   */
  @ApiOperation(
    value = "Get metadata about MET API elements.",
    notes = "Get metadata about the weather and climate elements that are defined for use in the MET API. Use the query parameters to filter the set of parameters returned. Leave the query parameters blank to select **all** elements.",
    response = classOf[models.ElementResponse],
    httpMethod = "GET")
  @ApiResponses(Array(
    new ApiResponse(code = 400, message = "Invalid parameter value or malformed request."),
    new ApiResponse(code = 401, message = "Unauthorized client ID."),
    new ApiResponse(code = 404, message = "No data was found for the list of query Ids."),
    new ApiResponse(code = 500, message = "Internal server error.")))
  def getElements( // scalastyle:ignore public.methods.have.type
    @ApiParam(value = "The MET API element ID(s) that you want metadata for. Enter a comma-separated list to select multiple elements.",
              required = false)
              ids: Option[String],
    @ApiParam(value = "The legacy MET Norway element codes that you want metadata for. Enter a comma-separated list to select multiple elements.",
              required = false)
              legacyElemCodes: Option[String],
    @ApiParam(value = "The CF standard names that you want metadata for. Enter a comma-separated list to select multiple elements.",
              required = false)
              cfStandardNames: Option[String],
    @ApiParam(value = "A comma-separated list of the fields that should be present in the response. If set, only those properties listed here will be visible in the result set; e.g.: id,description will show only those two entries in the data set. The legacyMetNoConvention and cfConvention objects are included or excluded as a block by adding or omitting those two fields",
              required = false)
              fields: Option[String],
    @ApiParam(value = "ISO language/locale of return values.",
              allowableValues = "en-US,nb-NO,nn-NO",
              defaultValue = "en-US",
              required = false)
              lang: Option[String],
    @ApiParam(value = "The output format of the result.",
              allowableValues = "jsonld",
              defaultValue = "jsonld",
              required = true)
              format: String) = no.met.security.AuthorizedAction {
    implicit request =>
    val start = DateTime.now(DateTimeZone.UTC) // start the clock
    val idList : List[String] = ids match {
        case Some(x) => x.toLowerCase.split(",").map(_.trim).toList
        case _ => List()
    }
    val legacyElemCodeList : List[String] = legacyElemCodes match {
        case Some(x) => x.toUpperCase.split(",").map(_.trim).toList
        case _ => List()
    }
    val cfStandardNameList : List[String] = cfStandardNames match {
        case Some(x) => x.toLowerCase.split(",").map(_.trim).toList
        case _ => List()
    }
    val fieldList : Set[String] = fields match {
        case Some(x) => x.toLowerCase.split(",").map(_.trim).toSet
        case _ => Set()
    }
    Try  {
      // ensure that the query string contains supported fields only
      QueryStringUtil.ensureSubset(Set("ids", "legacyElemCodes", "cfStandardNames", "fields", "lang"), request.queryString.keySet)

      elementService.getElements(idList, legacyElemCodeList, cfStandardNameList, fieldList, lang)
    } match {
      case Success(data) =>
        if (data isEmpty) {
          Error.error(NOT_FOUND,
            Some("No data found for any of the element ids"),
            Some("Ensure that information exists for at least one element id"), start)
        } else {
          format.toLowerCase() match {
            case "jsonld" => Ok(new JsonFormat().format(start, data)) as "application/vnd.no.met.data.elements-v0+json"
            case x        => Error.error(BAD_REQUEST, Some(s"Invalid output format: $x"), Some("Supported output formats: jsonld"), start)
          }
        }
      case Failure(x: BadRequestException) =>
        Error.error(BAD_REQUEST, Some(x getLocalizedMessage), x help, start)
      case Failure(x) =>
        Error.error(BAD_REQUEST, Some(x getLocalizedMessage), None, start)
    }
  }

  /**
   * GET element metadata data from elements-db
   */
  @ApiOperation(
    value = "Get metadata about a single MET API element.",
    notes = "Get metadata for a single weather or climate element available in the MET API.",
    response = classOf[models.ElementResponse],
    httpMethod = "GET")
  @ApiResponses(Array(
    new ApiResponse(code = 400, message = "Invalid parameter value or malformed request."),
    new ApiResponse(code = 401, message = "Unauthorized client ID."),
    new ApiResponse(code = 404, message = "No data was found for the list of query Ids."),
    new ApiResponse(code = 500, message = "Internal server error.")))
  def getElementById( // scalastyle:ignore public.methods.have.type
    @ApiParam(value = "The MET API element ID that you want to retrieve metadata for.",
              example="air_temperature",
              required = true)
              id: String,
    @ApiParam(value = "A comma-separated list of the fields that should be present in the response. If set, only those properties listed here will be visible in the result set; e.g.: id,description will show only those two entries in the data set. The legacyMetNoConvention and cfConvention objects are included or excluded as a block by adding or omitting those two fields",
              required = false)
              fields: Option[String],
    @ApiParam(value = "ISO language/locale of return values.",
              allowableValues="en-US,nb-NO,nn-NO",
              defaultValue="en-US",
              required = false) lang: Option[String],
    @ApiParam(value = "The output format of the result.",
              allowableValues = "jsonld",
              defaultValue = "jsonld",
              required = true)
              format: String) = no.met.security.AuthorizedAction {
    implicit request =>
    val start = DateTime.now(DateTimeZone.UTC) // start the clock
    val idList = id split "," map (_ trim) map (_ toLowerCase) toList
    val fieldList = FieldSpecification.parse(fields)
    Try {
      // ensure that the query string contains supported fields only
      QueryStringUtil.ensureSubset(Set("id", "fields", "lang"), request.queryString.keySet)

      elementService.getElements(idList, List(), List(), fieldList, lang)
    } match {
      case Success(data) =>
        if (data isEmpty) {
          Error.error(NOT_FOUND, Some("No data elements found for id " + id), None, start)
        } else {
          format.toLowerCase() match {
            case "jsonld" => Ok(new JsonFormat().format(start, data)) as "application/vnd.no.met.data.elements-v0+json"
            case x        => Error.error(BAD_REQUEST, Some(s"Invalid output format: $x"), Some("Supported output formats: jsonld"), start)
          }
        }
      case Failure(x: BadRequestException) =>
        Error.error(BAD_REQUEST, Some(x getLocalizedMessage), x help, start)
      case Failure(x) =>
        Error.error(BAD_REQUEST, Some(x getLocalizedMessage), None, start)
    }
  }

}

// scalastyle:on
