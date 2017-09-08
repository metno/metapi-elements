# --- !Ups

--make all foreign key constraints cascading
--
ALTER TABLE status_description DROP CONSTRAINT status_description_status_id_fkey;
ALTER TABLE status_description ADD FOREIGN KEY (status_id) REFERENCES status(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
--element_name SET element_id=...
ALTER TABLE element_name DROP CONSTRAINT element_name_element_id_fkey;
ALTER TABLE element_name ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;
--element_description SET element_id=...
ALTER TABLE element_description DROP CONSTRAINT element_description_element_id_fkey;
ALTER TABLE element_description ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;
--element_codetable SET element_id=...
ALTER TABLE element_codetable DROP CONSTRAINT element_codetable_element_id_fkey;
ALTER TABLE element_codetable ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;
--cf_element SET element_id=...
ALTER TABLE cf_element DROP CONSTRAINT cf_element_element_id_fkey;
ALTER TABLE cf_element ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;
--kdvh_element SET element_id=...
ALTER TABLE kdvh_element DROP CONSTRAINT kdvh_element_element_id_fkey;
ALTER TABLE kdvh_element ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;
--metno_element SET element_id=...
ALTER TABLE metno_element DROP CONSTRAINT metno_element_element_id_fkey;
ALTER TABLE metno_element ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;
--element_status SET element_id=...
ALTER TABLE element_status DROP CONSTRAINT element_status_element_id_fkey;
ALTER TABLE element_status ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE element_status DROP CONSTRAINT element_status_status_id_fkey;
ALTER TABLE element_status ADD FOREIGN KEY (status_id) REFERENCES status(id) ON UPDATE CASCADE ON DELETE CASCADE;
--element_category SET element_id=...
ALTER TABLE element_category ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;
--element_sensorlevel SET element_id=...
ALTER TABLE element_sensorlevel DROP CONSTRAINT element_sensorlevel_element_id_fkey;
ALTER TABLE element_sensorlevel ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE element_sensorlevel DROP CONSTRAINT element_sensorlevel_sensorlevel_id_fkey;
ALTER TABLE element_sensorlevel ADD FOREIGN KEY (sensorlevel_id) REFERENCES sensorlevel(id) ON UPDATE CASCADE ON DELETE CASCADE;


--update element status
UPDATE element_status SET status_id='Proposal' WHERE element_id='wind_from_direction_of_gust';
UPDATE element_status SET status_id='Proposal' WHERE element_id='max_wind_speed(wind_from_direction_of_gust PT10M)';
UPDATE element_status SET status_id='Proposal' WHERE element_id='max_wind_speed(wind_from_direction_of_gust PT1H)';

UPDATE status SET id='METNO-name' WHERE id='MET-name';


-- switch the order of double cellmethods
UPDATE cf_element SET cell_method='time: sum (counting a number of X) time: sum' WHERE element_id='number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)';
UPDATE cf_element SET cell_method='time: sum (counting a number of X) time: sum' WHERE element_id='number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)';
UPDATE cf_element SET cell_method='time: mean time: maximum' WHERE element_id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)';
UPDATE cf_element SET cell_method='time: maximum time: mean' WHERE element_id='mean(max(wind_speed P1D) P1M)';
UPDATE cf_element SET cell_method='time: maximum time: mean' WHERE element_id='mean(max(wind_speed PT1H) P1D)';


UPDATE element_name SET name='Antall dager med RR>=1' WHERE name_locale='nb-NO' and element_id='number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)';

UPDATE element SET id='number_of_days_gte(sum(precipitation_amount P1D) P1M 1.0)' WHERE id='number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)';
UPDATE element SET id='max_wind_speed(wind_from_direction PT20M)' WHERE id='from_direction_of_max(wind_speed PT20M)';

INSERT INTO element_status (element_id, status_id) SELECT 'max_wind_speed(wind_from_direction PT20M)', status_id FROM element_status WHERE element_id='max_wind_speed(wind_from_direction PT1H)';

INSERT INTO cf_element (element_id, standard_name, cell_method, unit, status) SELECT 'max_wind_speed(wind_from_direction PT20M)', standard_name, cell_method, unit, status 
FROM cf_element WHERE element_id='max_wind_speed(wind_from_direction PT1H)';

--add standard deviation for directional_spread(sea_surface_peak_period PT20M) and directional_spread(sea_surface_wave_total_energy PT20M)  
INSERT INTO cf_element (element_id, standard_name, cell_method, unit, status) 
VALUES ('directional_spread(sea_surface_peak_period PT20M)', NULL, 'time: standard_deviation (directional spread)', 'undefined', 'METNO-name');

INSERT INTO cf_element (element_id, standard_name, cell_method, unit, status) 
VALUES ('directional_spread(sea_surface_wave_total_energy PT20M)', NULL, 'time: standard_deviation (directional spread)', 'undefined', 'METNO-name');


--change the radiation elements
--QLI
UPDATE element SET id='mean(surface_downwelling_longwave_flux_in_air PT1H)' WHERE id='surface_downwelling_longwave_flux_in_air';

--QLI_01
INSERT INTO element (id, unit) select 'mean(surface_downwelling_longwave_flux_in_air PT1M)', unit FROM element WHERE id='mean(surface_downwelling_longwave_flux_in_air PT1H)';
INSERT INTO element_name (element_id, name, name_locale) SELECT 'mean(surface_downwelling_longwave_flux_in_air PT1M)', name, name_locale FROM element_name WHERE element_id='mean(surface_downwelling_longwave_flux_in_air PT1H)';
INSERT INTO element_description (element_id, description, description_locale) SELECT 'mean(surface_downwelling_longwave_flux_in_air PT1M)', description, description_locale FROM element_description WHERE element_id='mean(surface_downwelling_longwave_flux_in_air PT1H)';

INSERT INTO cf_element (element_id, standard_name, cell_method, unit, status) SELECT 'mean(surface_downwelling_longwave_flux_in_air PT1M)', standard_name, cell_method, unit, status FROM cf_element WHERE element_id='mean(surface_downwelling_longwave_flux_in_air PT1H)';

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) SELECT 'mean(surface_downwelling_longwave_flux_in_air PT1M)', elem_code,param_id,unit, level_value FROM kdvh_element  WHERE elem_code='QLI_01';


INSERT INTO element_status (element_id, status_id) SELECT 'mean(surface_downwelling_longwave_flux_in_air PT1M)', status_id FROM element_status WHERE element_id='mean(surface_downwelling_longwave_flux_in_air PT1H)';
INSERT INTO element_category (element_id, category, category_locale) SELECT 'mean(surface_downwelling_longwave_flux_in_air PT1M)', category, category_locale FROM element_category WHERE element_id='mean(surface_downwelling_longwave_flux_in_air PT1H)';

--QLO
UPDATE element SET id='mean(surface_upwelling_longwave_flux_in_air PT1H)' WHERE id='surface_upwelling_longwave_flux_in_air';

--QLO_01
INSERT INTO element (id, unit) SELECT 'mean(surface_upwelling_longwave_flux_in_air PT1M)', unit FROM element WHERE id='mean(surface_upwelling_longwave_flux_in_air PT1H)';
INSERT INTO element_name (element_id, name, name_locale) SELECT 'mean(surface_upwelling_longwave_flux_in_air PT1M)', name, name_locale FROM element_name WHERE element_id='mean(surface_upwelling_longwave_flux_in_air PT1H)';
INSERT INTO element_description (element_id, description, description_locale) SELECT 'mean(surface_upwelling_longwave_flux_in_air PT1M)', description, description_locale FROM element_description WHERE element_id='mean(surface_upwelling_longwave_flux_in_air PT1H)';

INSERT INTO cf_element (element_id, standard_name, cell_method, unit, status) SELECT 'mean(surface_upwelling_longwave_flux_in_air PT1M)', standard_name, cell_method, unit, status FROM cf_element WHERE element_id='mean(surface_upwelling_longwave_flux_in_air PT1H)';

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) SELECT 'mean(surface_upwelling_longwave_flux_in_air PT1M)', elem_code,'2102',unit, level_value FROM kdvh_element  WHERE elem_code='QLO_01';


INSERT INTO element_status (element_id, status_id) select 'mean(surface_upwelling_longwave_flux_in_air PT1M)', status_id from element_status WHERE element_id='mean(surface_upwelling_longwave_flux_in_air PT1H)';
INSERT INTO element_category (element_id, category, category_locale) select 'mean(surface_upwelling_longwave_flux_in_air PT1M)', category, category_locale from element_category  WHERE element_id='mean(surface_upwelling_longwave_flux_in_air PT1H)';

--QLOX
UPDATE element SET id='max(mean(surface_upwelling_longwave_flux_in_air PT1M) PT1H)' WHERE id='max(surface_upwelling_longwave_flux_in_air PT1H)';

--QSO
UPDATE element SET id='mean(surface_upwelling_shortwave_flux_in_air PT1H)' WHERE id='surface_upwelling_shortwave_flux_in_air';

--QSO_01
INSERT INTO element (id, unit) SELECT 'mean(surface_upwelling_shortwave_flux_in_air PT1M)', unit FROM element WHERE id='mean(surface_upwelling_shortwave_flux_in_air PT1H)';
INSERT INTO element_name (element_id, name, name_locale) select 'mean(surface_upwelling_shortwave_flux_in_air PT1M)', name, name_locale FROM element_name WHERE element_id='mean(surface_upwelling_shortwave_flux_in_air PT1H)';
INSERT INTO element_description (element_id, description, description_locale) SELECT 'mean(surface_upwelling_shortwave_flux_in_air PT1M)', description, description_locale FROM element_description WHERE element_id='mean(surface_upwelling_shortwave_flux_in_air PT1H)';

INSERT INTO cf_element (element_id, standard_name, cell_method, unit, status) SELECT 'mean(surface_upwelling_shortwave_flux_in_air PT1M)', standard_name, cell_method, unit, status FROM cf_element WHERE element_id='mean(surface_upwelling_shortwave_flux_in_air PT1H)';

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) SELECT 'mean(surface_upwelling_shortwave_flux_in_air PT1M)', elem_code,param_id,unit, level_value FROM kdvh_element WHERE elem_code='QSO_01';


INSERT INTO element_status (element_id, status_id) SELECT 'mean(surface_upwelling_shortwave_flux_in_air PT1M)', status_id FROM element_status WHERE element_id='mean(surface_upwelling_shortwave_flux_in_air PT1H)';
INSERT INTO element_category (element_id, category, category_locale) SELECT 'mean(surface_upwelling_shortwave_flux_in_air PT1M)', category, category_locale FROM element_category WHERE element_id='mean(surface_upwelling_shortwave_flux_in_air PT1H)';

--QSI
UPDATE element SET id='mean(surface_downwelling_shortwave_flux_in_air PT1H)' WHERE id='surface_downwelling_shortwave_flux_in_air';

--QSI_01
INSERT INTO element (id, unit) SELECT 'mean(surface_downwelling_shortwave_flux_in_air PT1M)', unit FROM element WHERE id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';
INSERT INTO element_name (element_id, name, name_locale) select 'mean(surface_downwelling_shortwave_flux_in_air PT1M)', name, name_locale from element_name WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';
INSERT INTO element_description (element_id, description, description_locale) select 'mean(surface_downwelling_shortwave_flux_in_air PT1M)', description, description_locale from element_description WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';

INSERT INTO cf_element (element_id, standard_name, cell_method, unit, status) select 'mean(surface_downwelling_shortwave_flux_in_air PT1M)', standard_name, cell_method, unit, status from cf_element WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) select 'mean(surface_downwelling_shortwave_flux_in_air PT1M)', elem_code,param_id,unit, level_value from kdvh_element  WHERE elem_code='QSI_01';


INSERT INTO element_status (element_id, status_id) select 'mean(surface_downwelling_shortwave_flux_in_air PT1M)', status_id from element_status WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';
INSERT INTO element_category (element_id, category, category_locale) select 'mean(surface_downwelling_shortwave_flux_in_air PT1M)', category, category_locale from element_category  WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';

--QSI_010
insert into element (id, unit) select 'mean(surface_downwelling_shortwave_flux_in_air PT10M)', unit from element WHERE id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';
INSERT INTO element_name (element_id, name, name_locale) select 'mean(surface_downwelling_shortwave_flux_in_air PT10M)', name, name_locale from element_name WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';
INSERT INTO element_description (element_id, description, description_locale) select 'mean(surface_downwelling_shortwave_flux_in_air PT10M)', description, description_locale from element_description WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';

INSERT INTO cf_element (element_id, standard_name, cell_method, unit, status) select 'mean(surface_downwelling_shortwave_flux_in_air PT10M)', standard_name, cell_method, unit, status from cf_element WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) select 'mean(surface_downwelling_shortwave_flux_in_air PT10M)', elem_code,param_id,unit, level_value from kdvh_element  WHERE elem_code='QSI_010';


INSERT INTO element_status (element_id, status_id) select 'mean(surface_downwelling_shortwave_flux_in_air PT10M)', status_id from element_status WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';
INSERT INTO element_category (element_id, category, category_locale) select 'mean(surface_downwelling_shortwave_flux_in_air PT10M)', category, category_locale from element_category  WHERE element_id='mean(surface_downwelling_shortwave_flux_in_air PT1H)';

--QA surface_albedo
UPDATE element SET id='mean(surface_albedo PT1H)' WHERE id='surface_albedo';

--QD diffuse_downwelling_shortwave_flux_in_air
UPDATE element SET id='mean(diffuse_downwelling_shortwave_flux_in_air PT1H)' WHERE id='diffuse_downwelling_shortwave_flux_in_air';

--updating
UPDATE element SET id='sum(precipitation_amount P30D)' WHERE id='sum(precipitation_amount PT30D)';

DELETE FROM element WHERE id='sum(precipitation_amount PT720H)';

UPDATE element SET id='max_wind_speed(wind_from_direction PT20M)' WHERE id='from_direction_of_max(wind_speed PT20M)';

UPDATE cf_element SET cell_method='time: maximum (meaning, the corresponding vector to the maximum value of the vector over a time period)', unit='degree', standard_name='wind_from_direction' WHERE element_id='max_wind_speed(wind_from_direction PT20M)';

DELETE FROM metno_element WHERE element_id='from_direction_of_max(wind_speed PT20M)';

UPDATE element_status SET status_id='CF-name' WHERE element_id='max_wind_speed(wind_from_direction PT20M)';


--INSERT INTO element_status (element_id, status_id) VALUES ('max_wind_speed(wind_from_direction PT20M)', 'CF-name');

INSERT INTO element_status (element_id, status_id) VALUES ('sum_over_undefined_period(precipitation_amount P1M)', 'CF-name');

DELETE FROM element WHERE id='mean(surface_temperature PT1H)';
DELETE FROM element WHERE id='max(surface_temperature PT1H)';
DELETE FROM element WHERE id='min(surface_temperature PT1H)';

--add X1TGM, X2TGM, X3TGM to mean grass temperature to kdvh_element
INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) 
VALUES ('mean(grass_temperature PT1H)','X1TGM',null,'degC', NULL);

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) 
VALUES ('mean(grass_temperature PT1H)','X2TGM',null,'degC', NULL);

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) 
VALUES ('mean(grass_temperature PT1H)','X3TGM',null,'degC', NULL);

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) 
VALUES ('max(grass_temperature PT1H)','X1TGX',null,'degC', NULL);

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) 
VALUES ('max(grass_temperature PT1H)','X2TGX',null,'degC', NULL);

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) 
VALUES ('max(grass_temperature PT1H)','X3TGX',null,'degC', NULL);

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) 
VALUES ('min(grass_temperature PT1H)','X1TGN',null,'degC', NULL);

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) 
VALUES ('min(grass_temperature PT1H)','X2TGN',null,'degC', NULL);

INSERT INTO kdvh_element (element_id, elem_code,param_id,unit, level_value) 
VALUES ('min(grass_temperature PT1H)','X3TGN',null,'degC', NULL);

INSERT INTO element_status (element_id, status_id) VALUES ('min(min(grass_temperature PT1H) P1M)', 'METNO-name');

INSERT INTO element_status (element_id, status_id) VALUES ('max(min(grass_temperature PT1H) P1M)', 'METNO-name');

# --- !Downs
