# --- !Ups

--5.1 delete from element, those that not exists in kdvh_element (to be sure the same elements exists everywhere before inserting new ones)
delete from element where id='instant_weather_type';
delete from element where id='instant_weather_type_significance1';
delete from element where id='instant_weather_type_significance2';
delete from element where id='instant_weather_type_significance3';
delete from element where id='timeperiod_weather_type_significance1';
delete from element where id='timeperiod_weather_type_significance1_intensity';
delete from element where id='timeperiod_weather_type_significance2';
delete from element where id='timeperiod_weather_type_significance2_intensity';
delete from element where id='timeperiod_weather_type_significance3';
delete from element where id='timeperiod_weather_type_significance3_intensity';
delete from element where id='timeperiod_weather_type_significance4';
delete from element where id='timeperiod_weather_type_wmo_additional1';
delete from element where id='timeperiod_weather_type_wmo_additional2';
delete from element where id='timeperiod_weather_type_wmo_additional3';
delete from element where id='timeperiod_weather_type_wmo_significance1';
delete from element where id='timeperiod_weather_type_wmo_significance2';
--5.2 delete from element_name, those that not exists in kdvh_element (to be sure the same elements exists everywhere before inserting new ones)
delete from element_name where element_id='instant_weather_type';
delete from element_name where element_id='instant_weather_type_significance1';
delete from element_name where element_id='instant_weather_type_significance2';
delete from element_name where element_id='instant_weather_type_significance3';
delete from element_name where element_id='timeperiod_weather_type_significance1';
delete from element_name where element_id='timeperiod_weather_type_significance1_intensity';
delete from element_name where element_id='timeperiod_weather_type_significance2';
delete from element_name where element_id='timeperiod_weather_type_significance2_intensity';
delete from element_name where element_id='timeperiod_weather_type_significance3';
delete from element_name where element_id='timeperiod_weather_type_significance3_intensity';
delete from element_name where element_id='timeperiod_weather_type_significance4';
delete from element_name where element_id='timeperiod_weather_type_wmo_additional1';
delete from element_name where element_id='timeperiod_weather_type_wmo_additional2';
delete from element_name where element_id='timeperiod_weather_type_wmo_additional3';
delete from element_name where element_id='timeperiod_weather_type_wmo_significance1';
delete from element_name where element_id='timeperiod_weather_type_wmo_significance2';
--5.3 delete from element_description, those that not exists in kdvh_element (to be sure the same elements exists everywhere before inserting new ones)
delete from element_description where element_id='instant_weather_type';
delete from element_description where element_id='instant_weather_type_significance1';
delete from element_description where element_id='instant_weather_type_significance2';
delete from element_description where element_id='instant_weather_type_significance3';
delete from element_description where element_id='timeperiod_weather_type_significance1';
delete from element_description where element_id='timeperiod_weather_type_significance1_intensity';
delete from element_description where element_id='timeperiod_weather_type_significance2';
delete from element_description where element_id='timeperiod_weather_type_significance2_intensity';
delete from element_description where element_id='timeperiod_weather_type_significance3';
delete from element_description where element_id='timeperiod_weather_type_significance3_intensity';
delete from element_description where element_id='timeperiod_weather_type_significance4';
delete from element_description where element_id='timeperiod_weather_type_wmo_additional1';
delete from element_description where element_id='timeperiod_weather_type_wmo_additional2';
delete from element_description where element_id='timeperiod_weather_type_wmo_additional3';
delete from element_description where element_id='timeperiod_weather_type_wmo_significance1';
delete from element_description where element_id='timeperiod_weather_type_wmo_significance2';
--5.4 delete from element_codetable, those that not exists in kdvh_element (to be sure the same elements exists everywhere before inserting new ones)
delete from element_codetable where element_id='instant_weather_type';
delete from element_codetable where element_id='instant_weather_type_significance1';
delete from element_codetable where element_id='instant_weather_type_significance2';
delete from element_codetable where element_id='instant_weather_type_significance3';
delete from element_codetable where element_id='timeperiod_weather_type_significance1';
delete from element_codetable where element_id='timeperiod_weather_type_significance1_intensity';
delete from element_codetable where element_id='timeperiod_weather_type_significance2';
delete from element_codetable where element_id='timeperiod_weather_type_significance2_intensity';
delete from element_codetable where element_id='timeperiod_weather_type_significance3';
delete from element_codetable where element_id='timeperiod_weather_type_significance3_intensity';
delete from element_codetable where element_id='timeperiod_weather_type_significance4';
delete from element_codetable where element_id='timeperiod_weather_type_wmo_additional1';
delete from element_codetable where element_id='timeperiod_weather_type_wmo_additional2';
delete from element_codetable where element_id='timeperiod_weather_type_wmo_additional3';
delete from element_codetable where element_id='timeperiod_weather_type_wmo_significance1';
delete from element_codetable where element_id='timeperiod_weather_type_wmo_significance2';
--5.5 delete from cf_element, those that not exists in kdvh_element (to be sure the same elements exists everywhere before inserting new ones)
delete from cf_element where element_id='instant_weather_type';
delete from cf_element where element_id='instant_weather_type_significance1';
delete from cf_element where element_id='instant_weather_type_significance2';
delete from cf_element where element_id='instant_weather_type_significance3';
delete from cf_element where element_id='timeperiod_weather_type_significance1';
delete from cf_element where element_id='timeperiod_weather_type_significance1_intensity';
delete from cf_element where element_id='timeperiod_weather_type_significance2';
delete from cf_element where element_id='timeperiod_weather_type_significance2_intensity';
delete from cf_element where element_id='timeperiod_weather_type_significance3';
delete from cf_element where element_id='timeperiod_weather_type_significance3_intensity';
delete from cf_element where element_id='timeperiod_weather_type_significance4';
delete from cf_element where element_id='timeperiod_weather_type_wmo_additional1';
delete from cf_element where element_id='timeperiod_weather_type_wmo_additional2';
delete from cf_element where element_id='timeperiod_weather_type_wmo_additional3';
delete from cf_element where element_id='timeperiod_weather_type_wmo_significance1';
delete from cf_element where element_id='timeperiod_weather_type_wmo_significance2';
--5.6 delete from kdvh_element, those that not exists in kdvh_element (to be sure the same elements exists everywhere before inserting new ones)
delete from kdvh_element where element_id='instant_weather_type';
delete from kdvh_element where element_id='instant_weather_type_significance1';
delete from kdvh_element where element_id='instant_weather_type_significance2';
delete from kdvh_element where element_id='instant_weather_type_significance3';
delete from kdvh_element where element_id='timeperiod_weather_type_significance1';
delete from kdvh_element where element_id='timeperiod_weather_type_significance1_intensity';
delete from kdvh_element where element_id='timeperiod_weather_type_significance2';
delete from kdvh_element where element_id='timeperiod_weather_type_significance2_intensity';
delete from kdvh_element where element_id='timeperiod_weather_type_significance3';
delete from kdvh_element where element_id='timeperiod_weather_type_significance3_intensity';
delete from kdvh_element where element_id='timeperiod_weather_type_significance4';
delete from kdvh_element where element_id='timeperiod_weather_type_wmo_additional1';
delete from kdvh_element where element_id='timeperiod_weather_type_wmo_additional2';
delete from kdvh_element where element_id='timeperiod_weather_type_wmo_additional3';
delete from kdvh_element where element_id='timeperiod_weather_type_wmo_significance1';
delete from kdvh_element where element_id='timeperiod_weather_type_wmo_significance2';

# --- !Downs

