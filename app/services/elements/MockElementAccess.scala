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
      Some("sum(precipitation_amount 1M)"),
      Some("Monthly total precipitation"),
      Some("Monthly total of precipitation (precipitation day 06-06 utc))"),
      Some("mm"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("RR")), Some("mm"), None)),
      Some(CfConvention(Some("precipitation_amount"), Some("sum"), Some("kg/m2"), Some("cf28")))
      ),
    new Element(
      Some("surface_snow_thickness"),
      Some("Surface snow thickness"),
      Some("Snow depth, total from ground up; normally measured in the morning. Code = -1 means no snow, -3 = not possible to measure."),
      Some("mm"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("RR")), Some("cm"), None)),
      Some(CfConvention(Some("surface_snow_thickness"), Some("sum"), Some("kg/m2"), Some("cf28")))
      ),
    new Element(
      Some("sum(precipitation_amount T24H)"),
      Some("24 hour precipitation"),
      Some("Amount of precipitation last 24 hours"),
      Some("mm"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("RR_24")), Some("mm"), None)),
      Some(CfConvention(Some("precipitation_amount"), Some("sum"), Some("kg/m2"), Some("cf28")))
      ),
    new Element(
      Some("max(surface_snow_thickness 1M)"),
      Some("Monthly snow thickness"),
      Some("Monthly value: Maximum measured observed snow depth."),
      Some("cm"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("SAX")), Some("cm"), None)),
      Some(CfConvention(Some("surface_snow_thickness"), Some("maximum"), Some("kg/m2"), Some("cf28")))
      ),
    new Element(
      Some("percent_coverage(max(surface_snow_thickness 1M) 1M)"),
      Some("snow thickness coverage"),
      Some("Monthly value: Maximum measured observed snow depth."),
      Some("cm"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("SAX")), Some("cm"), None)),
      Some(CfConvention(Some("surface_snow_thickness"), Some("percent_coverage, maximum"), Some("kg/m2"), Some("cf28")))
      ),
    new Element(
      Some("air_temperature"),
      Some("Air temperature"),
      Some("Air temperature at time of observation"),
      Some("degC"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("TA")), Some("degree_Celsius"), None)),
      Some(CfConvention(Some("surface_snow_thickness"), Some("percent_coverage, maximum"), Some("kg/m2"), Some("cf28")))
      ),
    new Element(
      Some("max(air_temperature T1H)"),
      Some("Maximum air temperature 1 hour"),
      Some("Highest noted temperature this hour/day"),
      Some("degC"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("TAX")), Some("degC"), None)),
      Some(CfConvention(Some("air_temperature"), Some("time: maximum over days"), Some("degC"), Some("cf28")))
      ),
    new Element(
      Some("max(air_temperature T12H)"),
      Some("Maximum air temperature 12 hour"),
      Some("Highest observed temperature last 12 hours"),
      Some("degC"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("TAX_12")), Some("degree_Celsius"), None)),
      Some(CfConvention(Some("air_temperature"), None, None, None))
     ),
    new Element(
      Some("wind_speed"),
      Some("Wind speed 10m"),
      Some("Wind speed (10 meters above ground) - standard value: mean value for last 10 minutes before time of observation"),
      Some("m/s"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("FF")), Some("m/s"), None)),
      Some(CfConvention(Some("wind_speed"), None, Some("m/s"), Some("cf28")))
      ),
    new Element(
      Some("relative_humidity"),
      Some("Relative humidity"),
      Some("Relative humidity of the air at hour of observation"),
      Some("percent"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("FF")), Some("percent"), None)),
      Some(CfConvention(Some("relative_humidity"), None, None, None))
      ),
    new Element(
      Some("wind_from_direction"),
      Some("Wind direction"),
      Some("The general wind direction last 10 minutes, defined as the direction the wind comes from, e.g north = 360deg, east = 90deg. -3 = variable direction."),
      Some("angle"),
      None,
      Some(LegacyMetNoConvention(Some(Seq("DD")), Some("angle"), None)),
      Some(CfConvention(Some("wind_from_direction"), None, Some("degR"), Some("cf28")))
      )
  )

  
  def getElements(ids: List[String], elemCodes: List[String], cfNames: List[String], fields: Set[String], lang: Option[String]): List[Element] = {
    elements
      .filter (elem => ids.length == 0 || ids.contains(elem.id.get.toLowerCase) )
      .filter (elem => elemCodes.length == 0 || !(elem.legacyMetNoConvention.get.elemCodes.get.intersect(elemCodes).isEmpty) )
      .filter (elem => cfNames.length == 0 || cfNames.contains(elem.cfConvention.get.standardName.get.toLowerCase) )
  }

}
