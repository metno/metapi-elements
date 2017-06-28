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
    notes = "Get metadata about the weather and climate elements that are defined for use in the MET API. Use the query parameters to filter which elements to return and what fields to include for each element. Leave the query parameters blank to select **all** elements.",
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
    @ApiParam(value = "The element IDs to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>. An element ID is structured as a <a href=concepts#calculationmethod>calculation method</a>.",
      required = false)
    ids: Option[String],

    @ApiParam(value = "The element names to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
      required = false)
    names: Option[String],

    @ApiParam(value = "The descriptions to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
      required = false)
    descriptions: Option[String],

    @ApiParam(value = "The units to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>. <b>Note:</b> when the unit is 'code', a codetable is in use.",
      required = false)
    units: Option[String],

    @ApiParam(value = "The code tables to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>. <b>Note:</b> When a codetable is in use, the unit is 'code'.",
      required = false)
    codeTables: Option[String],

    @ApiParam(value = "The statuses to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
      required = false)
    statuses: Option[String],

    @ApiParam(value = "The <a href=concepts#calculationmethod>calculation method</a> filter as a <a href=concepts#jsonfilter>JSON filter</a> that supports the following keys: baseNames, methods, innerMethods, periods, innerPeriods, thresholds, methodDescriptions, innerMethodDescriptions, methodUnits, and innerMethodUnits",
      required = false)
    calculationMethod: Option[String],

    @ApiParam(value = "The categories to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
      required = false)
    categories: Option[String],

    @ApiParam(value = "The sensor levels filter as a <a href=concepts#jsonfilter>JSON filter</a> that supports the following keys: levelTypes, units, defaultValues, and values",
      required = false)
    sensorLevels: Option[String],

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

    @ApiParam(value = "The information to return as a comma-separated list of id, name, description, unit, codeTable, status, cmBaseName, cmMethod, cmInnerMethod, cmPeriod, cmInnerPeriod, cmThreshold, cmMethodDescription, cmInnerMethodDescription, cmMethodUnit, cmInnerMethodUnit, category, sensorLevelType, sensorLevelUnit, sensorLevelDefaultValue, sensorLevelValues, legacyElementCodes, legacyUnit, cfStandardName, cfCellMethod, cfUnit, or cfStatus. For example 'id,unit,legacyElementCodes,legacyUnit'. If omitted, all fields are returned.",
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
      QueryStringUtil.ensureSubset(Set("ids", "names", "descriptions", "units", "codeTables", "statuses", "calculationMethod",
        "categories", "sensorLevels", "legacyElementCodes", "legacyUnits", "cfStandardNames", "cfCellMethods", "cfUnits", "cfStatuses", "fields", "lang"),
        request.queryString.keySet)

      elementsAccess.elements(ElementsQueryParameters(ids, names, descriptions, units, codeTables, statuses, calculationMethod,
        categories, sensorLevels, legacyElementCodes, legacyUnits, cfStandardNames, cfCellMethods, cfUnits, cfStatuses, fields, lang))
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
    * GET code table metadata data from elements-db
    */
  @ApiOperation(
    value = "Get metadata about MET API code tables.",
    notes = "Get metadata about the code tables available in the MET API. weather and climate elements that are defined for use in the MET API. A code table defines a small number of discrete values for an element. Use the query parameters to filter which code tables to return and what fields to include for each one. Leave the query parameters blank to select **all** code tables.",
    response = classOf[models.CodeTableResponse],
    httpMethod = "GET")
  @ApiResponses(Array(
    // scalastyle:off magic.number
    new ApiResponse(code = 400, message = "Invalid parameter value or malformed request."),
    new ApiResponse(code = 401, message = "Unauthorized client ID."),
    new ApiResponse(code = 404, message = "No data was found for the list of query Ids."),
    new ApiResponse(code = 500, message = "Internal server error.")))
  // scalastyle:on magic.number
  def getCodeTables( // scalastyle:ignore public.methods.have.type
    @ApiParam(value = "The code table IDs to get metadata for as a comma-separated list of <a href=concepts#searchfilter>search filters</a>.",
      required = false)
    ids: Option[String],

    @ApiParam(value = "Specify header to list only header information, i.e. code table name and description. Leave the parameter empty to list the code table values as well.",
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
      QueryStringUtil.ensureSubset(Set("ids", "fields", "lang"), request.queryString.keySet)

      elementsAccess.codeTables(CodeTablesQueryParameters(ids, fields, lang))
    } match {
      case Success(data) =>
        if (data isEmpty) {
          Error.error(NOT_FOUND, Some("No data found for this combination of query parameters"), None, start)
        } else {
          format.toLowerCase() match {
            case "jsonld" => Ok(new CodeTablesJsonFormat().format(start, data)) as "application/vnd.no.met.data.codetables-v0+json"
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
