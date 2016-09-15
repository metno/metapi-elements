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
    @(ApiModelProperty @field)(value="The MET API id of the element.", example="air_temperature") id: Option[String],
    @(ApiModelProperty @field)(value="The name of the element.", example="Air temperature") name: Option[String],
    @(ApiModelProperty @field)(value="The description of the element.", example="Air temperature at time of observation at 2 m height.") description: Option[String],
    @(ApiModelProperty @field)(value="The default unit, as used for data (UDUNITS notation). *code* if the unit is described using a code table.", example="degree_Celsius") unit: Option[String],
    @(ApiModelProperty @field)(value="If the unit is a *code*, the codetable that describes the codes used.", example="beaufort_scale") codeTable: Option[String],
    @(ApiModelProperty @field)(value="The legacy form of the element.") legacyMetNoConvention: Option[LegacyMetNoConvention],
    @(ApiModelProperty @field)(value="The CF standard_name of the element.") cfConvention: Option[CfConvention]
)


@ApiModel(description="The element code equivalent(s) in the legacy convention of Met.no.")
case class LegacyMetNoConvention(
    @(ApiModelProperty @field)(value="The legacy element code of the element.", example="TA") elemCodes: Option[Seq[String]],
    @(ApiModelProperty @field)(value="The legacy category or group of the element.") category: Option[String],
    @(ApiModelProperty @field)(value="The unit of the legacy element code.", example="degree_Celsius") unit: Option[String]
)

@ApiModel(description="The standard name equivalent in the CF convention.")
case class CfConvention(
    @(ApiModelProperty @field)(value="The CF standard name of the element.", example="air_temperature") standardName: Option[String],
    @(ApiModelProperty @field)(value="The CF cell method(s) for the element, if any.", example="null") cellMethod: Option[String],
    @(ApiModelProperty @field)(value="The corresponding unit of the CF element.", example="kelvin") unit: Option[String],
    @(ApiModelProperty @field)(value="The status of the CF name; either a reference to the CF version, Met Norway local standard or test.", example="cf28") status: Option[String]
)

// scalastyle:on
