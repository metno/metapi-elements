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

package services.elements

import javax.inject.Singleton
import models._
import play.Logger

@Singleton
class MockElementAccess extends ElementAccess("") {
  // Mock Elements
  val elements = List[Element](
    new Element(
      "sum(precipitation_amount 1M)",
      "Monthly total precipitation",
      "Monthly total of precipitation (precipitation day 06-06 utc)",
      "mm",
      None,
      LegacyMetNoConvention(Some("RR"), Some("mm"), None),
      CfConvention(Some("precipitation_amount"), Some("sum"), Some("kg/m2"), Some("cf28"))
      ),
    new Element(
      "surface_snow_thickness",
      "Surface snow thickness",
      "Snow depth, total from ground up; normally measured in the morning. Code = -1 means no snow, -3 = not possible to measure.",
      "mm",
      None,
      LegacyMetNoConvention(Some("RR"), Some("cm"), None),
      CfConvention(Some("surface_snow_thickness"), Some("sum"), Some("kg/m2"), Some("cf28"))
      ),
    new Element(
      "sum(precipitation_amount T24H)",
      "24 hour precipitation",
      "Amount of precipitation last 24 hours",
      "mm",
      None,
      LegacyMetNoConvention(Some("RR_24"), Some("mm"), None),
      CfConvention(Some("precipitation_amount"), Some("sum"), Some("kg/m2"), Some("cf28"))
      ),
    new Element(
      "max(surface_snow_thickness 1M)",
      "Monthly snow thickness",
      "Monthly value: Maximum measured observed snow depth.",
      "cm",
      None,
      LegacyMetNoConvention(Some("SAX"), Some("cm"), None),
      CfConvention(Some("surface_snow_thickness"), Some("maximum"), Some("kg/m2"), Some("cf28"))
      ),
    new Element(
      "percent_coverage(max(surface_snow_thickness 1M) 1M)",
      "snow thickness coverage",
      "Monthly value: Maximum measured observed snow depth.",
      "cm",
      None,
      LegacyMetNoConvention(Some("SAX"), Some("cm"), None),
      CfConvention(Some("surface_snow_thickness"), Some("percent_coverage, maximum"), Some("kg/m2"), Some("cf28"))
      ),
    new Element(
      "air_temperature",
      "Air temperature",
      "Air temperature at time of observation",
      "degC",
      None,
      LegacyMetNoConvention(Some("TA"), Some("degree_Celsius"), None),
      CfConvention(Some("surface_snow_thickness"), Some("percent_coverage, maximum"), Some("kg/m2"), Some("cf28"))
      ),
    new Element(
      "max(air_temperature T1H)",
      "Maximum air temperature 1 hour",
      "Highest noted temperature this hour/day",
      "degC",
      None,
      LegacyMetNoConvention(Some("TAX"), Some("degC"), None),
      CfConvention(Some("air_temperature"), Some("time: maximum over days"), Some("degC"), Some("cf28"))
      ),
    new Element(
      "max(air_temperature T12H)",
      "Maximum air temperature 12 hour",
      "Highest observed temperature last 12 hours",
      "degC",
      None,
      LegacyMetNoConvention(Some("TAX_12"), Some("degree_Celsius"), None),
      CfConvention(None, None, None, None)
      ),
    new Element(
      "wind_speed",
      "Wind speed 10m",
      "Wind speed (10 meters above ground) - standard value: mean value for last 10 minutes before time of observation",
      "m/s",
      None,
      LegacyMetNoConvention(Some("FF"), Some("m/s"), None),
      CfConvention(Some("wind_speed"), None, Some("m/s"), Some("cf28"))
      ),
    new Element(
      "relative_humidity",
      "Relative humidity",
      "Relative humidity of the air at hour of observation",
      "percent",
      None,
      LegacyMetNoConvention(Some("FF"), Some("percent"), None),
      CfConvention(Some("relative_humidity"), None, None, None)
      ),
    new Element(
      "wind_from_direction",
      "Wind direction",
      "The general wind direction last 10 minutes, defined as the direction the wind comes from, e.g north = 360deg, east = 90deg. -3 = variable direction.",
      "angle",
      None,
      LegacyMetNoConvention(Some("DD"), Some("angle"), None),
      CfConvention(Some("wind_from_direction"), None, Some("degR"), Some("cf28"))
      )
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
        el0 filter (elem => codeList.contains(elem.legacyMetNoConvention.elemCode.get) || codeList.length == 0)
    }
    else {
      elements
    }

  }


  def getElementById(id: String, lang: Option[String]): List[Element] = {
    elements filter(element => element.id.toLowerCase == id.toLowerCase)
  }



}
