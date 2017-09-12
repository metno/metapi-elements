--# --- !Ups

-- remove duplicates from cf_element so that we can set element_id as primary key
DELETE FROM cf_element WHERE element_id='max_wind_speed(wind_from_direction PT20M)';
INSERT INTO cf_element (standard_name, cell_method, unit, status, element_id) VALUES (
  'wind_from_direction',
  'time: maximum (meaning, the corresponding vector to the maximum value of the vector over a time period)',
  'degree',
  '44',
  'max_wind_speed(wind_from_direction PT20M)'
);

-- add constraint
ALTER TABLE cf_element ADD PRIMARY KEY (element_id);


--# --- !Downs
