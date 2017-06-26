# --- !Ups


-- to avoid potential ambiguities ...

-- remove column default_level from element_sensorlevel

ALTER TABLE element_sensorlevel DROP COLUMN default_level;


-- and define default sensor levels in separate table

CREATE TABLE element_default_sensorlevel (
  element_id TEXT NOT NULL,
  sensorlevel_id TEXT NOT NULL,
  default_level TEXT NOT NULL,
  UNIQUE(element_id, sensorlevel_id)
);

insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('air_temperature', 'height_above_ground', '2');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('from_direction_of_max(wind_speed_of_gust PT1H)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('from_direction_of_max(wind_speed PT1H)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('max(snow_temperature PT1H)', 'depth_below_surface', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('max(wind_speed_of_gust PT1H)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('max(wind_speed P1D)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('max(wind_speed P1M)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('max(wind_speed PT1H)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('mean(snow_temperature PT1H)', 'depth_below_surface', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('mean(soil_temperature PT1H)', 'depth_below_surface', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('mean(soil_temperature PT1H)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('mean(wind_from_direction PT1H)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('mean(wind_speed P1D)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('mean(wind_speed P1M)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('mean(wind_speed PT1H)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('min(snow_temperature PT1H)', 'depth_below_surface', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('min(wind_speed P1D)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('min(wind_speed P1M)', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('sea_water_speed', 'depth_below_sea_surface', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('sea_water_to_direction', 'depth_below_sea_surface', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('snow_temperature', 'depth_below_surface', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('soil_temperature', 'depth_below_surface', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('volume_fraction_of_water_in_soil', 'depth_below_surface', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('wind_from_direction', 'height_above_ground', '10');
insert into element_default_sensorlevel (element_id, sensorlevel_id, default_level) values ('wind_speed', 'height_above_ground', '10');


# --- !Downs
