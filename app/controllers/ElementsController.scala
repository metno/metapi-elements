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

    @ApiParam(value = "The <a href=concepts#calculationmethod>calculation method</a> filter as a JSON object consisting of zero or more key-value pairs: \"&lt;key1&gt;\": \"&lt;value1&gt;\", \"&lt;key2&gt;\": \"&lt;value2&gt;\", ... (note that braces around the object may be omitted, like in this case). Each value is a comma-separated list of <a href=concepts#searchfilter>search filters</a>. The following keys are supported: baseNames, secondaryBaseNames, function1s, function2s, period1s, period2s, threshold2s, descrFunction1s, descrFunction2s, unitFunction1s, unitFunction2s",
      required = false)
    calculationMethod: Option[String],

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

    @ApiParam(value = "The information to return as a comma-separated list of id, name, description, unit, codeTable, status, baseName, cmBaseName, cmSecondaryBaseName, cmFunction1, cmFunction2, cmPeriod1, cmPeriod2, cmThreshold2, cmDescrFunction1, cmDescrFunction2, cmUnitFunction1, cmUnitFunction2, category, legacyElementCodes, legacyUnit, cfStandardName, cfCellMethod, cfUnit, or cfStatus. For example 'id,unit,legacyElementCodes,legacyUnit'. If omitted, all fields are returned.",
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
      QueryStringUtil.ensureSubset(Set("ids", "names", "descriptions", "units", "codeTables", "statuses", "baseNames", "calculationMethod",
        "categories", "legacyElementCodes", "legacyUnits", "cfStandardNames", "cfCellMethods", "cfUnits", "cfStatuses", "fields", "lang"),
        request.queryString.keySet)

      elementsAccess.elements(ElementsQueryParameters(ids, names, descriptions, units, codeTables, statuses, baseNames, calculationMethod,
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


}

// scalastyle:on
