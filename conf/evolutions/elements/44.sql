# --- !Ups

--script for adding codetable entries for past_weather
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 1,'Cloud covering more than half the sky during part of the period and half or less for the rest',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 2,'Cloud covering more than half the sky throughout the period',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 3,'Sandstorm, duststorm or blowing snow',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 4,'Fog or ice fog or thick haze',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 5,'Drizzle',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 6,'Rain',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 7,'Snow, or rain and snow mixed',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 8,'Shower(s)',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 9,'Thunderstorm(s) with or without precipitation',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 0,'Cloud covering half or less of the sky throughout the period',NULL,'en-US');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 0,'Skyer som dekker halvparten eller mindre av himmelen hele perioden',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 1,'Skyer som dekker mer enn halve himmelen i en del av perioden og halvparten eller mindre i resten av perioden',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 2,'Skyer som dekker mer enn halve himmelen i hele perioden',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 3,'Sandstorm, støvstorm eller snøfokk',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 4,'Tåke eller iståke eller tykk dis',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 5,'Duskregn',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 6,'Regn',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 7,'Snø eller regn og snø blandet ',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 8,'Byger',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 9,'Tordenvær med eller uten nedbør',NULL,'nb-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 0,'Skyer som dekker halvparten eller mindre av himmelen heile perioden',NULL,'nn-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 1,'Skyer som dekker meir enn halve himmelen i ein del av perioden og halvparten eller mindre i resten av perioden',NULL,'nn-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 2,'Skyer som dekker meir enn halve himmelen i heile perioden',NULL,'nn-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 3,'Sandstorm, støvstorm eller snøfokk',NULL,'nn-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 4,'Tåke eller iståke eller tjukk dis',NULL,'nn-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 5,'Duskregn',NULL,'nn-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 6,'Regn',NULL,'nn-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 7,'Snø eller regn og snø blanda',NULL,'nn-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 8,'Byer',NULL,'nn-NO');
INSERT INTO codetable_entry (codetable_id, value, meaning, additional_info, meaning_locale) VALUES ('past_weather', 9,'Torevêr med eller utan nedbør',NULL,'nn-NO');                                                                

UPDATE kdvh_element SET param_id =NULL WHERE element_id LIKE 'best_estimate%';


--Remove mean(min(grass_temperature PT1H) P1M) since it already exists as mean(min(grass_temperature P1D) P1M)
DELETE FROM element WHERE id='mean(min(grass_temperature PT1H) P1M)';

DELETE FROM element WHERE id='number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)';

--error in element id
UPDATE element SET id='integral_of_excess(mean(air_temperature P1D) P1D 0.0)' WHERE id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)';

UPDATE element SET id='integral_of_excess(mean(air_temperature P1D) P1D 5.0)' WHERE id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)';

--update kdvh_element 'VERSYMBOL';
UPDATE kdvh_element SET elem_code='versymbol(stnr,dato)' WHERE element_id='over_time(weather_cloud_symbol PT6H)';

-- radiation error:
DELETE FROM kdvh_element WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)' AND elem_code='QSI_010';
UPDATE kdvh_element SET elem_code='X1QSI' WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)' AND elem_code='QSI_01';

# --- !Downs
