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

// scalastyle:off line.size.limit

@Singleton
class MockElementsAccess extends ElementsAccess {

  override def elements(qp: ElementsQueryParameters): List[Element] = {
    List(Element(
      Some("dummy id"),
      Some("dummy name"),
      Some("dummy description"),
      Some("dummy unit"),
      Some("dummy code table"),
      Some("dummy status"),
      Some(CalcMethod(None, None, None, None, None, None, None, None, None, None)),
      Some("dummy category"),
      Some(SensorLevels(
        Some("dummy level type"),
        Some("dummy unit"),
        Some(-1),
        Some(Seq(-1, -1)))
      ),
      Some(LegacyMetNoConvention(
        Some(Seq("dummy elemCode 1", "dummy elemCode 2")),
        Some("dummy unit"))
      ),
      Some(CfConvention(
        Some("dummy base name"),
        Some("dummy cell method"),
        Some("dummy unit"),
        Some("dummy status"))
      )
    ))
  }

  override def codeTables(qp: CodeTablesQueryParameters): List[CodeTable] = {
    List(CodeTable(
      "dummy id",
      Some("dummy description"),
      Some("dummy additional info"),
      1,
      Some(Seq[CodeTableValue](CodeTableValue(
        "dummy value",
        Some("dummy description"),
        Some("dummy additional info")
      )))
    ))
  }

}

// scalastyle:on
