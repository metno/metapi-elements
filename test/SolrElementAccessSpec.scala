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

import org.junit.runner._
import org.specs2.mutable._
import org.specs2.runner._
import play.api.test._
import play.api.test.Helpers._
import play.api.mvc
import services.SolrElement

// scalastyle:off magic.number
@RunWith(classOf[JUnitRunner])
class SolrElementAccessSpec extends Specification {

  "Parsing of id" should {

    "convert no id to retrieve all in solr" in {
      SolrElement.parseId(None) must equalTo("(*:*)")
    }

    "convert white space to retrieve all in solr" in {
      SolrElement.parseId(Some("  ")) must equalTo("(*:*)")
    }

    "convert single element id to correct solr parameter" in {
      SolrElement.parseId(Some("air_temperature")) must equalTo("(air_temperature)")
    }

    "trim whitespace for single element id" in {
      SolrElement.parseId(Some("  air_temperature ")) must equalTo("(air_temperature)")
    }

    "normalize case to make elements case-insensitive" in {
      SolrElement.parseId(Some("aIr_TEmpeRAtUrE ")) must equalTo("(air_temperature)")
    }

    "convert element id list to a list of solr parameters" in {
      SolrElement.parseId(Some("air_temperature")) must equalTo("(air_temperature)")
    }

    "convert element id list to a list of solr parameters" in {
      SolrElement.parseId(Some("air_temperature,max(air_temperature t1h),precipitation_amount")) must
        equalTo("(air_temperature max(air_temperature t1h) precipitation_amount)")
    }

    "trim whitespace in an element id list" in {
      SolrElement.parseId(Some(" air_temperature,   max(air_temperature t1h), precipitation_amount")) must
        equalTo("(air_temperature max(air_temperature t1h) precipitation_amount)")
    }

  }

}

// scalastyle:on
