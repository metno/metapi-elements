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

import javax.inject.Singleton
import models.Element
import play.Logger

@Singleton
class MockElementAccess extends ElementAccess("") {
  // Mock Elements
  val elements = List[Element](
    new Element(
      "sum(precipitation_amount 1M)",
      "mm",
      "Monthly total of precipitation (precipitation day 06-06 utc)",
      Some("precipitation_amount"),
      Some("sum"),
      Some("kg/m2"),
      Some("RR"),
      Some("mm"),
      Some("T_MONTH")),
    new Element(
      "surface_snow_thickness",
      "mm",
      "Snow depth, total from ground up; normally measured in the morning. Code = -1 means no snow, -3 = not possible to measure.",
      Some("surface_snow_thickness"),
      None,
      Some("kg/m2"),
      Some("RR"),
      Some("cm"),
      Some("T_ADATA,T_NDATA,T_VDATA,T_10MINUTE_DATA")),
    new Element(
      "sum(precipitation_amount T24H)",
      "mm",
      "Amount of precipitation last 24 hours",
      Some("precipitation_amount"),
      Some("sum"),
      Some("kg/m2"),
      Some("RR_24"),
      Some("mm"),
      Some("T_DIURNAL,T_NDATA,T_ADATA,T_VDATA")),
    new Element(
      "max(surface_snow_thickness 1M)",
      "cm",
      "Monthly value: Maximum measured observed snow depth.",
      Some("surface_snow_thickness"),
      Some("maximum"),
      Some("kg/m2"),
      Some("SAX"),
      Some("cm"),
      Some("T_MONTH")),
    new Element(
      "percent_coverage(max(surface_snow_thickness 1M) 1M)",
      "cm",
      "Monthly value: Maximum measured observed snow depth.",
      Some("surface_snow_thickness"),
      Some("percent_coverage, maximum"),
      Some("kg/m2"),
      Some("SAX"),
      Some("cm"),
      Some("T_COVER")),
    new Element(
      "air_temperature",
      "degC",
      "Air temperature at time of observation",
      Some("air_temperature"),
      None,
      Some("K"),
      Some("TA"),
      Some("degree_celsius"),
      Some("T_MDATA,T_VDATA,T_ADATA,T_10MINUTE_DATA")),
    new Element(
      "max(air_temperature T1H)",
      "degC",
      "Highest noted temperature this hour/day",
      Some("air_temperature"),
      Some("time: maximum over days"),
      Some("K"),
      Some("TAX"),
      Some("degree_celsius"),
      Some("T_MONTH")),
    new Element(
      "max(air_temperature T12H)",
      "degC",
      "Highest observed temperature last 12 hours",
      None,
      None,
      None,
      Some("TAX_12"),
      Some("degree_celsius"),
      Some("T_MONTH")),
    new Element(
      "wind_speed",
      "m/s",
      "Wind speed (10 meters above ground) - standard value: mean value for last 10 minutes before time of observation",
      Some("wind_speed"),
      None,
      Some("m/s"),
      Some("FF"),
      Some("m/s"),
      Some("T_VDATA,T_10MINUTE_DATA,T_MDATA,T_ADATA")),
    new Element(
      "relative_humidity",
      "percent",
      "Relative humidity of the air at hour of observation",
      Some("relative_humidity"),
      None,
      Some("m/s"),
      Some("FF"),
      Some("percent"),
      Some("T_VDATA,T_MDATA")),
    new Element(
      "wind_from_direction",
      "angle",
      "The general wind direction last 10 minutes, defined as the direction the wind comes from, e.g north = 360deg, east = 90deg. -3 = variable direction.",
      Some("wind_from_direction"),
      None,
      Some("m/s"),
      Some("DD"),
      Some("angle"),
      Some("T_MDATA,T_ADATA,T_10MINUTE_DATA"))
  )

  def getElements(id: Option[String], code: Option[String], lang: Option[String]): List[Element] = {

    val idList : Array[String] = id match {
      case Some(id) => id.toLowerCase.split(",")
      case _ => Array[String]()
    }
    val codeList : Array[String] = code match {
      case Some(code) => code.toUpperCase.split(",")
      case _ => Array[String]()
    }

    if (id.isDefined || code.isDefined) {
        val el0 = elements filter (elem => idList.contains(elem.id.toLowerCase) || idList.length == 0)
        el0 filter (elem => codeList.contains(elem.kdvhCode.get) || codeList.length == 0)
    }
    else {
      elements
    }

  }


  def getElementById(id: String, lang: Option[String]): List[Element] = {
    elements filter(element => element.id.toLowerCase == id.toLowerCase)
  }



}
