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


  private object JsonUtils {
    def toLowerCase(js: JsValue): JsValue = js match {
      case JsObject(fields) => JsObject(fields.map { case (k, v) => (k.toLowerCase(), toLowerCase(v)) })
      case x => x
    }
  }


  private object elementsExec {

    private case class CalcMethodFunInfo(description: Option[String], unit: Option[String])

    private def calcMethodFunInfo(
      function: Option[String], inner: Boolean, elementId: Option[String]): Option[CalcMethodFunInfo] = {
      elementId match {
        case Some(elemId) => {
          function match {
            case Some(f) => {
              if (cmFunInfoMap.contains((f, Some(inner), Some(elemId)))) {
                Some(cmFunInfoMap((f, Some(inner), Some(elemId))))
              } else if (cmFunInfoMap.contains((f, None, Some(elemId)))) {
                Some(cmFunInfoMap((f, None, Some(elemId))))
              } else if (cmFunInfoMap.contains((f, Some(inner), None))) {
                Some(cmFunInfoMap((f, Some(inner), None)))
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
      // m  = method
      // im = inner method
      // p  = period
      // ip = inner period
      // t  = threshold

      // m(im(b ip) p t)
      val pattern1 =
        """^([^\(]+)\(([^\(]+)\(\s*([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$""".r

      // m(im(b ip) p)
      val pattern2 =
        """^([^\(]+)\(([^\(]+)\(\s*([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s+([^\s\(\)]+)\s*\)\s*$""".r

      // m(b p)
      val pattern3 =
        """^([^\(]+)\(\s*([^\s\(\)]+)\s+([^\s\(\)]+)\)\s*$""".r

      // m(b)
      val pattern4 =
        """^([^\(]+)\(\s*([^\s\(\)]+)\)\s*$""".r

      // b
      val pattern5 =
        """^\s*([^\s\(\)]+)\s*$""".r

      val calcMethod = oid match {
        case Some(id) => id match {
          // note order of matching from most specific to least specific
          case pattern1(m, im, b, ip, p, t) => Some(CalcMethod(
            Some(b.trim), Some(m.trim), Some(im.trim), Some(p.trim), Some(ip.trim), Some(t.trim), None, None, None, None
          ))
          case pattern2(m, im, b, ip, p) => Some(CalcMethod(
            Some(b.trim), Some(m.trim), Some(im.trim), Some(p.trim), Some(ip.trim), None, None, None, None, None
          ))
          case pattern3(m, b, p) => Some(CalcMethod(
            Some(b.trim), Some(m.trim), None, Some(p.trim), None, None, None, None, None, None
          ))
          case pattern4(m, b) => Some(CalcMethod(
            Some(b.trim), Some(m.trim), None, None, None, None, None, None, None, None
          ))
          case pattern5(b) => Some(CalcMethod(
            Some(b.trim), None, None, None, None, None, None, None, None, None
          ))
          case _ => None
        }
        case None => None
      }

      // insert description and unit of innerMethod and method
      calcMethod match {
        case Some(cm) => {
          val cmfiInner = calcMethodFunInfo(cm.innerMethod, true, oid)
          val cmfiOuter = calcMethodFunInfo(cm.method, false, oid)
          Some(cm.copy(
            innerMethodDescription = if (cmfiInner.nonEmpty) cmfiInner.get.description else None,
            methodDescription = if (cmfiOuter.nonEmpty) cmfiOuter.get.description else None,
            innerMethodUnit = if (cmfiInner.nonEmpty) cmfiInner.get.unit else None,
            methodUnit = if (cmfiOuter.nonEmpty) cmfiOuter.get.unit else None
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
        get[Option[String]]("category") ~
        get[Option[Array[Option[String]]]]("legacy_elemcodes") ~
        get[Option[String]]("legacy_unit") ~
        get[Option[String]]("cf_standardname") ~
        get[Option[String]]("cf_cellmethod") ~
        get[Option[String]]("cf_unit") ~
        get[Option[String]]("cf_status") map {
        case id~name~description~unit~codeTable~status~category~legacyCodes~legacyUnit~cfStandardName~cfCellMethod~cfUnit~cfStatus
        => Element(
          id,
          name,
          description,
          unit,
          codeTable,
          status,
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

    private def loadCMFunInfoMap(locale: String): Map[(String, Option[Boolean], Option[String]), CalcMethodFunInfo] = {
      val parser: RowParser[((String, Option[Boolean], Option[String]), CalcMethodFunInfo)] = {
        get[String]("function") ~
          get[Option[Boolean]]("inner") ~
          get[Option[String]]("element_id") ~
          get[Option[String]]("description") ~
          get[Option[String]]("unit") map {
          case function~inner~elementId~description~unit => ((function, inner, elementId), CalcMethodFunInfo(description, unit))
        }
      }

      val query =
        // ### Note: in the future, columns 'inner' and 'element_id' could be added to calculation_method to provide
        // extra context for the function: A non-null value for any of these columns indicates that the description
        // and unit applies when the function appears in this context only. This way, a given function name can have
        // different descriptions and/or units in different contexts. Conversely, if a given function is only registered
        // with a null value for description, the description applies globally for this function. Ditto for unit.
        s"""
           |SELECT method_id AS function,
           |  NULL AS inner, /* ### remove 'NULL AS' when boolean column 'inner' is added */
           |  NULL AS element_id, /* ### ditto for text column 'element_id' */
           |  description,
           |  method_unit AS unit
           |FROM calculation_method
           |WHERE description_locale='$locale';
          """.stripMargin

      DB.withConnection("elements") { implicit connection =>
        SQL(query).as(parser *).toMap
      }
    }

    // scalastyle:off null
    private var cmFunInfoMap: Map[(String, Option[Boolean], Option[String]), CalcMethodFunInfo] = null
    // scalastyle:on null

    private case class CalcMethodQueryParams(
      baseNames: Option[String] = None,
      methods: Option[String] = None,
      innerMethods: Option[String] = None,
      periods: Option[String] = None,
      innerPeriods: Option[String] = None,
      thresholds: Option[String] = None,
      methodDescriptions: Option[String] = None,
      innerMethodDescriptions: Option[String] = None,
      methodUnits: Option[String] = None,
      innerMethodUnits: Option[String] = None
    )

    private def allKeys(json: JsValue): collection.Set[String] = json match {
      case o: JsObject => o.keys ++ o.values.flatMap(allKeys)
      case JsArray(as) => as.flatMap(allKeys).toSet
      case _ => Set()
    }

    private def keyToVal(jsval: JsValue, key: String): Option[String] = {
      Try((JsonUtils.toLowerCase(jsval) \ key.toLowerCase).get) match {
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
                "baseNames", "methods", "innerMethods", "periods", "innerPeriods", "thresholds",
                "methodDescriptions", "innerMethodDescriptions", "methodUnits", "innerMethodUnits")
              val unsuppKeys = allKeys(json).map((s: String) => s.toLowerCase) -- suppKeys.toSet.map((s: String) => s.toLowerCase)
              if (unsuppKeys.nonEmpty) {
                throw new BadRequestException(
                  s"Unsupported key(s) in JSON structure for calculationMethod: ${unsuppKeys.mkString(", ")}. Supported keys: ${suppKeys.mkString(", ")}")
              }

              CalcMethodQueryParams(
                baseNames = keyToVal(json, "baseNames"),
                methods = keyToVal(json, "methods"),
                innerMethods = keyToVal(json, "innerMethods"),
                periods = keyToVal(json, "periods"),
                innerPeriods = keyToVal(json, "innerPeriods"),
                thresholds = keyToVal(json, "thresholds"),
                methodDescriptions = keyToVal(json, "methodDescriptions"),
                innerMethodDescriptions = keyToVal(json, "innerMethodDescriptions"),
                methodUnits = keyToVal(json, "methodUnits"),
                innerMethodUnits = keyToVal(json, "innerMethodUnits")
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
        "id", "name", "description", "unit", "codeTable", "status", "baseName", "cmBaseName",
        "cmMethod", "cmInnerMethod", "cmPeriod", "cmInnerPeriod", "cmThreshold", "cmMethodDescription", "cmInnerMethodDescription",
        "cmMethodUnit", "cmInnerMethodUnit", "category", "legacyElementCodes", "legacyUnit", "cfStandardName", "cfCellMethod",
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
      val omitCMMethod = fields.nonEmpty && !fields.contains("cmmethod")
      val omitCMInnerMethod = fields.nonEmpty && !fields.contains("cminnermethod")
      val omitCMPeriod = fields.nonEmpty && !fields.contains("cmperiod")
      val omitCMInnerPeriod = fields.nonEmpty && !fields.contains("cminnerperiod")
      val omitCMThreshold = fields.nonEmpty && !fields.contains("cmthreshold")
      val omitCMMethodDescription = fields.nonEmpty && !fields.contains("cmmethoddescription")
      val omitCMInnerMethodDescription = fields.nonEmpty && !fields.contains("cminnermethoddescription")
      val omitCMMethodUnit = fields.nonEmpty && !fields.contains("cmmethodunit")
      val omitCMInnerMethodUnit = fields.nonEmpty && !fields.contains("cminnermethodunit")
      val omitCategory = fields.nonEmpty && !fields.contains("category")
      val omitLegacyElemCodes = fields.nonEmpty && !fields.contains("legacyelementcodes")
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
        .filter(e => if (e.calculationMethod.isEmpty) {
          // keep iff none of the relevant fields are requested
          cmqp.baseNames.getOrElse("").trim.isEmpty &&
            cmqp.methods.getOrElse("").trim.isEmpty &&
            cmqp.innerMethods.getOrElse("").trim.isEmpty &&
            cmqp.periods.getOrElse("").trim.isEmpty &&
            cmqp.innerPeriods.getOrElse("").trim.isEmpty &&
            cmqp.thresholds.getOrElse("").trim.isEmpty &&
            cmqp.methodDescriptions.getOrElse("").trim.isEmpty &&
            cmqp.innerMethodDescriptions.getOrElse("").trim.isEmpty &&
            cmqp.methodUnits.getOrElse("").trim.isEmpty &&
            cmqp.innerMethodUnits.getOrElse("").trim.isEmpty
        } else {
          val cm = e.calculationMethod.get
          MatcherUtil.matchesWords1(cm.baseName, cmqp.baseNames) &&
            MatcherUtil.matchesWords1(cm.method, cmqp.methods) &&
            MatcherUtil.matchesWords1(cm.innerMethod, cmqp.innerMethods) &&
            MatcherUtil.matchesWords1(cm.period, cmqp.periods) &&
            MatcherUtil.matchesWords1(cm.innerPeriod, cmqp.innerPeriods) &&
            MatcherUtil.matchesWords1(cm.threshold, cmqp.thresholds) &&
            MatcherUtil.matchesWords1(cm.methodDescription, cmqp.methodDescriptions) &&
            MatcherUtil.matchesWords1(cm.innerMethodDescription, cmqp.innerMethodDescriptions) &&
            MatcherUtil.matchesWords1(cm.methodUnit, cmqp.methodUnits) &&
            MatcherUtil.matchesWords1(cm.innerMethodUnit, cmqp.innerMethodUnits)
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
          calculationMethod = if (omitCMBaseName && omitCMMethod
            && omitCMInnerMethod && omitCMPeriod && omitCMInnerPeriod && omitCMThreshold && omitCMMethodDescription
            && omitCMInnerMethodDescription && omitCMMethodUnit && omitCMInnerMethodUnit) {
            None // no fields requsted, so omit object
          } else {
            // at least one field requested
            {
              e.calculationMethod match {
                case Some(cm) => Some(cm.copy( // fields available, so output the requested ones
                  baseName = if (omitCMBaseName) None else cm.baseName,
                  method = if (omitCMMethod) None else cm.method,
                  innerMethod = if (omitCMInnerMethod) None else cm.innerMethod,
                  period = if (omitCMPeriod) None else cm.period,
                  innerPeriod = if (omitCMInnerPeriod) None else cm.innerPeriod,
                  threshold = if (omitCMThreshold) None else cm.threshold,
                  methodDescription = if (omitCMMethodDescription) None else cm.methodDescription,
                  innerMethodDescription = if (omitCMInnerMethodDescription) None else cm.innerMethodDescription,
                  methodUnit = if (omitCMMethodUnit) None else cm.methodUnit,
                  innerMethodUnit = if (omitCMInnerMethodUnit) None else cm.innerMethodUnit
                ))
                case None => None // no fields available, so omit object
              }
            } match {
              case Some(cm) if (cm.baseName.nonEmpty
                || cm.method.nonEmpty
                || cm.innerMethod.nonEmpty
                || cm.period.nonEmpty
                || cm.innerPeriod.nonEmpty
                || cm.threshold.nonEmpty
                || cm.methodDescription.nonEmpty
                || cm.innerMethodDescription.nonEmpty
                || cm.methodUnit.nonEmpty
                || cm.innerMethodUnit.nonEmpty) => Some(cm)
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
        e.name.getOrElse("").toLowerCase,
        e.unit.getOrElse("").toLowerCase,
        e.codeTable.getOrElse("").toLowerCase,
        e.status.getOrElse("").toLowerCase,
        e.category.getOrElse("").toLowerCase,
        e.cfConvention match {
          case Some(cfc) => cfc.standardName.getOrElse("").toLowerCase
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
          case id~description~additionalInfo => CodeTable(id, description, additionalInfo, -1, None)
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
          size = ct.values.getOrElse(Seq[CodeTableValue]()).size,
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
