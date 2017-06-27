# --- !Ups

-- improve schema for sensor levels

-- remove duplicates from element so that we can set id as primary key
DELETE FROM element WHERE id='min(snow_temperature PT1H)';
INSERT INTO element (id, unit) VALUES ('min(snow_temperature PT1H)', 'degC');
DELETE FROM element WHERE id='max(snow_temperature PT1H)';
INSERT INTO element (id, unit) VALUES ('max(snow_temperature PT1H)', 'degC');
DELETE FROM element WHERE id='mean(relative_humidity PT1H)';
INSERT INTO element (id, unit) VALUES ('mean(relative_humidity PT1H)', 'percent');
DELETE FROM element WHERE id='volume_fraction_of_water_in_soil';
INSERT INTO element (id, unit) VALUES ('volume_fraction_of_water_in_soil', 'percent');
DELETE FROM element WHERE id='sea_surface_height';
INSERT INTO element (id, unit) VALUES ('sea_surface_height', 'meters');

-- set id as primary key so that it can be referred to as a foreign key from element_sensorlevel
ALTER TABLE element ADD PRIMARY KEY (id);

DROP TABLE sensorlevel;
DROP TABLE element_sensorlevel;
DROP TABLE element_default_sensorlevel;

CREATE TABLE sensorlevel (
  id text PRIMARY KEY NOT NULL,
  unit text NOT NULL
);

INSERT INTO sensorlevel (id, unit) VALUES ('height_above_ground', 'm');
INSERT INTO sensorlevel (id, unit) VALUES ('depth_below_surface', 'cm');
INSERT INTO sensorlevel (id, unit) VALUES ('depth_below_sea_surface', 'm');

CREATE TABLE element_sensorlevel (
  element_id text PRIMARY KEY REFERENCES element(id),
  sensorlevel_id text REFERENCES sensorlevel(id),
  default_value double precision NOT NULL,
  values double precision[] NOT NULL CHECK(values <> '{}')
);

INSERT INTO element_sensorlevel (element_id, sensorlevel_id, default_value, values) VALUES
  ('air_temperature', 'height_above_ground', 2, '{2,10,25}'),
  ('max(snow_temperature PT1H)', 'depth_below_surface', 10, '{25,75,125,175}'),
  ('max(wind_speed_of_gust PT1H)', 'height_above_ground', 10, '{2,10}'),
  ('max(wind_speed P1D)', 'height_above_ground', 10, '{2,10}'),
  ('max(wind_speed P1M)', 'height_above_ground', 10, '{2,10}'),
  ('max(wind_speed PT1H)', 'height_above_ground', 10, '{2,10}'),
  ('max_wind_speed(wind_from_direction_of_gust PT1H)', 'height_above_ground', 10, '{2,10}'),
  ('max_wind_speed(wind_from_direction PT1H)', 'height_above_ground', 10, '{2,10}'),
  ('mean(snow_temperature PT1H)', 'depth_below_surface', 10, '{25,75,125,175}'),
  ('mean(soil_temperature PT1H)', 'depth_below_surface', 10, '{1,2,5,10,20,30,50,100}'),
  ('mean(wind_from_direction PT1H)', 'height_above_ground', 10, '{2,10}'),
  ('mean(wind_speed P1D)', 'height_above_ground', 10, '{2,10}'),
  ('mean(wind_speed P1M)', 'height_above_ground', 10, '{2,10}'),
  ('mean(wind_speed PT1H)', 'height_above_ground', 10, '{2,10}'),
  ('min(snow_temperature PT1H)', 'depth_below_surface', 10, '{25,75,125,175}'),
  ('min(wind_speed P1D)', 'height_above_ground', 10, '{2,10}'),
  ('min(wind_speed P1M)', 'height_above_ground', 10, '{2,10}'),
  ('sea_water_speed', 'depth_below_sea_surface', 10, '{15,18,30,40,69,75,98,147}'),
  ('sea_water_to_direction', 'depth_below_sea_surface', 10, '{15,18,30,40,69,75,98,147}'),
  ('snow_temperature', 'depth_below_surface', 10, '{25,75,125,175}'),
  ('soil_temperature', 'depth_below_surface', 10, '{0,1,5,10,15,20,25,30,40,45,50,80,95,100,120,160,200,250,300,350,400,450,500,550,600,650,670,700,750,800,850,900,950,1000,1100,1200,1300,1400,1500,1750,2000,2500,3000,3500,4000,4500,5000,5250,6000,7000,8000,8500,9000,9500,9750,10000}'),
  ('volume_fraction_of_water_in_soil', 'depth_below_surface', 10, '{10,20,30,40}'),
  ('wind_from_direction', 'height_above_ground', 10, '{2,10}'),
  ('wind_speed', 'height_above_ground', 10, '{2,10}');


# --- !Downs
