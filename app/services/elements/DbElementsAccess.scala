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

import play.api.Play.current
import play.api._
import play.api.db._
import anorm._
import anorm.SqlParser._
import java.sql.Connection
import javax.inject.Singleton
import scala.language.postfixOps
import models._
import no.met.data._


//$COVERAGE-OFF$ Not testing database queries

// ### TBD: Move to util package (used also in records module)
private object MatcherUtil {
  // Returns true iff words is None or w ("" if None) matches any word in the comma-separated list words.
  // The matching is case-insensitive and a word in words is allowed to contain asterisks to represent zero or more characters.
  def matchesWords1(w: Option[String], words: Option[String]): Boolean = {
    words match {
      case Some(wlist) => {
        val w1 = w.getOrElse("").trim.toLowerCase
        wlist.split(",").toSet.exists((w2: String) => w1.matches(w2.trim.toLowerCase.replace("(", "\\(").replace(")", "\\)").replace("*", ".*")))
      }
      case None => true
    }
  }

  // Returns true iff words2 is None or any of the words in words1 (List() if None) matches any word in the comma-separated list words2.
  // The matching is case-insensitive and a word in words2 is allowed to contain asterisks to represent zero or more characters.
  def matchesWordsN(words1: Option[List[String]], words2: Option[String]): Boolean = {
    words2 match {
      case Some(wlist2) => {
        val wset1 = words1.getOrElse(List[String]()).toSet.map((w: String) => w.toLowerCase)
        wlist2.split(",").toSet.exists((w2: String) => {
          val w2pattern = w2.trim.toLowerCase.replace("*", ".*")
          wset1.exists((w1: String) => w1.matches(w2pattern))
        })
      }
      case None => true
    }
  }

}



/**
  * Overall elements access from station sources.
  */
class DbElementsAccess extends ElementsAccess {

  private def getLocale(language: Option[String]) = {
    val suppLangs = Set("en-US", "nb-NO", "nn-NO")
    language match {
      case Some(lang) => {
        if (!suppLangs.contains(lang)) {
          throw new BadRequestException("Invalid language in the query parameter: " + lang, Some(s"Supported languages: ${suppLangs.mkString(", ")}"))
        }
        lang
      }
      case None => "en-US"
    }
  }


  private object elementsExec {

    // Extract the calculation method from an element ID.
    // scalastyle:off method.length
    private def extractCalcMethod(oid: Option[String]): Option[CalcMethod] = {
      // b  = base name
      // sb = secondary base name
      // f1 = innermost function
      // f2 = outermost function
      // p1 = innermost period
      // p2 = outermost period
      // t2 = outermost threshold

      // b
      val pattern1 =
        """^\s*([^\s\(\)]+)\s*$""".r

      // f1(b)
      val pattern2 =
        """^([^\(]+)\(\s*([^\s\(\)]+)\)\s*$""".r

      // f1(b p1)
      val pattern3 =
        """^([^\(]+)\(\s*([^\s\(\)]+)\s+([^\s\(\)]+)\)\s*$""".r

      // f1(b sb p1)
      val pattern4 =
        """^([^\(]+)\(\s*([^\s\(\)]+)\s+([^\s\(\)]+)\s+([^\s\(\)]+)\)\s*$""".r

      // f2(f1(b p1) p2)
      val pattern5 =
        """^([^\(]+)\(([^\(]+)\(\s*([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s+([^\s\(\)]+)\s*\)\s*$""".r

      // f2(f1(b p1) p2 t2)
      val pattern6 =
        """^([^\(]+)\(([^\(]+)\(\s*([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$""".r

      oid match {
        case Some(id) => id match { // note order of matching from most specific to least specific
          case pattern6(f2, f1, b, p1, p2, t2) => Some(CalcMethod(
            Some(b.trim), None, Some(f1.trim), Some(f2.trim), Some(p1.trim), Some(p2.trim), Some(t2.trim)
          ))
          case pattern5(f2, f1, b, p1, p2) => Some(CalcMethod(
            Some(b.trim), None, Some(f1.trim), Some(f2.trim), Some(p1.trim), Some(p2.trim), None
          ))
          case pattern4(f1, b, sb, p1) => Some(CalcMethod(
            Some(b.trim), Some(sb.trim), Some(f1.trim), None, Some(p1.trim), None, None
          ))
          case pattern3(f1, b, p1) => Some(CalcMethod(
            Some(b.trim), None, Some(f1.trim), None, Some(p1.trim), None, None
          ))
          case pattern2(f1, b) => Some(CalcMethod(
            Some(b.trim), None, Some(f1.trim), None, None, None, None
          ))
          case pattern1(b) => Some(CalcMethod(
            Some(b.trim), None, None, None, None, None, None
          ))
          case _ => None
        }
        case None => None
      }
    }

    // scalastyle:on method.length

    private def getQuery(locale: String): String = {
      s"""
        |SELECT
        |  id,
        |  name,
        |  description,
        |  unit,
        |  codetable,
        |  status,
        |  basename,
        |  category,
        |  legacymetnoconvention_elemcodes AS legacy_elemcodes,
        |  legacymetnoconvention_unit AS legacy_unit,
        |  cfconvention_basename AS cf_basename,
        |  cfconvention_cellmethod AS cf_cellmethod,
        |  cfconvention_unit AS cf_unit,
        |  cfconvention_status AS cf_status
        |FROM get_elements_v
        |WHERE locale='$locale'
      """.stripMargin
    }

    private val parser: RowParser[Element] = {
      get[Option[String]]("id") ~
        get[Option[String]]("name") ~
        get[Option[String]]("description") ~
        get[Option[String]]("unit") ~
        get[Option[String]]("codetable") ~
        get[Option[String]]("status") ~
        get[Option[String]]("basename") ~
        get[Option[String]]("category") ~
        get[Option[Array[Option[String]]]]("legacy_elemcodes") ~
        get[Option[String]]("legacy_unit") ~
        get[Option[String]]("cf_basename") ~
        get[Option[String]]("cf_cellmethod") ~
        get[Option[String]]("cf_unit") ~
        get[Option[String]]("cf_status") map {
        case id~name~description~unit~codeTable~status~baseName~category~legacyCodes~legacyUnit~cfBaseName~cfCellMethod~cfUnit~cfStatus
        => Element(
          id,
          name,
          description,
          unit,
          codeTable,
          status,
          baseName,
          extractCalcMethod(id),
          category,
          if (legacyCodes.nonEmpty) {
            val lcseq = legacyCodes.get.toSeq
            if (lcseq.exists(lc => lc.isEmpty)) {
              //Logger.debug(s"undefined legacy code found for element ${id.get}")
              None
            } else {
              Some(LegacyMetNoConvention(Some(lcseq.map(_.get.trim).sorted), legacyUnit))
            }
          } else {
            None
          },
          if (cfBaseName.nonEmpty) {
            Some(CfConvention(cfBaseName, cfCellMethod, cfUnit, cfStatus))
          } else {
            None
          }
        )
      }
    }

    // scalastyle:off cyclomatic.complexity
    // scalastyle:off method.length
    def apply(qp: ElementsQueryParameters): List[Element] = {

      val fields: Set[String] = FieldSpecification.parse(qp.fields)
      val suppFields = Set(
        "id", "name", "description", "unit", "codetable", "status", "basename", "calculationmethod", "category",
        "legacyelementcodes", "legacyunit", "cfbasename", "cfcellmethod", "cfunit", "cfstatus")
      fields.foreach(f => if (!suppFields.contains(f.toLowerCase)) {
        throw new BadRequestException(s"Unsupported field: ${f.toLowerCase}", Some(s"Supported fields: ${suppFields.mkString(", ")}"))
      })


      val elems = DB.withConnection("elements") { implicit connection =>
        val locale = getLocale(qp.lang)
        val query = getQuery(locale)
        //      Logger.debug(query)
        SQL(query).as(parser *)
      }

      val omitId = fields.nonEmpty && !fields.contains("id")
      val omitName = fields.nonEmpty && !fields.contains("name")
      val omitDescription = fields.nonEmpty && !fields.contains("description")
      val omitUnit = fields.nonEmpty && !fields.contains("unit")
      val omitCodeTable = fields.nonEmpty && !fields.contains("codetable")
      val omitStatus = fields.nonEmpty && !fields.contains("status")
      val omitBaseName = fields.nonEmpty && !fields.contains("basename")
      val omitCalcMethod = fields.nonEmpty && !fields.contains("calcmethod")
      val omitCategory = fields.nonEmpty && !fields.contains("category")
      val omitLegacyElemCodes = fields.nonEmpty && !fields.contains("legacyelemcodes")
      val omitLegacyUnit = fields.nonEmpty && !fields.contains("legacyunit")
      val omitCfBaseName = fields.nonEmpty && !fields.contains("cfbasename")
      val omitCfCellMethod = fields.nonEmpty && !fields.contains("cfcellmethod")
      val omitCfUnit = fields.nonEmpty && !fields.contains("cfunit")
      val omitCfStatus = fields.nonEmpty && !fields.contains("cfstatus")

      elems
        .filter(e => MatcherUtil.matchesWords1(e.id, qp.ids))
        .filter(e => MatcherUtil.matchesWords1(e.name, qp.names))
        .filter(e => MatcherUtil.matchesWords1(e.description, qp.descriptions))
        .filter(e => MatcherUtil.matchesWords1(e.unit, qp.units))
        .filter(e => MatcherUtil.matchesWords1(e.codeTable, qp.codeTables))
        .filter(e => MatcherUtil.matchesWords1(e.status, qp.statuses))
        .filter(e => MatcherUtil.matchesWords1(e.baseName, qp.baseNames))
        .filter(e => MatcherUtil.matchesWordsN(
          Some(e.calculationMethod match {
            case Some(cm) => List[String](
              cm.baseName.getOrElse(""),
              cm.secondaryBaseName.getOrElse(""),
              cm.function1.getOrElse(""),
              cm.function2.getOrElse(""),
              cm.period1.getOrElse(""),
              cm.period2.getOrElse(""),
              cm.threshold2.getOrElse("")
            )
            case _ => List[String]()
          }), qp.calculationMethods))
        .filter(e => MatcherUtil.matchesWords1(e.category, qp.categories))
        .filter(e => if (e.legacyConvention.isEmpty) {
          // keep iff none of the relevant fields are requested
          qp.legacyElementCodes.getOrElse("").trim.isEmpty &&
            qp.legacyUnits.getOrElse("").trim.isEmpty
        } else {
          val lmnc = e.legacyConvention.get
          MatcherUtil.matchesWordsN(Some(lmnc.elementCodes.getOrElse(Seq[String]()).toList), qp.legacyElementCodes) &&
            MatcherUtil.matchesWords1(lmnc.unit, qp.legacyUnits)
        })
        .filter(e => if (e.cfConvention.isEmpty) {
          // keep iff none of the relevant fields are requested
          qp.cfBaseNames.getOrElse("").trim.isEmpty &&
            qp.cfCellMethods.getOrElse("").trim.isEmpty &&
            qp.cfUnits.getOrElse("").trim.isEmpty &&
            qp.cfStatuses.getOrElse("").trim.isEmpty
        } else {
          val cfc = e.cfConvention.get
          MatcherUtil.matchesWords1(cfc.baseName, qp.cfBaseNames) &&
            MatcherUtil.matchesWords1(cfc.cellMethod, qp.cfCellMethods) &&
            MatcherUtil.matchesWords1(cfc.unit, qp.cfUnits) &&
            MatcherUtil.matchesWords1(cfc.status, qp.cfStatuses)
        })
        .map(e => e.copy(
          id = if (omitId) None else e.id,
          name = if (omitName) None else e.name,
          description = if (omitDescription) None else e.description,
          unit = if (omitUnit) None else e.unit,
          codeTable = if (omitCodeTable) None else e.codeTable,
          status = if (omitStatus) None else e.status,
          baseName = if (omitBaseName) None else e.baseName,
          calculationMethod = if (omitCalcMethod) None else e.calculationMethod,
          category = if (omitCategory) None else e.category,
          legacyConvention = if (omitLegacyElemCodes && omitLegacyUnit) {
            None // no fields requsted, so omit object
          } else {
            // at least one field requested
            e.legacyConvention match {
              case Some(lc) => Some(lc.copy(// fields available, so output the requested ones
                elementCodes = if (omitLegacyElemCodes) None else lc.elementCodes,
                unit = if (omitLegacyUnit) None else lc.unit
              ))
              case None => None // no fields available, so omit object
            }
          },
          cfConvention = if (omitCfBaseName && omitCfCellMethod && omitCfUnit && omitCfStatus) {
            None // no fields requsted, so omit object
          } else {
            // at least one field requested
            e.cfConvention match {
              case Some(cc) => Some(cc.copy(// fields available, so output the requested ones
                baseName = if (omitCfBaseName) None else cc.baseName,
                cellMethod = if (omitCfCellMethod) None else cc.cellMethod,
                unit = if (omitCfUnit) None else cc.unit,
                status = if (omitCfStatus) None else cc.status
              ))
              case None => None // no fields available, so omit object
            }
          }
        ))
        .distinct // eliminate duplicates
        .sortBy(e => ( // ### max 9 items in this tuple?! TBD: revise this sorting
        e.id.getOrElse("").toLowerCase,
        e.baseName.getOrElse("").toLowerCase,
        e.name.getOrElse("").toLowerCase,
        e.unit.getOrElse("").toLowerCase,
        e.codeTable.getOrElse("").toLowerCase,
        e.status.getOrElse("").toLowerCase,
        e.category.getOrElse("").toLowerCase,
        e.cfConvention match {
          case Some(cfc) => cfc.baseName.getOrElse("").toLowerCase;
          case None => ""
        }
        )
      )

    }

    // scalastyle:on cyclomatic.complexity
    // scalastyle:on method.length

  }


  private object calcMethodFunctionsExec {

    private def getQuery(locale: String): String = {
      s"""
         |SELECT
         |  method_id AS id,
         |  method_unit AS unit,
         |  description
         |FROM calculation_method
         |WHERE description_locale='$locale'
      """.stripMargin
    }

    private val parser: RowParser[CalcMethodFunction] = {
      get[Option[String]]("id") ~
        get[Option[String]]("unit") ~
        get[Option[String]]("description") map {
        case id~unit~description => CalcMethodFunction(id, unit, description)
      }
    }

    def apply(qp: CalcMethodFunctionsQueryParameters): List[CalcMethodFunction] = {

      val fields: Set[String] = FieldSpecification.parse(qp.fields)
      val suppFields = Set("function", "unit", "description")
      fields.foreach(f => if (!suppFields.contains(f.toLowerCase)) {
        throw new BadRequestException(s"Unsupported field: ${f.toLowerCase}", Some(s"Supported fields: ${suppFields.mkString(", ")}"))
      })

      val functions = DB.withConnection("elements") { implicit connection =>
        val locale = getLocale(qp.lang)
        val query = getQuery(locale)
        //      Logger.debug(query)
        SQL(query).as(parser *)
      }

      val omitFunction = fields.nonEmpty && !fields.contains("function")
      val omitUnit = fields.nonEmpty && !fields.contains("unit")
      val omitDescription = fields.nonEmpty && !fields.contains("description")

      functions
        .filter(e => MatcherUtil.matchesWords1(e.function, qp.functions))
        .map(e => e.copy(
          function = if (omitFunction) None else e.function,
          unit = if (omitUnit) None else e.unit,
          description = if (omitDescription) None else e.description
        ))
        .distinct // eliminate duplicates
        .sortBy(e => (
        e.function.getOrElse("").toLowerCase,
        e.unit.getOrElse("").toLowerCase
        ))

      // FOR NOW:
      //List[CalcMethodFunction](CalcMethodFunction(Some("test function"), Some("test unit"), Some("test description")))
    }

  }


  override def elements(qp: ElementsQueryParameters): List[Element] = elementsExec(qp)
  override def calcMethodFunctions(qp: CalcMethodFunctionsQueryParameters): List[CalcMethodFunction] = calcMethodFunctionsExec(qp)
}

// $COVERAGE-ON$
