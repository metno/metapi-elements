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

package models

import io.swagger.annotations._
import scala.annotation.meta.field
import java.net.URL
import com.github.nscala_time.time.Imports._
import no.met.data.{ApiConstants,BasicResponse}

// scalastyle:off line.size.limit

@ApiModel(description="Data response for element metadata.")
case class ElementResponse(
  @(ApiModelProperty @field)(name=ApiConstants.CONTEXT_NAME, value=ApiConstants.CONTEXT, example=ApiConstants.METAPI_CONTEXT) context: URL,
  @(ApiModelProperty @field)(name=ApiConstants.OBJECT_TYPE_NAME, value=ApiConstants.OBJECT_TYPE, example="ElementResponse") responseType: String,
  @(ApiModelProperty @field)(value=ApiConstants.API_VERSION, example=ApiConstants.API_VERSION_EXAMPLE) apiVersion: String,
  @(ApiModelProperty @field)(value=ApiConstants.LICENSE, example=ApiConstants.METAPI_LICENSE) license: URL,
  @(ApiModelProperty @field)(value=ApiConstants.CREATED_AT, dataType="String", example=ApiConstants.CREATED_AT_EXAMPLE) createdAt: DateTime,
  @(ApiModelProperty @field)(value=ApiConstants.QUERY_TIME, dataType="String", example=ApiConstants.QUERY_TIME_EXAMPLE) queryTime: Duration,
  @(ApiModelProperty @field)(value=ApiConstants.CURRENT_ITEM_COUNT, example=ApiConstants.CURRENT_ITEM_COUNT_EXAMPLE) currentItemCount: Long,
  @(ApiModelProperty @field)(value=ApiConstants.ITEMS_PER_PAGE, example=ApiConstants.ITEMS_PER_PAGE_EXAMPLE) itemsPerPage: Long,
  @(ApiModelProperty @field)(value=ApiConstants.OFFSET, example=ApiConstants.OFFSET_EXAMPLE) offset: Long,
  @(ApiModelProperty @field)(value=ApiConstants.TOTAL_ITEM_COUNT, example=ApiConstants.TOTAL_ITEM_COUNT_EXAMPLE) totalItemCount: Long,
  @(ApiModelProperty @field)(value=ApiConstants.NEXT_LINK, example=ApiConstants.NEXT_LINK_EXAMPLE) nextLink: Option[URL],
  @(ApiModelProperty @field)(value=ApiConstants.PREVIOUS_LINK, example=ApiConstants.PREVIOUS_LINK_EXAMPLE) previousLink: Option[URL],
  @(ApiModelProperty @field)(value=ApiConstants.CURRENT_LINK, example=ApiConstants.CURRENT_LINK_EXAMPLE) currentLink: URL,
  @(ApiModelProperty @field)(value=ApiConstants.DATA) data: Seq[Element]
)
extends BasicResponse( context, responseType, apiVersion, license, createdAt, queryTime, currentItemCount, itemsPerPage, offset, totalItemCount,
    nextLink, previousLink, currentLink)

@ApiModel(description="Metadata for a single element.")
case class Element(
  @(ApiModelProperty @field)(value="The MET API id of the element.", example="min(air_temperature PT12H)") id: Option[String],
  @(ApiModelProperty @field)(value="The name of the element.", example="Minimum temperature (12 hours)") name: Option[String],
  @(ApiModelProperty @field)(value="The description of the element.", example="Lowest observed temperature last 12 hours") description: Option[String],
  @(ApiModelProperty @field)(value="The default unit, as used for data (UDUNITS notation). *code* if the unit is described using a code table.", example="degC") unit: Option[String],
  @(ApiModelProperty @field)(value="If the unit is a *code*, the codetable that describes the codes used.", example="beaufort_scale") codeTable: Option[String],
  @(ApiModelProperty @field)(value="The status of the element; one of 'CF compatible', 'in review', 'MetNo local convention', or 'test'", example="CF compatible") status: Option[String],
  @(ApiModelProperty @field)(value="The calculation method of the element.") calculationMethod: Option[CalcMethod],
  @(ApiModelProperty @field)(value="The category of the element.") category: Option[String],
  @(ApiModelProperty @field)(value="The sensor levels of the element.") sensorLevels: Option[SensorLevels],
  @(ApiModelProperty @field)(value="The old form of the element.") oldConvention: Option[OldMetNoConvention],
  @(ApiModelProperty @field)(value="The CF convention equivalent of the element (omitted if no such equivalent exists).") cfConvention: Option[CfConvention]
)

@ApiModel(description="The calculation method for an element.")
case class CalcMethod(
  @(ApiModelProperty @field)(value="The base name of the element", example="wind_speed") baseName: Option[String],
  @(ApiModelProperty @field)(value="The primary method.", example="mean") method: Option[String],
  @(ApiModelProperty @field)(value="The inner method.", example="max") innerMethod: Option[String],
  @(ApiModelProperty @field)(value="The period over which the primary method applies.", example="P1M") period: Option[String],
  @(ApiModelProperty @field)(value="The period over which the inner method applies.", example="P1D") innerPeriod: Option[String],
  @(ApiModelProperty @field)(value="The threshold applicable to the primary method.", example="5.0") threshold: Option[String],
  @(ApiModelProperty @field)(value="The description of the primary method.") methodDescription: Option[String],
  @(ApiModelProperty @field)(value="The description of the inner method.") innerMethodDescription: Option[String],
  @(ApiModelProperty @field)(value="The unit of the primary method.") methodUnit: Option[String],
  @(ApiModelProperty @field)(value="The unit of the inner method.") innerMethodUnit: Option[String]
)

@ApiModel(description="The default level and available levels for a specific sensor level type.")
case class SensorLevels(
  @(ApiModelProperty @field)(value="The level type.", example="height_above_ground") levelType: Option[String],
  @(ApiModelProperty @field)(value="The level unit.", example="m") unit: Option[String],
  @(ApiModelProperty @field)(value="The default level value.") defaultValue: Option[Double],
  @(ApiModelProperty @field)(value="The level values.") values: Option[Seq[Double]]
)

@ApiModel(description="The Met.no old element code equivalent(s) of the element.")
case class OldMetNoConvention(
  @(ApiModelProperty @field)(value="The old element code(s) of the element.", example="TA") elementCodes: Option[Seq[String]],
  @(ApiModelProperty @field)(value="The unit of the old element code(s).", example="degC") unit: Option[String]
)

@ApiModel(description="The CF convention equivalent of the element.")
case class CfConvention(
  @(ApiModelProperty @field)(value="The CF standard name of the element.", example="air_temperature") standardName: Option[String],
  @(ApiModelProperty @field)(value="The CF cell method(s) for the element, if any.", example="null") cellMethod: Option[String],
  @(ApiModelProperty @field)(value="The unit of the CF element.", example="kelvin") unit: Option[String],
  @(ApiModelProperty @field)(value="The status of the CF name; either a reference to the CF version, Met Norway local standard or test.", example="cf28") status: Option[String]
)

// scalastyle:on
