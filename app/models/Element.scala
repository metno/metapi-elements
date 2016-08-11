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

/**
 * Representation of a MET API Element.
 *
 * cf and kdvh elements are used for cross-referencing, however it is not
 * required for there to be a mapping to either of those two standards.
 *
case class Element(
    id: String,
    siUnit: String,
    description: String,
    cfName: Option[String],
    cfCellMethods: Option[String],
    cfUnit: Option[String],
    kdvhCode: Option[String],
    kdvhUnit: Option[String],
    kdvhRef: Option[String]
)*/

/**
 * Complete response data set to send to clients
 */
case class ResponseData(header: no.met.data.BasicResponseData, data: Traversable[Element])

object JsonConstants {
  final val METAPI_CONTEXT="https://data.met.no/schema/"
  final val CONTEXT_NAME="@context"
  final val CONTEXT="The Json-LD context."
  final val RESPONSE_TYPE_NAME="@type"
  final val RESPONSE_TYPE="The response object type."
  final val API_VERSION="The version of the API that generated this response."
  final val API_VERSION_EXAMPLE="v0"
  final val LICENSE="The license that applies to this content."
  final val LICENSE_EXAMPLE="http://met.no/English/Data_Policy_and_Data_Services/"
  final val CREATED_AT="The time at which this document was created (RFC 3339)."
  final val CREATED_AT_EXAMPLE="2007-11-06T16:34:41.000Z"
  final val QUERY_TIME="The time, in seconds, that this document took to generate."
  final val QUERY_TIME_EXAMPLE="0.025"
  final val CURRENT_ITEM_COUNT="The current number of items in this result set."
  final val CURRENT_ITEM_COUNT_EXAMPLE="3456"
  final val ITEMS_PER_PAGE="The maximum number of items in a result set."
  final val ITEMS_PER_PAGE_EXAMPLE="1000"
  final val OFFSET="The offset of the first item in the result set. The MET API uses a zero-base index."
  final val OFFSET_EXAMPLE="2000"
  final val TOTAL_ITEM_COUNT="The total number of items in this specific result set."
  final val TOTAL_ITEM_COUNT_EXAMPLE="1000"
  final val NEXT_LINK="The next link indicates how more data can be retrieved. It points to the URI to load the next set of data."
  final val NEXT_LINK_EXAMPLE="https://data.met.no/resource/v0.jsonld?param=example_param&offset=3000"
  final val PREVIOUS_LINK="The previous link indicates how more data can be retrieved. It points to the URI to load the previous set of data."
  final val PREVIOUS_LINK_EXAMPLE="https://data.met.no/resource/v0.jsonld?param=example_param&offset=1000"
  final val CURRENT_LINK="The current link indicates the URI that was used to generate the current API response"
  final val CURRENT_LINK_EXAMPLE="https://data.met.no/resource/v0.jsonld?param=example_param&offset=2000"
  final val DATA="Container for all the data from the response."
}

@ApiModel(description="Data response for element metadata.")
case class ElementResponse(
  @(ApiModelProperty @field)(name=JsonConstants.CONTEXT_NAME, value=JsonConstants.CONTEXT, example=JsonConstants.METAPI_CONTEXT) context: URL,
  @(ApiModelProperty @field)(name=JsonConstants.RESPONSE_TYPE_NAME, value=JsonConstants.RESPONSE_TYPE, example="ElementResponse") responseType: String,
  @(ApiModelProperty @field)(value=JsonConstants.API_VERSION, example=JsonConstants.API_VERSION_EXAMPLE) apiVersion: String,
  @(ApiModelProperty @field)(value=JsonConstants.LICENSE, example=JsonConstants.LICENSE_EXAMPLE) license: URL,
  @(ApiModelProperty @field)(value=JsonConstants.CREATED_AT, dataType="String", example=JsonConstants.CREATED_AT_EXAMPLE) createdAt: DateTime,
  @(ApiModelProperty @field)(value=JsonConstants.QUERY_TIME, dataType="String", example=JsonConstants.QUERY_TIME_EXAMPLE) queryTime: Duration,
  @(ApiModelProperty @field)(value=JsonConstants.CURRENT_ITEM_COUNT, example=JsonConstants.CURRENT_ITEM_COUNT_EXAMPLE) currentItemCount: Long,
  @(ApiModelProperty @field)(value=JsonConstants.ITEMS_PER_PAGE, example=JsonConstants.ITEMS_PER_PAGE_EXAMPLE) itemsPerPage: Long,
  @(ApiModelProperty @field)(value=JsonConstants.OFFSET, example=JsonConstants.OFFSET_EXAMPLE) offset: Long,
  @(ApiModelProperty @field)(value=JsonConstants.TOTAL_ITEM_COUNT, example=JsonConstants.TOTAL_ITEM_COUNT_EXAMPLE) totalItemCount: Long,
  @(ApiModelProperty @field)(value=JsonConstants.NEXT_LINK, example=JsonConstants.NEXT_LINK_EXAMPLE) nextLink: Option[URL],
  @(ApiModelProperty @field)(value=JsonConstants.PREVIOUS_LINK, example=JsonConstants.PREVIOUS_LINK_EXAMPLE) previousLink: Option[URL],
  @(ApiModelProperty @field)(value=JsonConstants.CURRENT_LINK, example=JsonConstants.CURRENT_LINK_EXAMPLE) currentLink: URL,
  @(ApiModelProperty @field)(value=JsonConstants.DATA) data: List[Element]
) 

@ApiModel(description="Metadata for a single element.")
case class Element(
    @(ApiModelProperty @field)(value="The MET API id of the element.", example="air_temperature") id: String,
    @(ApiModelProperty @field)(value="The name of the element.", example="Air temperature") name: String,
    @(ApiModelProperty @field)(value="The description of the element.", example="Air temperature at time of observation at 2 m height.") description: String,
    @(ApiModelProperty @field)(value="The default unit, as used for data (UDUNITS notation). *code* if the unit is described using a code table.", example="degree_Celsius") unit: String,
    @(ApiModelProperty @field)(value="If the unit is a *code*, the codetable that describes the codes used.", example="beaufort_scale") codeTable: Option[String],
    @(ApiModelProperty @field)(value="The legacy form of the element.") legacyMetNoConvention: LegacyMetNoConvention,
    @(ApiModelProperty @field)(value="The CF standard_name of the element.") cfConvention: CfConvention
)


@ApiModel(description="The element code equivalent(s) in the legacy convention of Met.no.")
case class LegacyMetNoConvention(
    @(ApiModelProperty @field)(value="The legacy element code of the element.", example="TA") elemCode: Option[String],
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
