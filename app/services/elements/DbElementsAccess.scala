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
import play.api.libs.json._
import anorm._
import anorm.SqlParser._
import java.sql.Connection
import javax.inject.Singleton
import scala.language.postfixOps
import scala.util.{ Try, Success, Failure }
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

  private def getLocale(language: Option[String]): String = {
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

    private case class CalcMethodFunInfo(description: Option[String], unit: Option[String])

    private def calcMethodFunInfo(
      function: Option[String], level: Int, elementId: Option[String]): Option[CalcMethodFunInfo] = {
      assert((level == 1) || (level == 2)) // 1 = innermost function, 2 = outermost function
      elementId match {
        case Some(elemId) => {
          function match {
            case Some(f) => {
              if (cmFunInfoMap.contains((f, Some(level), Some(elemId)))) {
                Some(cmFunInfoMap((f, Some(level), Some(elemId))))
              } else if (cmFunInfoMap.contains((f, None, Some(elemId)))) {
                Some(cmFunInfoMap((f, None, Some(elemId))))
              } else if (cmFunInfoMap.contains((f, Some(level), None))) {
                Some(cmFunInfoMap((f, Some(level), None)))
              } else if (cmFunInfoMap.contains((f, None, None))) {
                Some(cmFunInfoMap((f, None, None)))
              } else {
                None
              }
            }
            case None => None
          }
        }
        case None => None
      }
    }

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

      val calcMethod = oid match {
        case Some(id) => id match {
          // note order of matching from most specific to least specific
          case pattern6(f2, f1, b, p1, p2, t2) => Some(CalcMethod(
            Some(b.trim), None, Some(f1.trim), Some(f2.trim), Some(p1.trim), Some(p2.trim), Some(t2.trim), None, None, None, None
          ))
          case pattern5(f2, f1, b, p1, p2) => Some(CalcMethod(
            Some(b.trim), None, Some(f1.trim), Some(f2.trim), Some(p1.trim), Some(p2.trim), None, None, None, None, None
          ))
          case pattern4(f1, b, sb, p1) => Some(CalcMethod(
            Some(b.trim), Some(sb.trim), Some(f1.trim), None, Some(p1.trim), None, None, None, None, None, None
          ))
          case pattern3(f1, b, p1) => Some(CalcMethod(
            Some(b.trim), None, Some(f1.trim), None, Some(p1.trim), None, None, None, None, None, None
          ))
          case pattern2(f1, b) => Some(CalcMethod(
            Some(b.trim), None, Some(f1.trim), None, None, None, None, None, None, None, None
          ))
          case pattern1(b) => Some(CalcMethod(
            Some(b.trim), None, None, None, None, None, None, None, None, None, None
          ))
          case _ => None
        }
        case None => None
      }

      // insert description and unit of function1 and function2
      calcMethod match {
        case Some(cm) => {
          val cmfi1 = calcMethodFunInfo(cm.function1, 1, oid)
          val cmfi2 = calcMethodFunInfo(cm.function2, 2, oid)
          Some(cm.copy(
            descrFunction1 = if (cmfi1.nonEmpty) cmfi1.get.description else None,
            descrFunction2 = if (cmfi2.nonEmpty) cmfi2.get.description else None,
            unitFunction1 = if (cmfi1.nonEmpty) cmfi1.get.unit else None,
            unitFunction2 = if (cmfi2.nonEmpty) cmfi2.get.unit else None
          ))
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
        |  cfconvention_basename AS cf_standardname,
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
        get[Option[String]]("cf_standardname") ~
        get[Option[String]]("cf_cellmethod") ~
        get[Option[String]]("cf_unit") ~
        get[Option[String]]("cf_status") map {
        case id~name~description~unit~codeTable~status~baseName~category~legacyCodes~legacyUnit~cfStandardName~cfCellMethod~cfUnit~cfStatus
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
              None
            } else {
              Some(LegacyMetNoConvention(Some(lcseq.map(_.get.trim).sorted), legacyUnit))
            }
          } else {
            None
          },
          if (cfStandardName.nonEmpty) {
            Some(CfConvention(cfStandardName, cfCellMethod, cfUnit, cfStatus))
          } else {
            None
          }
        )
      }
    }

    private def loadCMFunInfoMap(locale: String): Map[(String, Option[Int], Option[String]), CalcMethodFunInfo] = {
      val parser: RowParser[((String, Option[Int], Option[String]), CalcMethodFunInfo)] = {
        get[String]("function") ~
          get[Option[Int]]("level") ~
          get[Option[String]]("element_id") ~
          get[Option[String]]("description") ~
          get[Option[String]]("unit") map {
          case function~level~elementId~description~unit => ((function, level, elementId), CalcMethodFunInfo(description, unit))
        }
      }

      val query =
        // ### Note: in the future, columns 'level' and 'element_id' could be added to calculation_method to provide
        // extra context for the function: A non-null value for any of these columns indicates that the description
        // and unit applies when the function appears in this context only. This way, a given function name can have
        // different descriptions and/or units in different contexts. Conversely, if a given function is only registered
        // with a null value for description, the description applies globally for this function. Ditto for unit.
        s"""
           |SELECT method_id AS function,
           |  NULL AS level, /* ### remove 'NULL AS' when smallint column 'level' is added */
           |  NULL AS element_id, /* ### ditto for text column 'element_id' */
           |  description,
           |  method_unit AS unit
           |FROM calculation_method
           |WHERE description_locale='$locale';
          """.stripMargin

      DB.withConnection("elements") { implicit connection =>
        SQL(query).as(parser *).toMap
      }

      // for now:
      //Map[(String, Option[Int], Option[String]), CalcMethodFunInfo](("min", None, None) -> CalcMethodFunInfo(Some("descr of min() ..."), None))
    }

    // scalastyle:off null
    private var cmFunInfoMap: Map[(String, Option[Int], Option[String]), CalcMethodFunInfo] = null
    // scalastyle:on null

    private case class CalcMethodQueryParams(
      baseNames: Option[String] = None,
      secondaryBaseNames: Option[String] = None,
      function1s: Option[String] = None,
      function2s: Option[String] = None,
      period1s: Option[String] = None,
      period2s: Option[String] = None,
      threshold2s: Option[String] = None,
      descrFunction1s: Option[String] = None,
      descrFunction2s: Option[String] = None,
      unitFunction1s: Option[String] = None,
      unitFunction2s: Option[String] = None
    )

    private def allKeys(json: JsValue): collection.Set[String] = json match {
      case o: JsObject => o.keys ++ o.values.flatMap(allKeys)
      case JsArray(as) => as.flatMap(allKeys).toSet
      case _ => Set()
    }

    private def keyToVal(jsval: JsValue, key: String): Option[String] = {
      Try((jsval \ key).get) match {
        case Success(x) => Some({
          val pattern = """^[^\"]*\"(.*)\"[^\"]*$""".r
          x.toString match {
            case pattern(s) => s // strip away a pair of leading and trailing double quotes
            case s => s
          }
        })
        case Failure(_) => None
      }
    }

    private def addMissingObjectBraces(s: String) = {
      val pattern = """^\s*\{(.*)\}\s*$""".r
      s match {
        case pattern(body) => s
        case _ => s"{$s}"
      }
    }

    // Parses JSON structure cm and returns a valid CalcMethodQueryParams object. Throws BadRequestException upon error.
    private def parseCalcMethodQueryParams(calculationMethod: Option[String]): CalcMethodQueryParams = {
      calculationMethod match {
        case Some(cm) => {
          Try(Json.parse(addMissingObjectBraces(cm))) match {
            case Success(json) => {

              // check for unsupported keys
              val suppKeys = Seq(
                "baseNames", "secondaryBaseNames", "function1s", "function2s", "period1s", "period2s", "threshold2s",
                "descrFunction1s", "descrFunction2s", "unitFunction1s", "unitFunction2s")
              val unsuppKeys = allKeys(json).map((s: String) => s.toLowerCase) -- suppKeys.toSet.map((s: String) => s.toLowerCase)
              if (unsuppKeys.nonEmpty) {
                throw new BadRequestException(
                  s"Unsupported key(s) in JSON structure for calculationMethod: ${unsuppKeys.mkString(", ")}. Supported keys: ${suppKeys.mkString(", ")}")
              }

              CalcMethodQueryParams(
                baseNames = keyToVal(json, "baseNames"),
                secondaryBaseNames = keyToVal(json, "secondaryBaseNames"),
                function1s = keyToVal(json, "function1s"),
                function2s = keyToVal(json, "function2s"),
                period1s = keyToVal(json, "period1s"),
                period2s = keyToVal(json, "period2s"),
                threshold2s = keyToVal(json, "threshold2s"),
                descrFunction1s = keyToVal(json, "descrFunction1s"),
                descrFunction2s = keyToVal(json, "descrFunction2s"),
                unitFunction1s = keyToVal(json, "unitFunction1s"),
                unitFunction2s = keyToVal(json, "unitFunction2s")
              )
            }
            case Failure(e) => throw new BadRequestException(s"Failed to parse JSON structure for calculationMethod: ${e.getLocalizedMessage}")
          }
        }
        case None => CalcMethodQueryParams()
      }
    }

    // scalastyle:off cyclomatic.complexity
    // scalastyle:off method.length
    def apply(qp: ElementsQueryParameters): List[Element] = {

      // ### Note: The reason why query parameters related to the calculation method are kept in a CalcMethodQueryParams object rather than directly
      // among the other parameters in the ElementsQueryParameters object is that the query string of the HTTP GET request has a limit of 22 parameters.
      // This seems be related to a similar restriction to the length of a tuple in the current version of Scala (2.11.6).
      val cmqp: CalcMethodQueryParams = parseCalcMethodQueryParams(qp.calculationMethod)

      val fields: Set[String] = FieldSpecification.parse(qp.fields)
      val suppFields = Set(
        "id", "name", "description", "unit", "codeTable", "status", "baseName", "cmBaseName", "cmSecondaryBaseName",
        "cmFunction1", "cmFunction2", "cmPeriod1", "cmPeriod2", "cmThreshold2", "cmDescrfunction1", "cmDescrFunction2",
        "cmUnitFunction1", "cmUnitFunction2", "category", "legacyElementCodes", "legacyUnit", "cfStandardName", "cfCellMethod",
        "cfUnit", "cfStatus")
      val suppFieldsLC = suppFields.map(_.toLowerCase)
      fields.foreach(f => if (!suppFieldsLC.contains(f.toLowerCase)) {
        throw new BadRequestException(s"Unsupported field: $f", Some(s"Supported fields: ${suppFields.mkString(", ")}"))
      })

      val locale = getLocale(qp.lang)

      cmFunInfoMap = loadCMFunInfoMap(locale)

      val elems = DB.withConnection("elements") { implicit connection =>
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
      val omitCMBaseName = fields.nonEmpty && !fields.contains("cmbasename")
      val omitCMSecondaryBaseName = fields.nonEmpty && !fields.contains("cmsecondarybasename")
      val omitCMFunction1 = fields.nonEmpty && !fields.contains("cmfunction1")
      val omitCMFunction2 = fields.nonEmpty && !fields.contains("cmfunction2")
      val omitCMPeriod1 = fields.nonEmpty && !fields.contains("cmperiod1")
      val omitCMPeriod2 = fields.nonEmpty && !fields.contains("cmperiod2")
      val omitCMThreshold2 = fields.nonEmpty && !fields.contains("cmthreshold2")
      val omitCMDescrFunction1 = fields.nonEmpty && !fields.contains("cmdescrfunction1")
      val omitCMDescrFunction2 = fields.nonEmpty && !fields.contains("cmdescrfunction2")
      val omitCMUnitFunction1 = fields.nonEmpty && !fields.contains("cmunitfunction1")
      val omitCMUnitFunction2 = fields.nonEmpty && !fields.contains("cmunitfunction2")
      val omitCategory = fields.nonEmpty && !fields.contains("category")
      val omitLegacyElemCodes = fields.nonEmpty && !fields.contains("legacyelemcodes")
      val omitLegacyUnit = fields.nonEmpty && !fields.contains("legacyunit")
      val omitCfStandardName = fields.nonEmpty && !fields.contains("cfstandardname")
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
        .filter(e => if (e.calculationMethod.isEmpty) {
          // keep iff none of the relevant fields are requested
          cmqp.baseNames.getOrElse("").trim.isEmpty &&
            cmqp.secondaryBaseNames.getOrElse("").trim.isEmpty &&
            cmqp.function1s.getOrElse("").trim.isEmpty &&
            cmqp.function2s.getOrElse("").trim.isEmpty &&
            cmqp.period1s.getOrElse("").trim.isEmpty &&
            cmqp.period2s.getOrElse("").trim.isEmpty &&
            cmqp.threshold2s.getOrElse("").trim.isEmpty &&
            cmqp.descrFunction1s.getOrElse("").trim.isEmpty &&
            cmqp.descrFunction2s.getOrElse("").trim.isEmpty &&
            cmqp.unitFunction1s.getOrElse("").trim.isEmpty &&
            cmqp.unitFunction2s.getOrElse("").trim.isEmpty
        } else {
          val cm = e.calculationMethod.get
          MatcherUtil.matchesWords1(cm.baseName, cmqp.baseNames) &&
          MatcherUtil.matchesWords1(cm.secondaryBaseName, cmqp.secondaryBaseNames) &&
            MatcherUtil.matchesWords1(cm.function1, cmqp.function1s) &&
            MatcherUtil.matchesWords1(cm.function2, cmqp.function2s) &&
            MatcherUtil.matchesWords1(cm.period1, cmqp.period1s) &&
            MatcherUtil.matchesWords1(cm.period2, cmqp.period2s) &&
            MatcherUtil.matchesWords1(cm.threshold2, cmqp.threshold2s) &&
            MatcherUtil.matchesWords1(cm.descrFunction1, cmqp.descrFunction1s) &&
            MatcherUtil.matchesWords1(cm.descrFunction2, cmqp.descrFunction2s) &&
            MatcherUtil.matchesWords1(cm.unitFunction1, cmqp.unitFunction1s) &&
            MatcherUtil.matchesWords1(cm.unitFunction2, cmqp.unitFunction2s)
        })
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
          qp.cfStandardNames.getOrElse("").trim.isEmpty &&
            qp.cfCellMethods.getOrElse("").trim.isEmpty &&
            qp.cfUnits.getOrElse("").trim.isEmpty &&
            qp.cfStatuses.getOrElse("").trim.isEmpty
        } else {
          val cfc = e.cfConvention.get
          MatcherUtil.matchesWords1(cfc.standardName, qp.cfStandardNames) &&
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
          calculationMethod = if (omitCMBaseName && omitCMSecondaryBaseName && omitCMFunction1
            && omitCMFunction2 && omitCMPeriod1 && omitCMPeriod2 && omitCMThreshold2 && omitCMDescrFunction1
            && omitCMDescrFunction2 && omitCMUnitFunction1 && omitCMUnitFunction2) {
            None // no fields requsted, so omit object
          } else {
            // at least one field requested
            {
              e.calculationMethod match {
                case Some(cm) => Some(cm.copy( // fields available, so output the requested ones
                  baseName = if (omitCMBaseName) None else cm.baseName,
                  secondaryBaseName = if (omitCMSecondaryBaseName) None else cm.secondaryBaseName,
                  function1 = if (omitCMFunction1) None else cm.function1,
                  function2 = if (omitCMFunction2) None else cm.function2,
                  period1 = if (omitCMPeriod1) None else cm.period1,
                  period2 = if (omitCMPeriod2) None else cm.period2,
                  threshold2 = if (omitCMThreshold2) None else cm.threshold2,
                  descrFunction1 = if (omitCMDescrFunction1) None else cm.descrFunction1,
                  descrFunction2 = if (omitCMDescrFunction2) None else cm.descrFunction2,
                  unitFunction1 = if (omitCMUnitFunction1) None else cm.unitFunction1,
                  unitFunction2 = if (omitCMUnitFunction2) None else cm.unitFunction2
                ))
                case None => None // no fields available, so omit object
              }
            } match {
              case Some(cm) if (cm.baseName.nonEmpty
                || cm.secondaryBaseName.nonEmpty
                || cm.secondaryBaseName.nonEmpty
                || cm.function1.nonEmpty
                || cm.function2.nonEmpty
                || cm.period1.nonEmpty
                || cm.period2.nonEmpty
                || cm.threshold2.nonEmpty
                || cm.descrFunction1.nonEmpty
                || cm.descrFunction2.nonEmpty
                || cm.unitFunction1.nonEmpty
                || cm.unitFunction2.nonEmpty) => Some(cm)
              case _ => None
            }
          },
          category = if (omitCategory) None else e.category,
          legacyConvention = if (omitLegacyElemCodes && omitLegacyUnit) {
            None // no fields requsted, so omit object
          } else {
            // at least one field requested
            e.legacyConvention match {
              case Some(lc) => Some(lc.copy( // fields available, so output the requested ones
                elementCodes = if (omitLegacyElemCodes) None else lc.elementCodes,
                unit = if (omitLegacyUnit) None else lc.unit
              ))
              case None => None // no fields available, so omit object
            }
          },
          cfConvention = if (omitCfStandardName && omitCfCellMethod && omitCfUnit && omitCfStatus) {
            None // no fields requsted, so omit object
          } else {
            // at least one field requested
            e.cfConvention match {
              case Some(cc) => Some(cc.copy( // fields available, so output the requested ones
                standardName = if (omitCfStandardName) None else cc.standardName,
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
          case Some(cfc) => cfc.standardName.getOrElse("").toLowerCase;
          case None => ""
        }
        )
      )

    }

    // scalastyle:on cyclomatic.complexity
    // scalastyle:on method.length

  }


  private object codeTablesExec {

    private def loadCodeTables(locale: String): List[CodeTable] = {
      val parser: RowParser[CodeTable] = {
        get[String]("id") ~
          get[Option[String]]("description") ~
          get[Option[String]]("additionalInfo") map {
          case id~description~additionalInfo => CodeTable(id, description, additionalInfo, None)
        }
      }

      val query =
        s"""
           |SELECT codetable_id AS id,
           |  description,
           |  additional_info AS additionalInfo
           |FROM codetable_description
           |WHERE description_locale='$locale';
          """.stripMargin

      DB.withConnection("elements") { implicit connection =>
        SQL(query).as(parser *)
      }
    }

    private def loadCodeTableValueMap(locale: String): Map[String, Seq[CodeTableValue]] = {
      val parser: RowParser[(String, Seq[CodeTableValue])] = {
        get[String]("id") ~
          get[List[String]]("values") ~
          get[List[Option[String]]]("descriptions") ~
          get[List[Option[String]]]("additionalInfos") map {
          case ctid~values~descriptions~additionalInfos => (
            ctid,
            (values, descriptions, additionalInfos).zipped.toList.map(
              (x: (String, Option[String], Option[String])) => CodeTableValue(x._1, x._2, x._3))
            )
        }
      }

      val query =
        s"""
           |SELECT codetable_id AS id,
           |  array_agg(value) AS values,
           |  array_agg(meaning) AS descriptions,
           |  array_agg(additional_info) AS additionalInfos
           |FROM codetable_entry
           |WHERE meaning_locale='$locale'
           |GROUP BY codetable_id;
          """.stripMargin

      val vmap: Map[String, Seq[CodeTableValue]] = DB.withConnection("elements") { implicit connection =>
        SQL(query).as(parser *).toMap
      }

      vmap.map(item => (
        item._1,
        item._2.sortBy(ctv =>
          Try(ctv.value.toInt) match {
            case Success(v) => v // sort by integer value if possible
            case _ => 0 // otherwise, don't sort
          })
        ))
    }

    // scalastyle:off cyclomatic.complexity
    // scalastyle:off method.length
    def apply(qp: CodeTablesQueryParameters): List[CodeTable] = {

      val fields: Set[String] = FieldSpecification.parse(qp.fields)
      val suppFields = Set("header")
      val suppFieldsLC = suppFields.map(_.toLowerCase)
      fields.foreach(f => if (!suppFieldsLC.contains(f.toLowerCase)) {
        throw new BadRequestException(s"Unsupported field: $f", Some(s"Supported fields: ${suppFields.mkString(", ")}"))
      })

      val locale = getLocale(qp.lang)

      val codeTables: List[CodeTable] = loadCodeTables(locale)
      val codeTableValueMap: Map[String, Seq[CodeTableValue]] = loadCodeTableValueMap(locale)

      val ctabs: List[CodeTable] = codeTables.map(ct =>
        ct.copy(
          values = if (codeTableValueMap.contains(ct.id)) Some(codeTableValueMap(ct.id)) else None
        )
      )

      val omitValues = fields.contains("header")

      ctabs
        .filter(ct => MatcherUtil.matchesWords1(Some(ct.id), qp.ids))
        .map(ct => ct.copy(
          values = if (omitValues) None else ct.values
        ))
        .distinct // eliminate duplicates
        .sortBy(ct => (
        ct.id.toLowerCase
        )
      )

    }

    // scalastyle:on cyclomatic.complexity
    // scalastyle:on method.length

  }


  override def elements(qp: ElementsQueryParameters): List[Element] = elementsExec(qp)
  override def codeTables(qp: CodeTablesQueryParameters): List[CodeTable] = codeTablesExec(qp)
}

// $COVERAGE-ON$
