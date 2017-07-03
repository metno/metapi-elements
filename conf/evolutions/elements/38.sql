# --- !Ups

-- add constraint
ALTER TABLE calculation_method ADD PRIMARY KEY (method_id,description_locale);

-- remove duplicates
DELETE FROM cf_element WHERE element_id='humidity_mixing_ratio';
INSERT INTO cf_element (standard_name, cell_method, unit, status, element_id) VALUES ('humidity_mixing_ratio', null, '1', '44', 'humidity_mixing_ratio');
DELETE FROM cf_element WHERE element_id='air_pressure_at_sea_level_qnh';
INSERT INTO cf_element (standard_name, cell_method, unit, status, element_id) VALUES ('air_pressure_at_sea_level', null, 'Pa', '44', 'air_pressure_at_sea_level_qnh');
DELETE FROM cf_element WHERE element_id='accumulated(precipitation_amount)';
INSERT INTO cf_element (standard_name, cell_method, unit, status, element_id) VALUES ('precipitation_amount', 'time: sum (accumulated since the value was 0)', 'kg m-2', '44', 'accumulated(precipitation_amount)');

-- add constraints
ALTER TABLE cf_element ADD FOREIGN KEY (element_id) REFERENCES element(id);

-- add constraint
ALTER TABLE codetable ADD PRIMARY KEY (id);

-- add missing rows
INSERT INTO codetable (id) VALUES ('tendency_of_air_pressure'), ('time_since_deicing');

-- add constraints
ALTER TABLE codetable_description ADD PRIMARY KEY (codetable_id,description_locale);
ALTER TABLE codetable_description ADD FOREIGN KEY (codetable_id) REFERENCES codetable(id);

-- add constraints
ALTER TABLE codetable_entry ADD PRIMARY KEY (codetable_id,value,meaning_locale);
ALTER TABLE codetable_entry ADD FOREIGN KEY (codetable_id) REFERENCES codetable(id);

-- remove obsolete rows
DELETE FROM element_category WHERE element_id='mean(wind_from_direction PT1H)' AND category IN ('Bølger', 'Waves');

-- add constraint
ALTER TABLE element_category ADD PRIMARY KEY (element_id,category_locale);

-- remove obsolete row
DELETE FROM element_codetable WHERE element_id='max(timeperiod_weather_type_significance1 PT24H)';

-- correct misspelled name
UPDATE element_codetable SET codetable_name='sea_state_type' WHERE codetable_name='seastate_type';

-- add constraints
ALTER TABLE element_codetable ADD PRIMARY KEY (element_id);
ALTER TABLE element_codetable ADD FOREIGN KEY (codetable_name) REFERENCES codetable(id);
ALTER TABLE element_codetable ADD FOREIGN KEY (element_id) REFERENCES element(id);

-- remove obsolete rows
DELETE FROM element_description WHERE element_id='mean(relative_humidity PT1H)' AND description='Mean relative humidity';
DELETE FROM element_description WHERE element_id='mean(relative_humidity PT1H)' AND description='Midlere relativ luftfuktighet';
DELETE FROM element_description WHERE element_id='mean(relative_humidity PT1H)' AND description='Middel av relativ luftfukt';
DELETE FROM element_description WHERE element_id='min(snow_temperature PT1H)' AND description='Snow temperature in °C, minimum minute value last hour depth=125cm';
DELETE FROM element_description WHERE element_id='min(snow_temperature PT1H)' AND description='Snøtemperatur i °C, minimum  minuttverdi i timen dybde=125';
DELETE FROM element_description WHERE element_id='max(snow_temperature PT1H)' AND description='Snow temperature in °C, maximum minute value last hour depth=125';
DELETE FROM element_description WHERE element_id='max(snow_temperature PT1H)' AND description='Snøtemperatur i °C, maksimum  minuttverdi i timen';

-- add constraints
ALTER TABLE element_description ADD PRIMARY KEY (element_id,description_locale);
ALTER TABLE element_description ADD FOREIGN KEY (element_id) REFERENCES element(id);

-- remove obsolete rows
DELETE FROM element_name WHERE element_id='mean(relative_humidity PT1H)' AND name='Midlere relativ luftfuktighet';
DELETE FROM element_name WHERE element_id='min(snow_temperature PT1H)' AND name='Snøtemperatur';
DELETE FROM element_name WHERE element_id='max(snow_temperature PT1H)' AND name='Snøtemperatur';
DELETE FROM element_name WHERE element_id='mean(relative_humidity PT1H)' AND name='Mean relative humidity';
DELETE FROM element_name WHERE element_id='max(snow_temperature PT1H)' AND name='Snow temperature';
DELETE FROM element_name WHERE element_id='mean(relative_humidity PT1H)' AND name='Middel av relativ luftfukt';
DELETE FROM element_name WHERE element_id='min(snow_temperature PT1H)' AND name='Snow temperature';

-- add constraints
ALTER TABLE element_name ADD PRIMARY KEY (element_id,name_locale);
ALTER TABLE element_name ADD FOREIGN KEY (element_id) REFERENCES element(id);

-- normalize
DROP TABLE status;
CREATE TABLE status (id text PRIMARY KEY NOT NULL);
INSERT INTO status (id) VALUES ('MET-name'), ('MET-test'), ('CF-name'), ('CF-alias'), ('Proposal');
CREATE TABLE status_description (status_id text NOT NULL REFERENCES status(id), description text NOT NULL, description_locale locale NOT NULL, PRIMARY KEY (status_id, description_locale));
INSERT INTO status_description (status_id, description_locale, description) VALUES
('MET-name', 'en-US', 'MET Norway local standard.'),
('MET-name', 'nb-NO', 'Meteorologisk institutts standard navn.'),
('MET-name', 'nn-NO', 'Meteorologisk institutts standard navn.'),
('MET-test', 'en-US', 'MET Norway - under construction.'),
('MET-test', 'nb-NO', 'Navnet er under arbeid på Meteorologisk institutt.'),
('MET-test', 'nn-NO', 'Navnet er under arbeid på Meteorologisk institutt.'),
('CF-name',  'en-US', 'CF convention standard name.'),
('CF-name',  'nb-NO', 'Standard navn i CF konvensjonen.'),
('CF-name',  'nn-NO', 'Standard navn i CF konvensjonen.'),
('CF-alias', 'en-US', 'Alias for a standard name in the CF convention.'),
('CF-alias', 'nb-NO', 'Alias for et standard navn i CF konvensjonen.'),
('CF-alias', 'nn-NO', 'Alias for et standard navn i CF konvensjonen.'),
('Proposal', 'en-US', 'Name in review as CF standard.'),
('Proposal', 'nb-NO', 'Navnet er under behandling i CF konvensjonens panel.'),
('Proposal', 'nn-NO', 'Navnet er under behandling i CF konvensjonens panel.');

-- remove duplicates
DELETE FROM element_status WHERE element_id='over_time(weather_cloud_symbol PT6H)';
INSERT INTO element_status (element_id, status_id) VALUES ('over_time(weather_cloud_symbol PT6H)', 'MET-name');

-- remove obsolete references
DELETE FROM element_status WHERE element_id IN ('instant_weather_type_from_instrument', 'timeperiod_weather_type_from_instrument');

-- add constraints
ALTER TABLE element_status ADD PRIMARY KEY (element_id);
ALTER TABLE element_status ADD FOREIGN KEY (element_id) REFERENCES element(id);
ALTER TABLE element_status ADD FOREIGN KEY (status_id) REFERENCES status(id);

-- remove obsolete references
DELETE FROM metno_element WHERE element_id IN ('instant_weather_type_from_instrument', 'timeperiod_weather_type_from_instrument');

-- add constraints
ALTER TABLE metno_element ADD PRIMARY KEY (element_id);
ALTER TABLE metno_element ADD FOREIGN KEY (element_id) REFERENCES element(id);

-- remove duplicates
DELETE FROM kdvh_element WHERE elem_code='TSN125';
INSERT INTO kdvh_element (elem_code, unit, param_id, element_id, level_value) VALUES ('TSN125', 'degC', '236', 'min(snow_temperature PT1H)', '125');
DELETE FROM kdvh_element WHERE elem_code='TSN175';
INSERT INTO kdvh_element (elem_code, unit, param_id, element_id, level_value) VALUES ('TSN175', 'degC', '236', 'min(snow_temperature PT1H)', '175');
DELETE FROM kdvh_element WHERE elem_code='TSN25';
INSERT INTO kdvh_element (elem_code, unit, param_id, element_id, level_value) VALUES ('TSN25', 'degC', '236', 'min(snow_temperature PT1H)', '25');
DELETE FROM kdvh_element WHERE elem_code='TSN75';
INSERT INTO kdvh_element (elem_code, unit, param_id, element_id, level_value) VALUES ('TSN75', 'degC', '236', 'min(snow_temperature PT1H)', '75');
DELETE FROM kdvh_element WHERE elem_code='TSX125';
INSERT INTO kdvh_element (elem_code, unit, param_id, element_id, level_value) VALUES ('TSX125', 'degC', '237', 'max(snow_temperature PT1H)', '125');
DELETE FROM kdvh_element WHERE elem_code='TSX175';
INSERT INTO kdvh_element (elem_code, unit, param_id, element_id, level_value) VALUES ('TSX175', 'degC', '237', 'max(snow_temperature PT1H)', '175');
DELETE FROM kdvh_element WHERE elem_code='TSX25';
INSERT INTO kdvh_element (elem_code, unit, param_id, element_id, level_value) VALUES ('TSX25', 'degC', '237', 'max(snow_temperature PT1H)', '25');
DELETE FROM kdvh_element WHERE elem_code='TSX75';
INSERT INTO kdvh_element (elem_code, unit, param_id, element_id, level_value) VALUES ('TSX75', 'degC', '237', 'max(snow_temperature PT1H)', '75');

-- add constraints
ALTER TABLE kdvh_element ADD PRIMARY KEY (elem_code,element_id);
ALTER TABLE kdvh_element ADD FOREIGN KEY (element_id) REFERENCES element(id);

-- drop obsolete table
DROP TABLE kdvh_time_series;


# --- !Downs
