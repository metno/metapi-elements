# --- !Ups

--delete multiple instances
--from element
delete from element where id='boolean_clear_sky_weather(cloud_area_fraction P1D)';
delete from element where id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
delete from element where id='mean(max(wind_speed P1D) P1M)';
delete from element where id='sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)';
delete from element where id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
delete from element where id='max(max(wind_speed PT1H) P1D)';

--from element_name
delete from element_name where element_id='boolean_clear_sky_weather(cloud_area_fraction P1D)';
delete from element_name where element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
delete from element_name where element_id='mean(max(wind_speed P1D) P1M)';
delete from element_name where element_id='sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)';
delete from element_name where element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
delete from element_name where element_id='max(max(wind_speed PT1H) P1D)';

--from element_description
delete from element_description where element_id='boolean_clear_sky_weather(cloud_area_fraction P1D)';
delete from element_description where element_id='integral_of_deficit(mean(air_temperature P1D) P1M 0.0)';
delete from element_description where element_id='mean(max(wind_speed P1D) P1M)';
delete from element_description where element_id='sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)';
delete from element_description where element_id='integral_of_excess(mean(air_temperature PT1H) P1D 17.0)';
delete from element_description where element_id='max(max(wind_speed PT1H) P1D)';

--from element_codetable
delete from kdvh_element where element_id in ('boolean_clear_sky_weather(cloud_area_fraction P1D)','integral_of_deficit(mean(air_temperature P1D) P1M 0.0)','mean(max(wind_speed P1D) P1M)','sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)','integral_of_excess(mean(air_temperature PT1H) P1D 17.0)','max(max(wind_speed PT1H) P1D)') ;

--from cfelement
delete from kdvh_element where element_id in ('boolean_clear_sky_weather(cloud_area_fraction P1D)','integral_of_deficit(mean(air_temperature P1D) P1M 0.0)',
'mean(max(wind_speed P1D) P1M)','sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)','integral_of_excess(mean(air_temperature PT1H) P1D 17.0)','max(max(wind_speed PT1H) P1D)') ;

--from kdvhelement
delete from cf_element where element_id in ('boolean_clear_sky_weather(cloud_area_fraction P1D)','integral_of_deficit(mean(air_temperature P1D) P1M 0.0)',
'mean(max(wind_speed P1D) P1M)','sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)','integral_of_excess(mean(air_temperature PT1H) P1D 17.0)','max(max(wind_speed PT1H) P1D)') ;

# --- !Downs

