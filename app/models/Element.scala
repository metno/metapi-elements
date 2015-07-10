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

/**
 * Representation of a MET API Element.
 *
 * cf and kdvh elements are used for cross-referencing, however it is not
 * required for there to be a mapping to either of those two standards.
 */
case class Element(id: String, siUnit: String, description: String,
    cfName: Option[String], cfUnit: Option[String], cfCellMethods: Option[String],
    kdvhCode: Option[String], kdvhUnit: Option[String], kdvhRef: Option[String])

/**
 * Complete response data set to send to clients
 */
case class ResponseData(header: no.met.data.BasicResponseData, data: Traversable[Element])
