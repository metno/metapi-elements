# --- !Ups

Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('beaufort_wind_force','beaufort_scale');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('instant_weather_type','instant_vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('instant_weather_type_significance1','vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('instant_weather_type_significance2','vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('instant_weather_type_significance3','vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('max(beaufort_wind_force T6H)','beaufort_scale');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('max(sea_state 1M)','seastate_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('max(sea_state T24H)','seastate_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('max(timeperiod_weather_type_significance1 T24H)','vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('min(sea_state 1M)','seastate_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('min(sea_state T24H)','seastate_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('sea_state','seastate_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('state_of_ground','state_of_ground');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_significance1','vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_significance1_intensity','intensity_vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_significance2','vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_significance2_intensity','intensity_vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_significance3','vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_significance3_intensity','intensity_vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_significance4','vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_wmo_additional1','timeperiod_add_vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_wmo_additional2','timeperiod_add_vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_wmo_additional3','timeperiod_add_vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_wmo_significance1','timeperiod_vx_type');
Insert into ELEMENT_CODETABLE (ELEMENT_ID,CODETABLE_NAME) values ('timeperiod_weather_type_wmo_significance2','timeperiod_vx_type');



# --- !Downs

DELETE FROM ELEMENT_CODETABLE;