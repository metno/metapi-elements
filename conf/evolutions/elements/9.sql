# --- !Ups

insert into cf_element values ('air_pressure_at_sea_level', NULL, 'Pa', '37', 'qnh_air_pressure');

# --- !Downs

delete from cf_element where element_id='qnh_air_pressure';
