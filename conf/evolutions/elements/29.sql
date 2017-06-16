# --- !Ups


--best_estimate season elements to element, element_name, element_category, element_description, element_status, metno_element, kdvh_element, cf_element
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'mm');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'percent');


Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'Mean temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'Middeltemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'Middeltemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'Mean temperature for season, deviation from normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'Middeltemperatur for årstid, avvik frå normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'Middeltemperatur for årstid, avvik fra normalen', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'Precipitation in season', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'Nedbør i sesong', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'Nedbør i sesong', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'Precipitation for season in percent of normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'Nedbør for årstid i høve til normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'Nedbør for årstid i forhold til normalen', 'nb-NO');

Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'Nedbør', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'Nedbør', 'nn-NO');

Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc).Monthly and season value: Arithmetic mean of daily values.', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18). Månads- og sesnongverdi: Aritmetisk middel av døgn midler.', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18). Måneds- og sesongverdi: Aritmetisk middel av døgn midler.', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'Deviation from present temperature normal (1961-1990)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'Avvik frå gjeldande temperaturnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'Avvik fra gjeldende temperaturnormal (1961-1990)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'Total of precipitation during a season  (precipitation day 06-06 utc)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'Nedbørsum i ein sesong  (nedbørdøgn 07-07)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'Nedbørsum i en sesong (nedbørdøgn 07-07)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'Precipitation in percent of present precipitation normal (1961-1990).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'Nedbør i prosent av gjeldande nedbørnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'Nedbør i prosent av gjeldende nedbørnormal (1961-1990)', 'nb-NO');


Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('best_estimate_mean(air_temperature P3M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'MET-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('best_estimate_mean(air_temperature_anomaly P3M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('best_estimate_sum(precipitation_amount P3M)', 'CF-name');


Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAM', 'degC', 'Temperature', 'best_estimate_mean(air_temperature P3M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAMA', 'degC', 'Temperature', 'best_estimate_mean(air_temperature_anomaly P3M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RR', 'mm', 'Precipitation', 'best_estimate_sum(precipitation_amount P3M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RRA', 'percent', 'Precipitation', 'best_estimate_sum(precipitation_amount_anomaly P3M)');


Insert into METNO_ELEMENT
   (ELEMENT_ID, METNO_NAME)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P3M)', 'precipitation_amount_anomaly');


Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: mean (best estimate)', 'K', '37', 'best_estimate_mean(air_temperature P3M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature_anomaly', 'time: mean (best estimate)', 'K', '37', 'best_estimate_mean(air_temperature_anomaly P3M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('precipitation_amount', 'time: sum (best estimate)', 'kg m-2', '37', 'best_estimate_sum(precipitation_amount P3M)');



--best_estimate: yearly homogenized elements
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'mm');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'percent');


Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'Mean temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'Middeltemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'Middeltemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'Mean temperature in year, deviation from normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'Middeltemperatur for år, avvik frå normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'Middeltemperatur for år, avvik fra normalen', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'Precipitation in year', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'Årsnedbør', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'Årsnedbør', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'Total precipitation in year in percent of normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'Årsnedbør i høve til normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'Årsnedbør i forhold til normalen', 'nb-NO');

Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'Nedbør', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'Nedbør', 'nn-NO');

Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc).  Values for a month, season or year: Arithmetic mean of daily values. ', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18). Månad-, sesong- og årsverdi: Aritmetisk middel av døgn midler. ', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18). Måned-,sesong- og årsverdi: Aritmetisk middel av døgn midler.', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'Deviation from present temperature normal (1961-1990)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'Avvik frå gjeldande temperaturnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'Avvik fra gjeldende temperaturnormal (1961-1990)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'Total of precipitation in year (precipitation day 06-06 utc)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'Årssum for nedbør (nedbørdøgn 07-07)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'Årssum for nedbør (nedbørdøgn 07-07)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'Precipitation in percent of present precipitation normal (1961-1990).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'Nedbør i prosent av gjeldande nedbørnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'Nedbør i prosent av gjeldende nedbørnormal (1961-1990)', 'nb-NO');


Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('best_estimate_mean(air_temperature P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'MET-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('best_estimate_mean(air_temperature_anomaly P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('best_estimate_sum(precipitation_amount P1Y)', 'CF-name');


Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAM', 'degC', 'Temperature', 'best_estimate_mean(air_temperature P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAMA', 'degC', 'Temperature', 'best_estimate_mean(air_temperature_anomaly P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RR', 'mm', 'Precipitation', 'best_estimate_sum(precipitation_amount P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RRA', 'percent', 'Precipitation', 'best_estimate_sum(precipitation_amount_anomaly P1Y)');


Insert into METNO_ELEMENT
   (ELEMENT_ID, METNO_NAME)
 Values
   ('best_estimate_sum(precipitation_amount_anomaly P1Y)', 'precipitation_amount_anomaly');


Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: mean (best estimate)', 'K', '37', 'best_estimate_mean(air_temperature P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature_anomaly', 'time: mean (best estimate)', 'K', '37', 'best_estimate_mean(air_temperature_anomaly P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('precipitation_amount', 'time: sum (best estimate)', 'kg m-2', '37', 'best_estimate_sum(precipitation_amount P1Y)');


--Insert season elements to element, element_name, element_category, element_description, element_status, metno_element, kdvh_element, cf_element
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(air_temperature P3M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(air_temperature_anomaly P3M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('sum(precipitation_amount P3M)', 'mm');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'percent');


Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature P3M)', 'Mean temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature P3M)', 'Middeltemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature P3M)', 'Middeltemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature_anomaly P3M)', 'Mean temperature for season, deviation from normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature_anomaly P3M)', 'Middeltemperatur for årstid, avvik frå normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature_anomaly P3M)', 'Middeltemperatur for årstid, avvik fra normalen', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount P3M)', 'Precipitation in season', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount P3M)', 'Nedbør i sesong', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount P3M)', 'Nedbør i sesong', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'Precipitation for season in percent of normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'Nedbør for årstid i høve til normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'Nedbør for årstid i forhold til normalen', 'nb-NO');

Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature P3M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature_anomaly P3M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount P3M)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature P3M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature_anomaly P3M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount P3M)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature P3M)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature_anomaly P3M)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount P3M)', 'Nedbør', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'Nedbør', 'nn-NO');

Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature P3M)', 'Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc).Monthly and season value: Arithmetic mean of daily values.', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature P3M)', 'Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18). Månads- og sesnongverdi: Aritmetisk middel av døgn midler.', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature P3M)', 'Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18). Måneds- og sesongverdi: Aritmetisk middel av døgn midler.', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature_anomaly P3M)', 'Deviation from present temperature normal (1961-1990)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature_anomaly P3M)', 'Avvik frå gjeldande temperaturnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature_anomaly P3M)', 'Avvik fra gjeldende temperaturnormal (1961-1990)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount P3M)', 'Total of precipitation during a season  (precipitation day 06-06 utc)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount P3M)', 'Nedbørsum i ein sesong  (nedbørdøgn 07-07)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount P3M)', 'Nedbørsum i en sesong (nedbørdøgn 07-07)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'Precipitation in percent of present precipitation normal (1961-1990).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'Nedbør i prosent av gjeldande nedbørnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'Nedbør i prosent av gjeldende nedbørnormal (1961-1990)', 'nb-NO');


Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(air_temperature P3M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'MET-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(air_temperature_anomaly P3M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('sum(precipitation_amount P3M)', 'CF-name');


Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAM', 'degC', 'Temperature', 'mean(air_temperature P3M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAMA', 'degC', 'Temperature', 'mean(air_temperature_anomaly P3M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RR', 'mm', 'Precipitation', 'sum(precipitation_amount P3M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RRA', 'percent', 'Precipitation', 'sum(precipitation_amount_anomaly P3M)');


Insert into METNO_ELEMENT
   (ELEMENT_ID, METNO_NAME)
 Values
   ('sum(precipitation_amount_anomaly P3M)', 'precipitation_amount_anomaly');


Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: mean (best estimate)', 'K', '37', 'mean(air_temperature P3M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature_anomaly', 'time: mean (best estimate)', 'K', '37', 'mean(air_temperature_anomaly P3M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('precipitation_amount', 'time: sum (best estimate)', 'kg m-2', '37', 'sum(precipitation_amount P3M)');

--Insert 6months season elements to element, element_name, element_category, element_description, element_status, metno_element, kdvh_element, cf_element
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(air_temperature P6M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(air_temperature_anomaly P6M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('sum(precipitation_amount P6M)', 'mm');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'percent');


Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature P6M)', 'Mean temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature P6M)', 'Middeltemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature P6M)', 'Middeltemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature_anomaly P6M)', 'Mean temperature in winter or summer, deviation from normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature_anomaly P6M)', 'Middeltemperatur for vinter- eller sommerhalvåret, avvik frå normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature_anomaly P6M)', 'Middeltemperatur for vinter- eller sommerhalvåret, avvik fra normalen', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount P6M)', 'Precipitation in winter or summer', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount P6M)', 'Nedbør i vinter- eller sommerhalvåret', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount P6M)', 'Nedbør i vinter- eller sommerhalvåret', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'Precipitation in winter or summer in percent of normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'Nedbør for årstid i høve til normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'Nedbør for årstid i forhold til normalen', 'nb-NO');

Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature P6M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature_anomaly P6M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount P6M)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature P6M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature_anomaly P6M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount P6M)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature P6M)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature_anomaly P6M)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount P6M)', 'Nedbør', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'Nedbør', 'nn-NO');

Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature P6M)', 'Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc).Monthly and season value: Arithmetic mean of daily values.', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature P6M)', 'Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18). Månads- og sesnongverdi: Aritmetisk middel av døgn midler.', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature P6M)', 'Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18). Måneds- og sesongverdi: Aritmetisk middel av døgn midler.', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature_anomaly P6M)', 'Deviation from present temperature normal (1961-1990)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature_anomaly P6M)', 'Avvik frå gjeldande temperaturnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature_anomaly P6M)', 'Avvik fra gjeldende temperaturnormal (1961-1990)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount P6M)', 'Total of precipitation during winter or summer  (precipitation day 06-06 utc)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount P6M)', 'Nedbørsum i ein vinter- eller sommerhalvåret  (nedbørdøgn 07-07)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount P6M)', 'Nedbørsum i en vinter- eller sommerhalvåret (nedbørdøgn 07-07)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'Precipitation in percent of present precipitation normal (1961-1990).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'Nedbør i prosent av gjeldande nedbørnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'Nedbør i prosent av gjeldende nedbørnormal (1961-1990)', 'nb-NO');


Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(air_temperature P6M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'MET-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(air_temperature_anomaly P6M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('sum(precipitation_amount P6M)', 'CF-name');


Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAM', 'degC', 'Temperature', 'mean(air_temperature P6M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAMA', 'degC', 'Temperature', 'mean(air_temperature_anomaly P6M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RR', 'mm', 'Precipitation', 'sum(precipitation_amount P6M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RRA', 'percent', 'Precipitation', 'sum(precipitation_amount_anomaly P6M)');


Insert into METNO_ELEMENT
   (ELEMENT_ID, METNO_NAME)
 Values
   ('sum(precipitation_amount_anomaly P6M)', 'precipitation_amount_anomaly');


Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: mean (best estimate)', 'K', '37', 'mean(air_temperature P6M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature_anomaly', 'time: mean (best estimate)', 'K', '37', 'mean(air_temperature_anomaly P6M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('precipitation_amount', 'time: sum (best estimate)', 'kg m-2', '37', 'sum(precipitation_amount P6M)');

-- yearly season elements
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(air_temperature P1Y)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('sum(precipitation_amount P1Y)', 'mm');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'percent');


Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature P1Y)', 'Mean temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature P1Y)', 'Middeltemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature P1Y)', 'Middeltemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'Mean temperature in year, deviation from normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'Middeltemperatur for år, avvik frå normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'Middeltemperatur for år, avvik fra normalen', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount P1Y)', 'Precipitation in year', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount P1Y)', 'Årsnedbør', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount P1Y)', 'Årsnedbør', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'Total precipitation in year in percent of normal', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'Årsnedbør i høve til normalen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'Årsnedbør i forhold til normalen', 'nb-NO');

Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature P1Y)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount P1Y)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature P1Y)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount P1Y)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature P1Y)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount P1Y)', 'Nedbør', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'Nedbør', 'nn-NO');

Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature P1Y)', 'Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc).  Values for a month, season or year: Arithmetic mean of daily values. ', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature P1Y)', 'Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18). Månad-, sesong- og årsverdi: Aritmetisk middel av døgn midler. ', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature P1Y)', 'Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18). Måned-,sesong- og årsverdi: Aritmetisk middel av døgn midler.', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'Deviation from present temperature normal (1961-1990)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'Avvik frå gjeldande temperaturnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'Avvik fra gjeldende temperaturnormal (1961-1990)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount P1Y)', 'Total of precipitation in year (precipitation day 06-06 utc)', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount P1Y)', 'Årssum for nedbør (nedbørdøgn 07-07)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount P1Y)', 'Årssum for nedbør (nedbørdøgn 07-07)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'Precipitation in percent of present precipitation normal (1961-1990).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'Nedbør i prosent av gjeldande nedbørnormal (1961-1990)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'Nedbør i prosent av gjeldende nedbørnormal (1961-1990)', 'nb-NO');


Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(air_temperature P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'MET-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(air_temperature_anomaly P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('sum(precipitation_amount P1Y)', 'CF-name');


Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAM', 'degC', 'Temperature', 'mean(air_temperature P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAMA', 'degC', 'Temperature', 'mean(air_temperature_anomaly P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RR', 'mm', 'Precipitation', 'sum(precipitation_amount P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('RRA', 'percent', 'Precipitation', 'sum(precipitation_amount_anomaly P1Y)');


Insert into METNO_ELEMENT
   (ELEMENT_ID, METNO_NAME)
 Values
   ('sum(precipitation_amount_anomaly P1Y)', 'precipitation_amount_anomaly');


Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: mean (best estimate)', 'K', '37', 'mean(air_temperature P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature_anomaly', 'time: mean (best estimate)', 'K', '37', 'mean(air_temperature_anomaly P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('precipitation_amount', 'time: sum (best estimate)', 'kg m-2', '37', 'sum(precipitation_amount P1Y)');


--other season elements for P3M, P6M and P1Y, for the monthly elements: TAN=min(air_temperature P1M),TAX=max(air_temperature P1M),NNM=mean(cloud_area_fraction P1M),GD17=integral_of_deficit(mean(air_temperature P1D) P1M 17.0)
--season
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('max(air_temperature P3M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(cloud_area_fraction P3M)', 'octas');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('min(air_temperature P3M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'degree-day');


Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('max(air_temperature P3M)', 'Maximum temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('max(air_temperature P3M)', 'Maksimumstemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('max(air_temperature P3M)', 'Maksimumstemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(cloud_area_fraction P3M)', 'Average cloud cover', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(cloud_area_fraction P3M)', 'Middel av skydekke', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(cloud_area_fraction P3M)', 'Midlere skydekke', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('min(air_temperature P3M)', 'Minimum temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('min(air_temperature P3M)', 'Minimumstemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('min(air_temperature P3M)', 'Minimumstemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'Energigradtal (basis 17)', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'Energigradtall (basis 17)', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'Heating degree days (base 17)', 'en-US');


Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('max(air_temperature P3M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(cloud_area_fraction P3M)', 'Clouds', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('min(air_temperature P3M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('max(air_temperature P3M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(cloud_area_fraction P3M)', 'Skyer', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('min(air_temperature P3M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('max(air_temperature P3M)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(cloud_area_fraction P3M)', 'Skyer', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('min(air_temperature P3M)', 'Temperatur', 'nn-NO');


Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min(air_temperature P3M)', 'Lowest noted temperature this season (from 18 to 18).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min(air_temperature P3M)', 'Lågaste registrerte temperatur i sesongen (kl 18-18)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min(air_temperature P3M)', 'Laveste registrerte temperatur i sesongen (kl 18-18)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max(air_temperature P3M)', 'Highest noted temperature this season (from 18 to 18).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max(air_temperature P3M)', 'Høgaste registrerte temperatur i sesongen (kl 18-18)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max(air_temperature P3M)', 'Høyeste registrerte temperatur i sesongen (kl 18-18)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(cloud_area_fraction P3M)', 'Arithmetic mean over a season of cloud cover at observations 06, 12 and 18 utc .', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(cloud_area_fraction P3M)', 'Sesongverdi. Aritmetisk middel av skydekke verdiar frå observasjonar kl 06, 12 og 18 utc', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(cloud_area_fraction P3M)', 'Sesongverdi. Aritmetisk middel av skydekke verdier fra observasjoner kl 06, 12 og 18 utc', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'Figure computed from daily mean temperatures (how many degrees below 17 ºC) in period.', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'Også kalla graddagstal eller fyringsgrader i perioden. Talet vert avleia av døgnmiddeltemperaturen (talet på grader < 17 ºC)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'Også kalt graddagstall eller fyringsgrader i perioden. Tallet avledes av døgnmiddeltemperaturen (antall grader < 17 ºC)', 'nb-NO');


Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('min(air_temperature P3M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('max(air_temperature P3M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(cloud_area_fraction P3M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)', 'CF-name');


Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAX', 'degC', 'Temperature', 'max(air_temperature P3M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('NNM', 'octas', 'Clouds', 'mean(cloud_area_fraction P3M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAN', 'degC', 'Temperature', 'min(air_temperature P3M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('GD17', 'degree-day', 'Temperature', 'integral_of_deficit(mean(air_temperature P1D) P3M 17.0)');

--no data in metno element

Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: maximum', 'K', '37', 'max(air_temperature P3M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('cloud_area_fraction', 'time: mean', '1', '37', 'mean(cloud_area_fraction P3M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: minimum', 'K', '37', 'min(air_temperature P3M)');


--6months winter and summer

Insert into ELEMENT
   (ID, UNIT)
 Values
   ('max(air_temperature P6M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(cloud_area_fraction P6M)', 'octas');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('min(air_temperature P6M)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'degree-day');


Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('max(air_temperature P6M)', 'Maximum temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('max(air_temperature P6M)', 'Maksimumstemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('max(air_temperature P6M)', 'Maksimumstemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(cloud_area_fraction P6M)', 'Average cloud cover', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(cloud_area_fraction P6M)', 'Middel av skydekke', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(cloud_area_fraction P6M)', 'Midlere skydekke', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('min(air_temperature P6M)', 'Minimum temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('min(air_temperature P6M)', 'Minimumstemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('min(air_temperature P6M)', 'Minimumstemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'Energigradtal (basis 17)', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'Energigradtall (basis 17)', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'Heating degree days (base 17)', 'en-US');


Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('max(air_temperature P6M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(cloud_area_fraction P6M)', 'Clouds', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('min(air_temperature P6M)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('max(air_temperature P6M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(cloud_area_fraction P6M)', 'Skyer', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('min(air_temperature P6M)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('max(air_temperature P6M)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(cloud_area_fraction P6M)', 'Skyer', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('min(air_temperature P6M)', 'Temperatur', 'nn-NO');


Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min(air_temperature P6M)', 'Lowest noted temperature this 6 months of summer or winter (from 18 to 18).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min(air_temperature P6M)', 'Lågaste registrerte temperatur i vinter- eller sommerhalvåret (kl 18-18)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min(air_temperature P6M)', 'Laveste registrerte temperatur i vinter- eller sommerhalvåret (kl 18-18)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max(air_temperature P6M)', 'Highest noted temperature this 6 months of summer or winter (from 18 to 18).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max(air_temperature P6M)', 'Høgaste registrerte temperatur i vinter- eller sommerhalvåret (kl 18-18)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max(air_temperature P6M)', 'Høyeste registrerte temperatur i vinter- eller sommerhalvåret (kl 18-18)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(cloud_area_fraction P6M)', 'Arithmetic mean of cloud cover at observations 06, 12 and 18 utc in 6 months of summer or winter.', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(cloud_area_fraction P6M)', 'Aritmetisk middel av skydekke verdiar frå observasjonar kl 06, 12 og 18 utc i vinter- eller sommerhalvåret.', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(cloud_area_fraction P6M)', 'Aritmetisk middel av skydekke verdier fra observasjoner kl 06, 12 og 18 utc i vinter- eller sommerhalvåret.', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'Figure computed from daily mean temperatures (how many degrees below 17 ºC) in period.', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'Også kalla graddagstal eller fyringsgrader i perioden. Talet vert avleia av døgnmiddeltemperaturen (talet på grader < 17 ºC)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'Også kalt graddagstall eller fyringsgrader i perioden. Tallet avledes av døgnmiddeltemperaturen (antall grader < 17 ºC)', 'nb-NO');


Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('min(air_temperature P6M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('max(air_temperature P6M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(cloud_area_fraction P6M)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)', 'CF-name');


Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAX', 'degC', 'Temperature', 'max(air_temperature P6M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('NNM', 'octas', 'Clouds', 'mean(cloud_area_fraction P6M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAN', 'degC', 'Temperature', 'min(air_temperature P6M)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('GD17', 'degree-day', 'Temperature', 'integral_of_deficit(mean(air_temperature P1D) P6M 17.0)');

--no data in metno element

Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: maximum', 'K', '37', 'max(air_temperature P6M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('cloud_area_fraction', 'time: mean', '1', '37', 'mean(cloud_area_fraction P6M)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: minimum', 'K', '37', 'min(air_temperature P6M)');


 
--year
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('max(air_temperature P1Y)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(cloud_area_fraction P1Y)', 'octas');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('min(air_temperature P1Y)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'degree-day');


Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('max(air_temperature P1Y)', 'Maximum temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('max(air_temperature P1Y)', 'Maksimumstemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('max(air_temperature P1Y)', 'Maksimumstemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(cloud_area_fraction P1Y)', 'Average cloud cover', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(cloud_area_fraction P1Y)', 'Middel av skydekke', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(cloud_area_fraction P1Y)', 'Midlere skydekke', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('min(air_temperature P1Y)', 'Minimum temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('min(air_temperature P1Y)', 'Minimumstemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('min(air_temperature P1Y)', 'Minimumstemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'Energigradtal (basis 17)', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'Energigradtall (basis 17)', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'Heating degree days (base 17)', 'en-US');


Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('max(air_temperature P1Y)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(cloud_area_fraction P1Y)', 'Clouds', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('min(air_temperature P1Y)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('max(air_temperature P1Y)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(cloud_area_fraction P1Y)', 'Skyer', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('min(air_temperature P1Y)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('max(air_temperature P1Y)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(cloud_area_fraction P1Y)', 'Skyer', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('min(air_temperature P1Y)', 'Temperatur', 'nn-NO');


Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min(air_temperature P1Y)', 'Lowest noted temperature this year (from 18 to 18).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min(air_temperature P1Y)', 'Lågaste registrerte temperatur i året (kl 18-18)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min(air_temperature P1Y)', 'Laveste registrerte temperatur i året (kl 18-18)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max(air_temperature P1Y)', 'Highest noted temperature this year (from 18 to 18).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max(air_temperature P1Y)', 'Høgaste registrerte temperatur i året (kl 18-18)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max(air_temperature P1Y)', 'Høyeste registrerte temperatur i året (kl 18-18)', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(cloud_area_fraction P1Y)', 'Arithmetic mean over a year of cloud cover at observations 06, 12 and 18 utc.', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(cloud_area_fraction P1Y)', 'Årsverdi. Aritmetisk middel av skydekke verdiar frå observasjonar kl 06, 12 og 18 utc.', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(cloud_area_fraction P1Y)', 'Årsverdi. Aritmetisk middel av skydekke verdier fra observasjoner kl 06, 12 og 18 utc.', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'Figure computed from daily mean temperatures (how many degrees below 17 ºC) in period.', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'Også kalla graddagstal eller fyringsgrader i perioden. Talet vert avleia av døgnmiddeltemperaturen (talet på grader < 17 ºC)', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'Også kalt graddagstall eller fyringsgrader i perioden. Tallet avledes av døgnmiddeltemperaturen (antall grader < 17 ºC)', 'nb-NO');


Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('min(air_temperature P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('max(air_temperature P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(cloud_area_fraction P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)', 'CF-name');


Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAX', 'degC', 'Temperature', 'max(air_temperature P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('NNM', 'octas', 'Clouds', 'mean(cloud_area_fraction P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAN', 'degC', 'Temperature', 'min(air_temperature P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('GD17', 'degree-day', 'Temperature', 'integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)');

--no data in metno element

Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: maximum', 'K', '37', 'max(air_temperature P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('cloud_area_fraction', 'time: mean', '1', '37', 'mean(cloud_area_fraction P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: minimum', 'K', '37', 'min(air_temperature P1Y)');


--insert other yearly elements that are available as normal values

Insert into ELEMENT
   (ID, UNIT)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'degree-day');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'hPa');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'degC');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('mean(surface_air_pressure P1Y)', 'hPa');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'number of');
Insert into ELEMENT
   (ID, UNIT)
 Values
   ('sum(duration_of_sunshine P1Y)', 'hours');


Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'Heating degree days - interpolated (base 17)', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'Energigradtal, interpolert (basis 17)', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'Energigradtall, interpolert (basis 17)', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'Average air pressure, sea level', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'Middel av lufttrykk, havnivå', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'Midlere lufttrykk, havnivå', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'Average of maximum temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'Middel av maksimumtemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'Midlere maksimumtemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'Average of minimum temperature', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'Middel av minimumtemperatur', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'Midlere minimumtemperatur', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(surface_air_pressure P1Y)', 'Average air pressure, station level', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(surface_air_pressure P1Y)', 'Middel av lufttrykk, stasjonsnivå', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('mean(surface_air_pressure P1Y)', 'Midlere lufttrykk, stasjonsnivå', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'Number of days with RR>=1', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'Talet på dagar med RR>=1', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'Antall dager med RR>1', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(duration_of_sunshine P1Y)', 'Sunshine', 'en-US');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(duration_of_sunshine P1Y)', 'Sum soltimar', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(duration_of_sunshine P1Y)', 'Sum soltimer', 'nb-NO');


Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'Nedbør', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(duration_of_sunshine P1Y)', 'Sol', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'Air pressure', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'Temperature', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(surface_air_pressure P1Y)', 'Air pressure', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'Precipitation', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(duration_of_sunshine P1Y)', 'Sunshine', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'Lufttrykk', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'Temperatur', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(surface_air_pressure P1Y)', 'Lufttrykk', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'Nedbør', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(duration_of_sunshine P1Y)', 'Sol', 'nb-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'Lufttrykk', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'Temperatur', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('mean(surface_air_pressure P1Y)', 'Lufttrykk', 'nn-NO');

Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'Number of days with 1 mm precipitation or more', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'Talet på dagar med 1 mm nedbør eller meir', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'Antall dager med 1 mm nedbør eller mer', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'Values are computed from grid-interpolated daily mean temperatures (how many degrees below 17 ºC).', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'Også kalla graddagstal eller fyringsgrader. Talet er avleidd av døgnmiddeltemperaturen (grader < 17 ºC). Interpolert ut frå gridda data.', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'Også kalt graddagstall eller fyringsgrader. Tallet avledes av døgnmiddeltemperaturen (antall grader < 17 ºC). Interpolert ut fra griddete data.', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'Air pressure reduced to sea level (QFF), mean value of period', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'Lufttrykk redusert til havnivå (QFF), middelverdi for perioden', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'Lufttrykk redusert til havets nivå (QFF), middelverdi for perioden', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'Monthly value: Arithmetic mean of the daily maximum temperatures', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'Månadsverdi: Aritmetisk middel av maksimumstemperatur for kvart døgn', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'Månedsverdi: Aritmetisk middel av hvert døgns maksimumstemperatur', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'Monthly value: Arithmetic mean of the daily mimimum temperatures', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'Månadsverdi: Aritmetisk middel av mimimumstemperaturen for kvart døgn', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'Månedsverdi: Aritmetisk middel av hvert døgns mimimumstemperatur', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(surface_air_pressure P1Y)', 'Air pressure at station (QFE), mean value of period', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(surface_air_pressure P1Y)', 'Lufttrykk på stasjonen (QFE), middelverdi for perioden', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean(surface_air_pressure P1Y)', 'Lufttrykk på stasjonen (QFE), middelverdi for perioden', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(duration_of_sunshine P1Y)', 'Sunshine', 'en-US');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(duration_of_sunshine P1Y)', 'Sum soltimar', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(duration_of_sunshine P1Y)', 'Sum soltimer', 'nb-NO');

Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('sum(duration_of_sunshine P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(surface_air_pressure P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(min(air_temperature P1D) P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(air_pressure_at_sea_level P1Y)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)', 'CF-name');
Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('mean(max(air_temperature P1D) P1Y)', 'CF-name');

Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('GD17_I', 'degree-day', 'Temperature', 'integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('PRM', 'hPa', 'Air pressure', 'mean(air_pressure_at_sea_level P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TAXM', 'degC', 'Temperature', 'mean(max(air_temperature P1D) P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('TANM', 'degC', 'Temperature', 'mean(min(air_temperature P1D) P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('POM', 'hPa', 'Air pressure', 'mean(surface_air_pressure P1Y)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('DRR_GE1', 'number of', 'Precipitation', 'number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)');
Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, CATEGORY, ELEMENT_ID)
 Values
   ('OT', 'hours', 'Sunshine', 'sum(duration_of_sunshine P1Y)');


Insert into CF_ELEMENT
   (STANDARD_NAME, UNIT, STATUS, ELEMENT_ID)
 Values
   (' ', 'K', '37', 'integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_pressure_at_sea_level', 'time: mean', 'Pa', '37', 'mean(air_pressure_at_sea_level P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: mean', 'K', '37', 'mean(max(air_temperature P1D) P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('air_temperature', 'time: mean', 'K', '37', 'mean(min(air_temperature P1D) P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('surface_air_pressure', 'time: mean', 'Pa', '37', 'mean(surface_air_pressure P1Y)');
Insert into CF_ELEMENT
   (STANDARD_NAME, UNIT, STATUS, ELEMENT_ID)
 Values
   (' ', 'kg m-2', '37', 'number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)');
Insert into CF_ELEMENT
   (STANDARD_NAME, CELL_METHOD, UNIT, STATUS, ELEMENT_ID)
 Values
   ('duration_of_sunshine', 'time: sum', 's', '37', 'sum(duration_of_sunshine P1Y)');


# --- !Downs 
