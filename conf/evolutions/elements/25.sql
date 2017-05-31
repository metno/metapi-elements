# --- !Ups

--Update of content descriptions of time of event elements
UPDATE element_description SET description='Dato da høyeste vindstyrke inntraff' WHERE element_id='time_of_event_of_max(max(wind_speed PT24H) P1M)' and description_locale='nb-NO';
UPDATE element_description SET description='Dato da høgaste vindstyrke inntrefte' WHERE element_id='time_of_event_of_max(max(wind_speed PT24H) P1M)' and description_locale='nn-NO';
UPDATE element_description SET description='Date of event when maximum wind speed occurred' WHERE element_id='time_of_event_of_max(max(wind_speed PT24H) P1M)' and description_locale='en-US';


UPDATE element_description SET description='Klokkeslett da høyeste vind gust inntraff (HHmm)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)' and description_locale='nb-NO';
UPDATE element_description SET description='Klokkeslett da høgaste vind gust inntrefte (HHmm)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)' and description_locale='nn-NO';
UPDATE element_description SET description='Time of event when maximum wind speed of gust occurred (HHmm)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)' and description_locale='en-US';

UPDATE element_description SET description='Klokkeslett da høyeste vindstyrke inntraff (HHmm)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)' and description_locale='nb-NO';
UPDATE element_description SET description='Klokkeslett da høgaste vindstyrke inntrefte (HHmm)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)' and description_locale='nn-NO';
UPDATE element_description SET description='Time of event when maximum wind speed occurred (HHmm)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)' and description_locale='en-US';

--Update descriptions that had semicolon
update element_description set description='Weather at time of observation, code (number or letter) for different types of weather, up to three codes may be given (V1-V3).' where description_locale='en-US' and element_id='precipitation_type_tertiary_significance';
update element_description set description='Weather during six or twelve hours before time of observation, code (number or letter) for different types of weather, up to four codes may be given (V4-V7)' where description_locale='en-US' and element_id='over_time(precipitation_type_primary_significance PT6H)';
update element_description set description='Weather at time of observation, code (number or letter) for different types of weather, up to three codes may be given (V1-V3).' where description_locale='en-US' and element_id='precipitation_type_primary_significance';
update element_description set description='Weather during six or twelve hours before time of observation, code (number or letter) for different types of weather, up to four codes may be given (V4-V7)' where description_locale='en-US' and element_id='over_time(precipitation_type_secondary_significance PT6H)';
update element_description set description='Weather during six or twelve hours before time of observation, code (number or letter) for different types of weather, up to four codes may be given (V4-V7)' where description_locale='en-US' and element_id='over_time(precipitation_type_secondary_significance P1D)';
update element_description set description='Weather during six or twelve hours before time of observation, code (number or letter) for different types of weather, up to four codes may be given (V4-V7)' where description_locale='en-US' and element_id='precipitation_type_quaternary_significance';
update element_description set description='Snow depth, total from ground up, normally measured in the morning. Code = -1 means no snow, presented as ".", -3 = "not possible to measure".' where description_locale='en-US' and element_id='surface_snow_thickness';
update element_description set description='Weather at time of observation, code (number or letter) for different types of weather, up to three codes may be given (V1-V3).' where description_locale='en-US' and element_id='precipitation_type_secondary_significance';
update element_description set description='Weather during six or twelve hours before time of observation, code (number or letter) for different types of weather, up to four codes may be given (V4-V7)' where description_locale='en-US' and element_id='over_time(precipitation_type_tertiary_significance PT6H)';
update element_description set description='Weather during six or twelve hours before time of observation, code (number or letter) for different types of weather, up to four codes may be given (V4-V7)' where description_locale='en-US' and element_id='over_time(precipitation_type_tertiary_significance P1D)';

--Update of content name og time of event elements

UPDATE element_name SET name='Tidspunkt for maks vind gust' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)' and name_locale='nb-NO';
UPDATE element_name SET name='Tidspunkt for maks vind gust' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)' and name_locale='nn-NO';
UPDATE element_name SET name='Time of max wind gust' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)' and name_locale='en-US';

UPDATE element_name SET name='Tidspunkt for maks vindstyrke' WHERE element_id='time_of_event_of_max(wind_speed PT1H)' and name_locale='nb-NO';
UPDATE element_name SET name='Tidspunkt for maks vindstyrke' WHERE element_id='time_of_event_of_max(wind_speed PT1H)' and name_locale='nn-NO';
UPDATE element_name SET name='Time of max wind speed' WHERE element_id='time_of_event_of_max(wind_speed PT1H)' and name_locale='en-US';

--unit
update element set unit='1' where id= 'surface_albedo';
update element set unit='meters' where id= 'cloud_base_height2';

--Update content in existing elements 

update cf_element set element_id='mean(relative_humidity PT1H)' where element_id='mean(relative_humidity T1H)';

update element_name set element_id='mean(relative_humidity PT1H)' where element_id='mean(relative_humidity T1H)';

update element_description set element_id='mean(relative_humidity PT1H)' where element_id='mean(relative_humidity T1H)';

update element set id='over_time(precipitation_type_quaternary_significance PT6H)' where id='precipitation_type_quaternary_significance';

update kdvh_element set element_id='over_time(precipitation_type_quaternary_significance PT6H)' where element_id='precipitation_type_quaternary_significance';

update cf_element set element_id='over_time(precipitation_type_quaternary_significance PT6H)' where element_id='precipitation_type_quaternary_significance';

update element_name set element_id='over_time(precipitation_type_quaternary_significance PT6H)' where element_id='precipitation_type_quaternary_significance';

update element_description set element_id='over_time(precipitation_type_quaternary_significance PT6H)' where element_id='precipitation_type_quaternary_significance';

-- update element tables with a changed element_id, as elem_code=SPD1

UPDATE element SET id='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE id='sea_wave_spectrum_peak_energy';
UPDATE element_name SET element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE element_id='sea_wave_spectrum_peak_energy';
UPDATE element_description SET element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE element_id='sea_wave_spectrum_peak_energy';
UPDATE element_codetable SET element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE element_id='sea_wave_spectrum_peak_energy';
UPDATE cf_element SET element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE element_id='sea_wave_spectrum_peak_energy';
UPDATE kdvh_element SET element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE element_id='sea_wave_spectrum_peak_energy';
UPDATE metno_element SET element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE element_id='sea_wave_spectrum_peak_energy';
UPDATE element_category SET element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE element_id='sea_wave_spectrum_peak_energy';
UPDATE element_status SET element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE element_id='sea_wave_spectrum_peak_energy';

UPDATE element_status SET status_id='CF-name' where element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum';


--element_codetable element with a changed name
update kdvh_element set elem_code='WW' where element_id='weather_type';

---codetables
delete from element_codetable where element_id in (
'weather_type'	,
'over_time(precipitation_type_primary_significance PT6H)'	,
'over_time(precipitation_type_tertiary_significance_intensity P1D)'	,
'over_time(weather_type_additional1 PT6H)'	,
'precipitation_type_primary_significance'	,
'precipitation_type_secondary_significance'	,
'over_time(precipitation_type_secondary_significance PT6H)'	,
'over_time(precipitation_type_tertiary_significance P1D)'	,
'over_time(weather_type_secondary_significance PT6H)'	,
'over_time(weather_type_primary_significance PT6H)'	,
'over_time(precipitation_type_secondary_significance_intensity P1D)'	,
'over_time(weather_type_secondary_significance PT3H)'	,
'over_time(weather_type_additional3 PT6H)'	,
'over_time(precipitation_type_tertiary_significance PT6H)'	,
'precipitation_type_tertiary_significance'	,
'over_time(weather_type_primary_significance PT3H)'	,
'over_time(weather_type_additional2 PT6H)'	,
'precipitation_type_quaternary_significance'	,
'over_time(precipitation_type_secondary_significance P1D)'	,
'over_time(precipitation_type_primary_significance_intensity P1D)'	,
'weather_type_automatic');

insert into element_codetable (element_id, codetable_name) values ('weather_type'	,'present_weather_manned');
insert into element_codetable (element_id, codetable_name) values ('over_time(precipitation_type_primary_significance PT6H)'	,'precipitation_type_significance');
insert into element_codetable (element_id, codetable_name) values ('over_time(precipitation_type_tertiary_significance_intensity P1D)'	,'precipitation_type_intensity');
insert into element_codetable (element_id, codetable_name) values ('over_time(weather_type_additional1 PT6H)'	,'past_weather_info');
insert into element_codetable (element_id, codetable_name) values ('precipitation_type_primary_significance'	,'precipitation_type_significance');
insert into element_codetable (element_id, codetable_name) values ('precipitation_type_secondary_significance'	,'precipitation_type_significance');
insert into element_codetable (element_id, codetable_name) values ('over_time(precipitation_type_secondary_significance PT6H)'	,'precipitation_type_significance');
insert into element_codetable (element_id, codetable_name) values ('over_time(precipitation_type_tertiary_significance P1D)','precipitation_type_significance');
insert into element_codetable (element_id, codetable_name) values ('over_time(weather_type_secondary_significance PT6H)','past_weather');
insert into element_codetable (element_id, codetable_name) values ('over_time(weather_type_primary_significance PT6H)'	,'past_weather');
insert into element_codetable (element_id, codetable_name) values ('over_time(precipitation_type_secondary_significance_intensity P1D)','precipitation_type_intensity');
insert into element_codetable (element_id, codetable_name) values ('over_time(weather_type_secondary_significance PT3H)'	,'past_weather');
insert into element_codetable (element_id, codetable_name) values ('over_time(weather_type_additional3 PT6H)'	, 'past_weather_info');
insert into element_codetable (element_id, codetable_name) values ('over_time(precipitation_type_tertiary_significance PT6H)'	,'precipitation_type_significance');
insert into element_codetable (element_id, codetable_name) values ('precipitation_type_tertiary_significance'	,'precipitation_type_significance');
insert into element_codetable (element_id, codetable_name) values ('over_time(weather_type_primary_significance PT3H)'	,'past_weather');
insert into element_codetable (element_id, codetable_name) values ('over_time(weather_type_additional2 PT6H)'	,'past_weather_info');
insert into element_codetable (element_id, codetable_name) values ('over_time(precipitation_type_quaternary_significance PT6H)'	,'precipitation_type_significance');
insert into element_codetable (element_id, codetable_name) values ('over_time(precipitation_type_secondary_significance P1D)'	,'precipitation_type_significance');
insert into element_codetable (element_id, codetable_name) values ('over_time(precipitation_type_primary_significance_intensity P1D)'	,'precipitation_type_intensity');
insert into element_codetable (element_id, codetable_name) values ('weather_type_automatic', 'present_weather_automatic');

--insert new codetable entry
insert into element_codetable (element_id, codetable_name) values ('tendency_of_surface_air_pressure_type', 'tendency_of_air_pressure');

insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 0,'Først stigende, så fallende','Barometerstanden er nå den samme eller høyere enn for 3 t siden','nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 1,'Først stigende, så vannrett. Eller først stigende, så langsommere stigende','Barometerstanden er nå høyere enn for 3 t siden','nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 2,'Stigende, jevnt eller ujevnt','Barometerstanden er nå høyere enn for 3 t siden','nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 3,'Fallende eller vannrett, så stigende. Eller stigende, så hurtigere stigende','Barometerstanden er nå høyere enn for 3 t siden','nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 4,'Vannrett','Barometerstanden er nå den samme som for 3 t siden (pp = 00)','nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 5,'Først fallende, stå stigende','Barometerstanden er nå den samme eller lavere enn for 3 t siden','nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 6,'Først fallende, så vannrett. Eller først fallende, så langsommere fallende','Barometerstanden er nå lavere enn for 3 t siden','nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 7,'Fallende, jevnt eller ujevnt','Barometerstanden er nå lavere enn for 3 t siden','nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 8,'Først stigende, så fallende. Eller først vannrett, så fallende. Eller fallende, så hurtigere fallende','Barometerstanden er nå lavere enn for 3 t siden','nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 0,'Først stigande, så fallande','Barometerstanden er no den same eller høgare enn for 3 t sidan','nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 1,'Først stigande, så vassrett. Eller først stigande, så langsamare stigande','Barometerstanden er no høgare enn for 3 t sidan','nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 2,'Stigande, jamt eller ujamt','Barometerstanden er no høgare enn for 3 t sidan','nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 3,'Fallande eller vassrett, så stigande. Eller stigande, så raskare stigande','Barometerstanden er no høgare enn for 3 t sidan','nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 4,'Vassrett','Barometerstanden er no den same som for 3 t sidan (pp = 00)','nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 5,'Først fallande, så stigande','Barometerstanden er no den same eller lågare enn for 3 t sidan','nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 6,'Først fallande, så vassrett. Eller først fallande, så langsamare fallande','Barometerstanden er no lågare enn for 3 t sidan','nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 7,'Fallande, jamt eller ujamt','Barometerstanden er no lågare enn for 3 t sidan','nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 8,'Først stigande, så fallande. Eller først vassrett, så fallande. Eller fallande, så raskare fallande','Barometerstanden er no lågare enn for 3 t sidan','nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 0,'Increasing, then decreasing','Atmospheric pressure the same as or higher than 3 hrs ago','en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 1,'Increasing, then steady','Atmospheric pressure now higher than 3 hrs ago','en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 2,'Increasing (steadily or unsteadily)','Atmospheric pressure now higher than 3 hrs ago','en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 3,'Decreasing or steady, then increasing, or increasing, then increasing more rapidly','Atmospheric pressure now higher than 3 hrs ago','en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 4,'Steady','Atmospheric pressure the same as 3 hrs ago','en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 5,'Decreasing, then increasing','Atmospheric pressure the same as or lower than 3 hrs ago','en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 6,'Decreasing, then steady, or decreasing, then decreasing more slowly','Atmospheric pressure now lower than 3 hrs ago','en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 7,'Decreasing (steadily or unsteadily)','Atmospheric pressure now lower than 3 hrs ago','en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('tendency_of_air_pressure', 8,'Steady or increasing, then decreasing, or decreasing, then decreasing more rapidly','Atmospheric pressure now lower than 3 hrs ago','en-US');

--insert icing for IK - time_since_deicing_index

insert into element_codetable (element_id, codetable_name) values ('time_since_deicing_index', 'time_since_deicing');

insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 0,'> 5 timer siden siste avising', null,'nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 1,'> 3 timer siden siste avising', null,'nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 2,'>24 minutter siden siste avising', null,'nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 3,'>12 minutter siden siste avising', null,'nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 4,'> 6 minutter siden siste avising', null,'nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 5,'> 3 minutter siden siste avising', null,'nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 6,'> 1 minutt siden siste avising', null,'nb-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 0,'> 5 timar sidan siste avising', null,'nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 1,'> 3 timar sidan siste avising', null,'nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 2,'>24 minutt sidan siste avising', null,'nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 3,'>12 minutt sidan siste avising', null,'nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 4,'> 6 minutt sidan siste avising', null,'nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 5,'> 3 minutt sidan siste avising', null,'nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 6,'> 1 minutt siden siste avising', null,'nn-NO');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 0,'> 5 hours since last deicing', null,'en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 1,'> 3 hours since last deicing', null,'en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 2,'> 24 minutes since last deicing', null,'en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 3,'> 12 minutes since last deicing', null,'en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 4,'> 6 minutes since last deicing', null,'en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 5,'> 3 minutes since last deicing', null,'en-US');
insert into codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) values ('time_since_deicing', 6,'> 1 minutes since last deicing', null,'en-US');

-- insert element_descriptions 
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('beaufort_wind_scale','Beauforts vindstyrkeskala, som beskriver effekten av ulike vindstyrker.','Utvikla i 1805 av Sir Francis Beaufort, U.K. Royal Navy','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('beaufort_wind_scale','Beauforts vindstyrkeskala, som beskriver effekten av ulike vindstyrker.','Utviklet i 1805 av Sir Francis Beaufort, U.K. Royal Navy','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('beaufort_wind_scale','The Beaufort wind force scale, according to the effect of the wind force.','Developed in 1805 by Sir Francis Beaufort, U.K. Royal Navy','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('past_weather','Været siden siste hovedobservasjonstidspunkt (kode 0 - 9). Rapporteres etter signifikans.','WMO kodetabell 4561','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('past_weather','Været siden siste hovedobservasjonstidspunkt (kode 0 - 9). Rapporteres etter signifikans.','WMO kodetabell 4561','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('past_weather','Weather since last main observation time (code 0 - 9) according to significance','WMO-code table 4561. Past weather','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('past_weather_info','Additional information about the weather since last main observation.','WMO additional info in synop to ''past_weather''','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('past_weather_info','Tilleggsinformasjon om været siden siste hovedobservasjon.','WMO tilleggsinformasjon i synop for ''past_weather''','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('past_weather_info','Tilleggsinformasjon om været siden siste hovedobservasjon.','WMO tilleggsinformasjon i synop for ''past_weather''','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('precipitation_type_intensity','Intensiteten av været tilhørende nedbørtypene i været med høyest signifikans - over_time(weather_type_primary_significance T6H)','Kodeverdier for intensitet av ''precipitation_type_significance''','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('precipitation_type_intensity','Intensiteten av været tilhørende nedbørtypene i været med høyest signifikans - over_time(weather_type_primary_significance T6H)','Kodeverdier for intensitet av ''precipitation_type_significance''','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('precipitation_type_intensity','Intensity of the weather as precipitation type given by over_time(weather_type_primary_significance T6H), e.g. heavy (rain) or light (showers of snow).','Codevalues for intensity of the ''precipitation_type_significance''','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('precipitation_type_significance','Været, hovedsaklig nedbørtyper, ved observasjonstidspunktet for SYNOP, eller siden siste observasjon for nedbørstasjoner. Rapporteres etter signifikans.','Tabell som følger SYNOP/BUFR rapportering','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('precipitation_type_significance','Været, hovedsaklig nedbørtyper, ved observasjonstidspunktet for SYNOP, eller siden siste observasjon for nedbørstasjoner. Rapporteres etter signifikans.','Tabell som følger SYNOP/BUFR rapportering','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('precipitation_type_significance','Weather, type of precipitation, at the time of the observation for SYNOP, or since last observation for manned precipitation stations. Reported according to significance.','Table according to SYNOP/BUFR report','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('present_weather_automatic','Været ved observasjonstidspunktet, vanligvis hver sjette time, gitt ved synop koder 00-99. Målt automatisk av instrumenter.','WMO kodetabell 4680','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('present_weather_automatic','Været ved observasjonstidspunktet, vanligvis hver sjette time, gitt ved synop koder 00-99. Målt automatisk av instrumenter.','WMO kodetabell 4680','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('present_weather_automatic','Weather at time of observation, given by synop code 00-99. Measured automatic by instruments.','WMO-code table 4680. Present weather from automatic stations','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('present_weather_manned','Været ved observasjonstidspunktet, vanligvis hver sjette time, gitt ved synop koder 00-99. Manuelt observert.','WMO kodetabell 4677','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('present_weather_manned','Været ved observasjonstidspunktet, vanligvis hver sjette time, gitt ved synop koder 00-99. Manuelt observert.','WMO kodetabell 4677','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('present_weather_manned','Weather at time of observation, given by synop code 00-99. Observed by man.','WMO-code table 4677. Present weather from manned stations','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('sea_state_type','Havets tilstand som at sjøen er stille eller går høy.','WMO kodetabell 3700 som i hovedsak bygger på ''vindsjø'' klassifiseringen fra Douglas.','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('sea_state_type','Havets tilstand som at sjøen er stille eller går høy.','WMO kodetabell 3700 som i hovedsak bygger på ''vindsjø'' klassifiseringen fra Douglas.','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('sea_state_type','The state of the sea by how the sea looks like and behaves.','WMO code table 3700 which largely adopts the ''wind sea'' definition of the Douglas Sea Scale.','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('stateofground_codes','Code table for different state of ground, like dry or wet.','WMO code table 0975.','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('stateofground_codes','Markas tilstand som tørr eller våt, snø eller isdekket.','WMO kodetabell 0975.','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('stateofground_codes','Markas tilstand som tørr eller våt, snø eller isdekket.','WMO kodetabell 0975.','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('tendency_of_air_pressure','Characteristic of pressure tendency.','WMO-code table 0200','en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('tendency_of_air_pressure','Karakteristikk av trykk tendens.','WMO kodetabell 0200','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('tendency_of_air_pressure','Karakteristikk av trykk tendens.','WMO kodetabell 0200','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('time_since_deicing','Icing index, describing time since last de-icing.',null,'en-US');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('time_since_deicing','Indeks som fortel om tida sidan sist avising.',null,'nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('time_since_deicing','Isingsindeks som beskriver tiden siden siste avising.',null,'nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('weather_symbol','Værsymboler som følger symboler for værprognoser basert på en kombinasjon av observert vær og skydekke.','Lokalt generert kodetabell.','nb-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('weather_symbol','Værsymboler som følger symboler for værprognoser basert på en kombinasjon av observert vær og skydekke.','Lokalt generert kodetabell.','nn-NO');
insert into codetable_description (codetable_id, description, additional_info, description_locale) values ('weather_symbol','Weather symbols according to symbols used in forecast. Weather symbols based on observed weather type and cloud cover.','Local generated code table','en-US');

--insert weather symbol
insert into element_codetable (element_id, codetable_name) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)', 'weather_symbol');


# --- !Downs

