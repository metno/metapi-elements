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
import models._
import services.elements._

// scalastyle:off line.size.limit

@Api(value = "elements")
class ElementsController @Inject()(elementsAccess: ElementsAccess) extends Controller {

  /**
   * GET element metadata data from elements-db
   */
  @ApiOperation(
    value = "Get metadata about MET API elements.",
    notes = "Get metadata about the weather and climate elements that are defined for use in the MET API. Use the query parameters to filter the set of parameters returned. Leave the query parameters blank to select **all** elements.",
    response = classOf[models.ElementResponse],
    httpMethod = "GET")
  @ApiResponses(Array(
    // scalastyle:off magic.number
    new ApiResponse(code = 400, message = "Invalid parameter value or malformed request."),
    new ApiResponse(code = 401, message = "Unauthorized client ID."),
    new ApiResponse(code = 404, message = "No data was found for the list of query Ids."),
    new ApiResponse(code = 500, message = "Internal server error.")))
    // scalastyle:on magic.number
  def getElements( // scalastyle:ignore public.methods.have.type
    @ApiParam(value = "The element IDs to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              ids: Option[String],
    @ApiParam(value = "The element names to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              names: Option[String],
    @ApiParam(value = "The descriptions to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              descriptions: Option[String],
    @ApiParam(value = "The units to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              units: Option[String],
    @ApiParam(value = "The code tables to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              codeTables: Option[String],
    @ApiParam(value = "The statuses to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              statuses: Option[String],
    @ApiParam(value = "The base names to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              baseNames: Option[String],
    @ApiParam(value = "The calculation methods to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              calculationMethods: Option[String],
    @ApiParam(value = "The categories to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              categories: Option[String],
    @ApiParam(value = "The legacy MET Norway element codes to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              legacyElementCodes: Option[String],
    @ApiParam(value = "The legacy MET Norway units to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              legacyUnits: Option[String],
    @ApiParam(value = "The CF standard names to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              cfStandardNames: Option[String],
    @ApiParam(value = "The CF cell methods to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              cfCellMethods: Option[String],
    @ApiParam(value = "The CF units to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              cfUnits: Option[String],
    @ApiParam(value = "The CF statuses to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
              required = false)
              cfStatuses: Option[String],
    @ApiParam(value = "The information to return as a comma-separated list of 'id', 'name', 'description', 'unit', 'codeTable', 'status', 'baseName', 'calculationMethod', 'category', 'legacyElementCodes', 'legacyUnit', 'cfBaseName', 'cfCellMethod', 'cfUnit', or 'cfStatus'. For example 'id,unit,legacyElementCodes,legacyUnit'. If omitted, all fields are returned.",
              required = false)
              fields: Option[String],
    @ApiParam(value = "ISO language/locale to be used for search filters and return values.",
              allowableValues = "en-US,nb-NO,nn-NO",
              defaultValue = "en-US",
              required = false)
              lang: Option[String],
    @ApiParam(value = "The output format of the result.",
              allowableValues = "jsonld",
              defaultValue = "jsonld",
              required = true)
              format: String) = no.met.security.AuthorizedAction { implicit request =>

    val start = DateTime.now(DateTimeZone.UTC) // start the clock

    Try  {
      // ensure that the query string contains supported fields only
      QueryStringUtil.ensureSubset(Set("ids", "names", "descriptions", "units", "codeTables", "statuses", "baseNames", "calculationMethods",
        "categories", "legacyElementCodes", "legacyUnits", "cfStandardNames", "cfCellMethods", "cfUnits", "cfStatuses", "fields", "lang"),
        request.queryString.keySet)

      elementsAccess.elements(ElementsQueryParameters(ids, names, descriptions, units, codeTables, statuses, baseNames, calculationMethods,
        categories, legacyElementCodes, legacyUnits, cfStandardNames, cfCellMethods, cfUnits, cfStatuses, fields, lang))
    } match {
      case Success(data) =>
        if (data isEmpty) {
          Error.error(NOT_FOUND, Some("No data found for this combination of query parameters"), None, start)
        } else {
          format.toLowerCase() match {
            case "jsonld" => Ok(new ElementsJsonFormat().format(start, data)) as "application/vnd.no.met.data.elements-v0+json"
            case x        => Error.error(BAD_REQUEST, Some(s"Invalid output format: $x"), Some("Supported output formats: jsonld"), start)
          }
        }
      case Failure(x: BadRequestException) =>
        Error.error(BAD_REQUEST, Some(x getLocalizedMessage), x help, start)
      case Failure(x) => {
        //$COVERAGE-OFF$
        Logger.error(x.getLocalizedMessage)
        Error.error(INTERNAL_SERVER_ERROR, Some("An internal error occurred"), None, start)
        //$COVERAGE-ON$
      }
    }
  }


  /**
    * GET calculation descriptions of calculation method functions from elements-db
    */
  @ApiOperation(
    value = "Get descriptions of calculation method functions.",
    notes = "Get descriptions of calculation method functions. TO BE COMPLETED.",
    response = classOf[models.CalcMethodFunctionResponse],
    httpMethod = "GET")
  @ApiResponses(Array(
    // scalastyle:off magic.number
    new ApiResponse(code = 400, message = "Invalid parameter value or malformed request."),
    new ApiResponse(code = 401, message = "Unauthorized client ID."),
    new ApiResponse(code = 404, message = "No data was found for the list of query Ids."),
    new ApiResponse(code = 500, message = "Internal server error.")))
    // scalastyle:on magic.number
  def getCalcMethodFunctions( // scalastyle:ignore public.methods.have.type
    @ApiParam(value = "The calculation method functions to get descriptions for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
      required = false)
    functions: Option[String],
    @ApiParam(value = "The information to return as a comma-separated list of 'function', 'unit', or 'description'. For example 'function,description'. If omitted, all fields are returned.",
      required = false)
    fields: Option[String],
    @ApiParam(value = "ISO language/locale to be used for search filters and return values.",
      allowableValues = "en-US,nb-NO,nn-NO",
      defaultValue = "en-US",
      required = false)
    lang: Option[String],
    @ApiParam(value = "The output format of the result.",
      allowableValues = "jsonld",
      defaultValue = "jsonld",
      required = true)
    format: String) = no.met.security.AuthorizedAction { implicit request =>

    val start = DateTime.now(DateTimeZone.UTC) // start the clock

    Try  {
      // ensure that the query string contains supported fields only
      QueryStringUtil.ensureSubset(Set("functions", "fields", "lang"), request.queryString.keySet)

      elementsAccess.calcMethodFunctions(CalcMethodFunctionsQueryParameters(functions, fields, lang))
    } match {
      case Success(data) =>
        if (data isEmpty) {
          Error.error(NOT_FOUND, Some("No data found for this combination of query parameters"), None, start)
        } else {
          format.toLowerCase() match {
            case "jsonld" => Ok(new CalcMethodFunctionsJsonFormat().format(start, data)) as "application/vnd.no.met.data.elements.calculationmethodfunctions-v0+json"
            case x        => Error.error(BAD_REQUEST, Some(s"Invalid output format: $x"), Some("Supported output formats: jsonld"), start)
          }
        }
      case Failure(x: BadRequestException) =>
        Error.error(BAD_REQUEST, Some(x getLocalizedMessage), x help, start)
      case Failure(x) => {
        //$COVERAGE-OFF$
        Logger.error(x.getLocalizedMessage)
        Error.error(INTERNAL_SERVER_ERROR, Some("An internal error occurred"), None, start)
        //$COVERAGE-ON$
      }
    }
  }

}

// scalastyle:on
