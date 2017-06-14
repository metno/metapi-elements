# --- !Ups


--update integral of deficit to excess elements-monthly, threshold 5.0
UPDATE element SET id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)' WHERE id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)';
UPDATE element_name SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)';
UPDATE element_description SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)';
UPDATE element_codetable SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)';
UPDATE cf_element SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)';
UPDATE kdvh_element SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)';
UPDATE metno_element SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)';
UPDATE element_status SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)';
UPDATE element_category SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)';

--update integral of deficit to excess elements - daily, threshold 5.0
UPDATE element SET id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)' WHERE id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)';
UPDATE element_name SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)';
UPDATE element_description SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)';
UPDATE element_codetable SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)';
UPDATE cf_element SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)';
UPDATE kdvh_element SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)';
UPDATE metno_element SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)';
UPDATE element_status SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)';
UPDATE element_category SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)';

--update integral of deficit to excess elements- monthly, threshold 0.0
UPDATE element SET id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)' WHERE id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
UPDATE element_name SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
UPDATE element_description SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
UPDATE element_codetable SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
UPDATE cf_element SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
UPDATE kdvh_element SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
UPDATE metno_element SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
UPDATE element_status SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
UPDATE element_category SET element_id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';

--update integral of deficit to excess elements-daily, threshold 0.0
UPDATE element SET id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)' WHERE id='integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)';
UPDATE element_name SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)';
UPDATE element_description SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)';
UPDATE element_codetable SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)';
UPDATE cf_element SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)';
UPDATE kdvh_element SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)';
UPDATE metno_element SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)';
UPDATE element_status SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)';
UPDATE element_category SET element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)' WHERE element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)';

--update integral of deficit to excess, below 17 degrees - monthly
UPDATE element SET id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)' WHERE id='integral_of_excess(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_name SET element_id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_description SET element_id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_codetable SET element_id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature P1D) P1M 17.0)';
UPDATE cf_element SET element_id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature P1D) P1M 17.0)';
UPDATE kdvh_element SET element_id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature P1D) P1M 17.0)';
UPDATE metno_element SET element_id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_status SET element_id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_category SET element_id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature P1D) P1M 17.0)';

--update integral of deficit to excess, below 17 degrees - daily
UPDATE element SET id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)' WHERE id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
UPDATE element_name SET element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
UPDATE element_description SET element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
UPDATE element_codetable SET element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
UPDATE cf_element SET element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
UPDATE kdvh_element SET element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
UPDATE metno_element SET element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
UPDATE element_status SET element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
UPDATE element_category SET element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)' WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';

--update integral of deficit to excess, below 17 degrees - monthly - interpolated values
UPDATE element SET id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)' WHERE id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_name SET element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_description SET element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_codetable SET element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)';
UPDATE cf_element SET element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)';
UPDATE kdvh_element SET element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)';
UPDATE metno_element SET element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_status SET element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)';
UPDATE element_category SET element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)' WHERE element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)';

-- PP - barometer tendency description
update element_description set description='Barometer tendency, i.e. change over given period' where element_id='change_over_time(surface_air_pressure PT6H)' and description_locale='en-US';
update element_description set description='Barometer tendency, i.e. change over given period' where element_id='change_over_time(surface_air_pressure PT1H)' and description_locale='en-US';
update element_description set description='Barometer tendency, i.e. change over given period' where element_id='change_over_time(surface_air_pressure PT3H)' and description_locale='en-US';

update element_description set description='Barometertendensens størrelse, dvs. endring i aktuell periode' where element_id='change_over_time(surface_air_pressure PT3H)' and description_locale='nb-NO';
update element_description set description='Barometertendensens størrelse, dvs. endring i aktuell periode' where element_id='change_over_time(surface_air_pressure PT1H)' and description_locale='nb-NO';
update element_description set description='Barometertendensens størrelse, dvs. endring i aktuell periode' where element_id='change_over_time(surface_air_pressure PT6H)' and description_locale='nb-NO';

update element_description set description='Storleiken på barometertendensen, dvs. endring i aktuell periode' where element_id='change_over_time(surface_air_pressure PT6H)' and description_locale='nn-NO';
update element_description set description='Storleiken på barometertendensen, dvs. endring i aktuell periode' where element_id='change_over_time(surface_air_pressure PT1H)' and description_locale='nn-NO';
update element_description set description='Storleiken på barometertendensen, dvs. endring i aktuell periode' where element_id='change_over_time(surface_air_pressure PT3H)' and description_locale='nn-NO';

--update element (s rest of problems regarding 24H and 1D)
UPDATE element SET id='over_time(precipitation_type_primary_significance P1D)' WHERE id='max(timeperiod_weather_type_significance1 P1D)';
UPDATE element_name SET element_id='over_time(precipitation_type_primary_significance P1D)' WHERE element_id='max(timeperiod_weather_type_significance1 P1D)';
UPDATE element_description SET element_id='over_time(precipitation_type_primary_significance P1D)' WHERE element_id='max(timeperiod_weather_type_significance1 P1D)';
UPDATE element_codetable SET element_id='over_time(precipitation_type_primary_significance P1D)' WHERE element_id='max(timeperiod_weather_type_significance1 P1D)';
UPDATE cf_element SET element_id='over_time(precipitation_type_primary_significance P1D)' WHERE element_id='max(timeperiod_weather_type_significance1 P1D)';
UPDATE kdvh_element SET element_id='over_time(precipitation_type_primary_significance P1D)' WHERE element_id='max(timeperiod_weather_type_significance1 P1D)';

--update codetable values
delete from codetable_entry where codetable_id='weather_symbol' and value='22';

insert into codetable_entry (value, codetable_id, meaning, meaning_locale) 
values ('22', 'weather_symbol','Torden og regn', 'nb-NO');

insert into codetable_entry (value, codetable_id, meaning, meaning_locale) 
values ('22', 'weather_symbol','TorevÃªr og regn', 'nn-NO');

insert into codetable_entry (value, codetable_id, meaning, meaning_locale) 
values ('22', 'weather_symbol','Thunder and rain', 'en-US');


# --- !Downs
