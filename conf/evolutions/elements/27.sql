# --- !Ups

--update of some elements do still use the PT24H timeperiod, but should use the P1D

--remove because exists with correct name using 1D already
delete from element where id in ('sum(boolean_clear_sky_weather(cloud_area_fraction PT24H) P1M)',  
'sum(boolean_fair_weather(cloud_area_fraction PT24H) P1M)', 
'integral_of_excess(mean(air_temperature PT1H) PT24H P17.0)', 
'integral_of_excess(mean(air_temperature PT24H) P1M P17.0)', 
'integral_of_deficit(mean(air_temperature PT24H) P1M 0.0)', 
'integral_of_deficit(mean(air_temperature PT1H) PT24H 0.0)', 
'boolean_clear_sky_weather(cloud_area_fraction PT24H)',   
'boolean_fair_weather(cloud_area_fraction PT24H)',  
 'max(max(wind_speed PT24H) P1M)',  
'max(max(wind_speed PT1H) PT24H)',  
'mean(max(wind_speed PT24H) P1M)',  
'mean(max(wind_speed PT1H) PT24H)'); 

delete from element_name where element_id in ('sum(boolean_clear_sky_weather(cloud_area_fraction PT24H) P1M)',  
'sum(boolean_fair_weather(cloud_area_fraction PT24H) P1M)', 
'integral_of_excess(mean(air_temperature PT1H) PT24H P17.0)', 
'integral_of_excess(mean(air_temperature PT24H) P1M P17.0)', 
'integral_of_deficit(mean(air_temperature PT24H) P1M 0.0)', 
'integral_of_deficit(mean(air_temperature PT1H) PT24H 0.0)', 
'boolean_clear_sky_weather(cloud_area_fraction PT24H)',   
'boolean_fair_weather(cloud_area_fraction PT24H)',  
 'max(max(wind_speed PT24H) P1M)',  
'max(max(wind_speed PT1H) PT24H)',  
'mean(max(wind_speed PT24H) P1M)',  
'mean(max(wind_speed PT1H) PT24H)');

delete from element_description where element_id in ('sum(boolean_clear_sky_weather(cloud_area_fraction PT24H) P1M)',  
'sum(boolean_fair_weather(cloud_area_fraction PT24H) P1M)', 
'integral_of_excess(mean(air_temperature PT1H) PT24H P17.0)', 
'integral_of_excess(mean(air_temperature PT24H) P1M P17.0)', 
'integral_of_deficit(mean(air_temperature PT24H) P1M 0.0)', 
'integral_of_deficit(mean(air_temperature PT1H) PT24H 0.0)', 
'boolean_clear_sky_weather(cloud_area_fraction PT24H)',   
'boolean_fair_weather(cloud_area_fraction PT24H)',  
 'max(max(wind_speed PT24H) P1M)',  
'max(max(wind_speed PT1H) PT24H)',  
'mean(max(wind_speed PT24H) P1M)',  
'mean(max(wind_speed PT1H) PT24H)');

delete from element_codetable where element_id in ('sum(boolean_clear_sky_weather(cloud_area_fraction PT24H) P1M)',  
'sum(boolean_fair_weather(cloud_area_fraction PT24H) P1M)', 
'integral_of_excess(mean(air_temperature PT1H) PT24H P17.0)', 
'integral_of_excess(mean(air_temperature PT24H) P1M P17.0)', 
'integral_of_deficit(mean(air_temperature PT24H) P1M 0.0)', 
'integral_of_deficit(mean(air_temperature PT1H) PT24H 0.0)', 
'boolean_clear_sky_weather(cloud_area_fraction PT24H)',   
'boolean_fair_weather(cloud_area_fraction PT24H)',  
 'max(max(wind_speed PT24H) P1M)',  
'max(max(wind_speed PT1H) PT24H)',  
'mean(max(wind_speed PT24H) P1M)',  
'mean(max(wind_speed PT1H) PT24H)');


delete from kdvh_element where element_id in ('sum(boolean_clear_sky_weather(cloud_area_fraction PT24H) P1M)',  
'sum(boolean_fair_weather(cloud_area_fraction PT24H) P1M)', 
'integral_of_excess(mean(air_temperature PT1H) PT24H P17.0)', 
'integral_of_excess(mean(air_temperature PT24H) P1M P17.0)', 
'integral_of_deficit(mean(air_temperature PT24H) P1M 0.0)', 
'integral_of_deficit(mean(air_temperature PT1H) PT24H 0.0)', 
'boolean_clear_sky_weather(cloud_area_fraction PT24H)',   
'boolean_fair_weather(cloud_area_fraction PT24H)',  
 'max(max(wind_speed PT24H) P1M)',  
'max(max(wind_speed PT1H) PT24H)',  
'mean(max(wind_speed PT24H) P1M)',  
'mean(max(wind_speed PT1H) PT24H)');

delete from cf_element where element_id in ('sum(boolean_clear_sky_weather(cloud_area_fraction PT24H) P1M)',  
'sum(boolean_fair_weather(cloud_area_fraction PT24H) P1M)', 
'integral_of_excess(mean(air_temperature PT1H) PT24H P17.0)', 
'integral_of_excess(mean(air_temperature PT24H) P1M P17.0)', 
'integral_of_deficit(mean(air_temperature PT24H) P1M 0.0)', 
'integral_of_deficit(mean(air_temperature PT1H) PT24H 0.0)', 
'boolean_clear_sky_weather(cloud_area_fraction PT24H)',   
'boolean_fair_weather(cloud_area_fraction PT24H)',  
 'max(max(wind_speed PT24H) P1M)',  
'max(max(wind_speed PT1H) PT24H)',  
'mean(max(wind_speed PT24H) P1M)',  
'mean(max(wind_speed PT1H) PT24H)');

update element set id='best_estimate_mean(air_temperature P1D)' where     id='best_estimate_mean(air_temperature PT24H)';             
update element set id='boolean_overcast_weather(cloud_area_fraction P1D)' where     id='boolean_overcast_weather(cloud_area_fraction PT24H)';        
update element set id='change_over_time(surface_snow_amount P1D)' where     id='change_over_time(surface_snow_amount PT24H)';               
update element set id='change_over_time(surface_snow_thickness P1D)' where     id='change_over_time(surface_snow_thickness PT24H)';             
update element set id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)' where   id='integral_of_deficit(mean(air_temperature PT1H) PT24H 5.0)';             
update element set id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)' where   id='integral_of_deficit(mean(air_temperature PT24H) P1M 5.0)';             
update element set id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)' where   id='integral_of_excess_interpolated(mean(air_temperature PT24H) P1M P17.0)';             
update element set id='max(air_pressure_at_sea_level P1D)' where     id='max(air_pressure_at_sea_level PT24H)';               
update element set id='max(air_temperature P1D)' where     id='max(air_temperature PT24H)';              
update element set id='max(cloud_area_fraction P1D)' where     id='max(cloud_area_fraction PT24H)';               
update element set id='max(relative_humidity P1D)' where     id='max(relative_humidity PT24H)';               
update element set id='max(sea_state P1D)' where     id='max(sea_state PT24H)';               
update element set id='max(sea_surface_wave_period_from_instrument P1D)' where     id='max(sea_surface_wave_period_from_instrument PT24H)';               
update element set id='max(sea_surface_wave_significant_height_from_instrument P1D)' where     id='max(sea_surface_wave_significant_height_from_instrument PT24H)';               
update element set id='max(sum(duration_of_sunshine P1D) P1M)' where    id='max(sum(duration_of_sunshine PT24H) P1M)';              
update element set id='max(sum(precipitation_amount P1D) P1M)' where    id='max(sum(precipitation_amount PT24H) P1M)';              
update element set id='max(surface_air_pressure P1D)' where     id='max(surface_air_pressure PT24H)';               
update element set id='max(timeperiod_weather_type_significance1 P1D)' where     id='max(timeperiod_weather_type_significance1 PT24H)';               
update element set id='max(visibility_in_air_horizontal P1D)' where     id='max(visibility_in_air_horizontal PT24H)';               
update element set id='max(wind_speed P1D)' where     id='max(wind_speed PT24H)';               
update element set id='max(wind_speed_of_gust P1D)' where     id='max(wind_speed_of_gust PT24H)';               
update element set id='mean(air_pressure_at_sea_level P1D)' where     id='mean(air_pressure_at_sea_level PT24H)';               
update element set id='mean(air_temperature P1D)' where     id='mean(air_temperature PT24H)';               
update element set id='mean(cloud_area_fraction P1D)' where     id='mean(cloud_area_fraction PT24H)';               
update element set id='mean(dew_point_temperature P1D)' where     id='mean(dew_point_temperature PT24H)';               
update element set id='mean(max(air_temperature P1D) P1M)' where    id='mean(max(air_temperature PT24H) P1M)';                  
update element set id='mean(min(air_temperature P1D) P1M)' where    id='mean(min(air_temperature PT24H) P1M)';              
update element set id='mean(relative_humidity P1D)' where     id='mean(relative_humidity PT24H)';               
update element set id='mean(sea_surface_wave_period_from_instrument P1D)' where     id='mean(sea_surface_wave_period_from_instrument PT24H)';               
update element set id='mean(sea_surface_wave_significant_height_from_instrument P1D)' where     id='mean(sea_surface_wave_significant_height_from_instrument PT24H)';  
update element set id='mean(surface_air_pressure P1D)' where     id='mean(surface_air_pressure PT24H)';               
update element set id='mean(wind_speed P1D)' where     id='mean(wind_speed PT24H)';               
update element set id='mean(wind_speed_of_gust P1D)' where     id='mean(wind_speed_of_gust PT24H)';               
update element set id='mean_k(air_temperature P1D)' where     id='mean_k(air_temperature PT24H)';               
update element set id='min(air_pressure_at_sea_level P1D)' where     id='min(air_pressure_at_sea_level PT24H)';               
update element set id='min(air_temperature P1D)' where     id='min(air_temperature PT24H)';               
update element set id='min(cloud_area_fraction P1D)' where     id='min(cloud_area_fraction PT24H)';               
update element set id='min(grass_temperature P1D)' where     id='min(grass_temperature PT24H)';               
update element set id='min(max(wind_speed PT1H) P1D)' where    id='min(max(wind_speed PT1H) PT24H)';              
update element set id='min(max(wind_speed P1D) P1M)' where    id='min(max(wind_speed PT24H) P1M)';              
update element set id='min(relative_humidity P1D)' where     id='min(relative_humidity PT24H)';               
update element set id='min(sea_state P1D)' where     id='min(sea_state PT24H)';               
update element set id='min(sea_surface_wave_period_from_instrument P1D)' where     id='min(sea_surface_wave_period_from_instrument PT24H)';               
update element set id='min(sea_surface_wave_significant_height_from_instrument P1D)' where     id='min(sea_surface_wave_significant_height_from_instrument PT24H)';               
update element set id='min(sum(duration_of_sunshine P1D) P1M)' where    id='min(sum(duration_of_sunshine PT24H) P1M)';              
update element set id='min(surface_air_pressure P1D)' where     id='min(surface_air_pressure PT24H)';               
update element set id='min(visibility_in_air_horizontal P1D)' where     id='min(visibility_in_air_horizontal PT24H)';               
update element set id='min(wind_speed P1D)' where     id='min(wind_speed PT24H)';               
update element set id='min(wind_speed_of_gust P1D)' where     id='min(wind_speed_of_gust PT24H)';               
update element set id='number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)' where   id='number_of_days_gte(sum(precipitation_amount PT24H) P1M 0.1)';             
update element set id='sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)' where    id='sum(boolean_overcast_weather(cloud_area_fraction PT24H) P1M)';              
update element set id='sum(duration_of_sunshine P1D)' where     id='sum(duration_of_sunshine PT24H)';               
update element set id='sum(precipitation_amount P1D)' where     id='sum(precipitation_amount PT24H)';               
update element set id='sum(water_evaporation_amount P1D)' where     id='sum(water_evaporation_amount PT24H)';               
update element set id='sum_over_undefined_period(precipitation_amount P1D)' where     id='sum_over_undefined_period(precipitation_amount PT24H)';               
update element set id='time_of_event_of_max(max(wind_speed P1D) P1M)' where    id='time_of_event_of_max(max(wind_speed PT24H) P1M)';              
update element set id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)' where    id='time_of_event_of_max(sum(precipitation_amount PT24H) P1M)';                          
            
--element_name
update element_name set element_id='best_estimate_mean(air_temperature P1D)' where     element_id='best_estimate_mean(air_temperature PT24H)';             
update element_name set element_id='boolean_overcast_weather(cloud_area_fraction P1D)' where     element_id='boolean_overcast_weather(cloud_area_fraction PT24H)';        
update element_name set element_id='change_over_time(surface_snow_amount P1D)' where     element_id='change_over_time(surface_snow_amount PT24H)';               
update element_name set element_id='change_over_time(surface_snow_thickness P1D)' where     element_id='change_over_time(surface_snow_thickness PT24H)';             
update element_name set element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)' where   element_id='integral_of_deficit(mean(air_temperature PT1H) PT24H 5.0)';             
update element_name set element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)' where   element_id='integral_of_deficit(mean(air_temperature PT24H) P1M 5.0)';             
update element_name set element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)' where   element_id='integral_of_excess_interpolated(mean(air_temperature PT24H) P1M P17.0)';             
update element_name set element_id='max(air_pressure_at_sea_level P1D)' where     element_id='max(air_pressure_at_sea_level PT24H)';               
update element_name set element_id='max(air_temperature P1D)' where     element_id='max(air_temperature PT24H)';              
update element_name set element_id='max(cloud_area_fraction P1D)' where     element_id='max(cloud_area_fraction PT24H)';               
update element_name set element_id='max(relative_humidity P1D)' where     element_id='max(relative_humidity PT24H)';               
update element_name set element_id='max(sea_state P1D)' where     element_id='max(sea_state PT24H)';               
update element_name set element_id='max(sea_surface_wave_period_from_instrument P1D)' where     element_id='max(sea_surface_wave_period_from_instrument PT24H)';               
update element_name set element_id='max(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='max(sea_surface_wave_significant_height_from_instrument PT24H)';               
update element_name set element_id='max(sum(duration_of_sunshine P1D) P1M)' where    element_id='max(sum(duration_of_sunshine PT24H) P1M)';              
update element_name set element_id='max(sum(precipitation_amount P1D) P1M)' where    element_id='max(sum(precipitation_amount PT24H) P1M)';              
update element_name set element_id='max(surface_air_pressure P1D)' where     element_id='max(surface_air_pressure PT24H)';               
update element_name set element_id='max(timeperiod_weather_type_significance1 P1D)' where     element_id='max(timeperiod_weather_type_significance1 PT24H)';               
update element_name set element_id='max(visibility_in_air_horizontal P1D)' where     element_id='max(visibility_in_air_horizontal PT24H)';               
update element_name set element_id='max(wind_speed P1D)' where     element_id='max(wind_speed PT24H)';               
update element_name set element_id='max(wind_speed_of_gust P1D)' where     element_id='max(wind_speed_of_gust PT24H)';               
update element_name set element_id='mean(air_pressure_at_sea_level P1D)' where     element_id='mean(air_pressure_at_sea_level PT24H)';               
update element_name set element_id='mean(air_temperature P1D)' where     element_id='mean(air_temperature PT24H)';               
update element_name set element_id='mean(cloud_area_fraction P1D)' where     element_id='mean(cloud_area_fraction PT24H)';               
update element_name set element_id='mean(dew_point_temperature P1D)' where     element_id='mean(dew_point_temperature PT24H)';               
update element_name set element_id='mean(max(air_temperature P1D) P1M)' where    element_id='mean(max(air_temperature PT24H) P1M)';                  
update element_name set element_id='mean(min(air_temperature P1D) P1M)' where    element_id='mean(min(air_temperature PT24H) P1M)';              
update element_name set element_id='mean(relative_humidity P1D)' where     element_id='mean(relative_humidity PT24H)';               
update element_name set element_id='mean(sea_surface_wave_period_from_instrument P1D)' where     element_id='mean(sea_surface_wave_period_from_instrument PT24H)';               
update element_name set element_id='mean(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='mean(sea_surface_wave_significant_height_from_instrument PT24H)';  
update element_name set element_id='mean(surface_air_pressure P1D)' where     element_id='mean(surface_air_pressure PT24H)';               
update element_name set element_id='mean(wind_speed P1D)' where     element_id='mean(wind_speed PT24H)';               
update element_name set element_id='mean(wind_speed_of_gust P1D)' where     element_id='mean(wind_speed_of_gust PT24H)';               
update element_name set element_id='mean_k(air_temperature P1D)' where     element_id='mean_k(air_temperature PT24H)';               
update element_name set element_id='min(air_pressure_at_sea_level P1D)' where     element_id='min(air_pressure_at_sea_level PT24H)';               
update element_name set element_id='min(air_temperature P1D)' where     element_id='min(air_temperature PT24H)';               
update element_name set element_id='min(cloud_area_fraction P1D)' where     element_id='min(cloud_area_fraction PT24H)';               
update element_name set element_id='min(grass_temperature P1D)' where     element_id='min(grass_temperature PT24H)';               
update element_name set element_id='min(max(wind_speed PT1H) P1D)' where    element_id='min(max(wind_speed PT1H) PT24H)';              
update element_name set element_id='min(max(wind_speed P1D) P1M)' where    element_id='min(max(wind_speed PT24H) P1M)';              
update element_name set element_id='min(relative_humidity P1D)' where     element_id='min(relative_humidity PT24H)';               
update element_name set element_id='min(sea_state P1D)' where     element_id='min(sea_state PT24H)';               
update element_name set element_id='min(sea_surface_wave_period_from_instrument P1D)' where     element_id='min(sea_surface_wave_period_from_instrument PT24H)';               
update element_name set element_id='min(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='min(sea_surface_wave_significant_height_from_instrument PT24H)';               
update element_name set element_id='min(sum(duration_of_sunshine P1D) P1M)' where    element_id='min(sum(duration_of_sunshine PT24H) P1M)';              
update element_name set element_id='min(surface_air_pressure P1D)' where     element_id='min(surface_air_pressure PT24H)';               
update element_name set element_id='min(visibility_in_air_horizontal P1D)' where     element_id='min(visibility_in_air_horizontal PT24H)';               
update element_name set element_id='min(wind_speed P1D)' where     element_id='min(wind_speed PT24H)';               
update element_name set element_id='min(wind_speed_of_gust P1D)' where     element_id='min(wind_speed_of_gust PT24H)';               
update element_name set element_id='number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)' where   element_id='number_of_days_gte(sum(precipitation_amount PT24H) P1M 0.1)';             
update element_name set element_id='sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)' where    element_id='sum(boolean_overcast_weather(cloud_area_fraction PT24H) P1M)';              
update element_name set element_id='sum(duration_of_sunshine P1D)' where     element_id='sum(duration_of_sunshine PT24H)';               
update element_name set element_id='sum(precipitation_amount P1D)' where     element_id='sum(precipitation_amount PT24H)';               
update element_name set element_id='sum(water_evaporation_amount P1D)' where     element_id='sum(water_evaporation_amount PT24H)';               
update element_name set element_id='sum_over_undefined_period(precipitation_amount P1D)' where     element_id='sum_over_undefined_period(precipitation_amount PT24H)';               
update element_name set element_id='time_of_event_of_max(max(wind_speed P1D) P1M)' where    element_id='time_of_event_of_max(max(wind_speed PT24H) P1M)';              
update element_name set element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)' where    element_id='time_of_event_of_max(sum(precipitation_amount PT24H) P1M)';                  
            
--description
update element_description set element_id='best_estimate_mean(air_temperature P1D)' where     element_id='best_estimate_mean(air_temperature PT24H)';             
update element_description set element_id='boolean_overcast_weather(cloud_area_fraction P1D)' where     element_id='boolean_overcast_weather(cloud_area_fraction PT24H)';        
update element_description set element_id='change_over_time(surface_snow_amount P1D)' where     element_id='change_over_time(surface_snow_amount PT24H)';               
update element_description set element_id='change_over_time(surface_snow_thickness P1D)' where     element_id='change_over_time(surface_snow_thickness PT24H)';             
update element_description set element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)' where   element_id='integral_of_deficit(mean(air_temperature PT1H) PT24H 5.0)';             
update element_description set element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)' where   element_id='integral_of_deficit(mean(air_temperature PT24H) P1M 5.0)';             
update element_description set element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)' where   element_id='integral_of_excess_interpolated(mean(air_temperature PT24H) P1M P17.0)';             
update element_description set element_id='max(air_pressure_at_sea_level P1D)' where     element_id='max(air_pressure_at_sea_level PT24H)';               
update element_description set element_id='max(air_temperature P1D)' where     element_id='max(air_temperature PT24H)';              
update element_description set element_id='max(cloud_area_fraction P1D)' where     element_id='max(cloud_area_fraction PT24H)';               
update element_description set element_id='max(relative_humidity P1D)' where     element_id='max(relative_humidity PT24H)';               
update element_description set element_id='max(sea_state P1D)' where     element_id='max(sea_state PT24H)';               
update element_description set element_id='max(sea_surface_wave_period_from_instrument P1D)' where     element_id='max(sea_surface_wave_period_from_instrument PT24H)';               
update element_description set element_id='max(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='max(sea_surface_wave_significant_height_from_instrument PT24H)';               
update element_description set element_id='max(sum(duration_of_sunshine P1D) P1M)' where    element_id='max(sum(duration_of_sunshine PT24H) P1M)';              
update element_description set element_id='max(sum(precipitation_amount P1D) P1M)' where    element_id='max(sum(precipitation_amount PT24H) P1M)';              
update element_description set element_id='max(surface_air_pressure P1D)' where     element_id='max(surface_air_pressure PT24H)';               
update element_description set element_id='max(timeperiod_weather_type_significance1 P1D)' where     element_id='max(timeperiod_weather_type_significance1 PT24H)';               
update element_description set element_id='max(visibility_in_air_horizontal P1D)' where     element_id='max(visibility_in_air_horizontal PT24H)';               
update element_description set element_id='max(wind_speed P1D)' where     element_id='max(wind_speed PT24H)';               
update element_description set element_id='max(wind_speed_of_gust P1D)' where     element_id='max(wind_speed_of_gust PT24H)';               
update element_description set element_id='mean(air_pressure_at_sea_level P1D)' where     element_id='mean(air_pressure_at_sea_level PT24H)';               
update element_description set element_id='mean(air_temperature P1D)' where     element_id='mean(air_temperature PT24H)';               
update element_description set element_id='mean(cloud_area_fraction P1D)' where     element_id='mean(cloud_area_fraction PT24H)';               
update element_description set element_id='mean(dew_point_temperature P1D)' where     element_id='mean(dew_point_temperature PT24H)';               
update element_description set element_id='mean(max(air_temperature P1D) P1M)' where    element_id='mean(max(air_temperature PT24H) P1M)';                  
update element_description set element_id='mean(min(air_temperature P1D) P1M)' where    element_id='mean(min(air_temperature PT24H) P1M)';              
update element_description set element_id='mean(relative_humidity P1D)' where     element_id='mean(relative_humidity PT24H)';               
update element_description set element_id='mean(sea_surface_wave_period_from_instrument P1D)' where     element_id='mean(sea_surface_wave_period_from_instrument PT24H)';               
update element_description set element_id='mean(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='mean(sea_surface_wave_significant_height_from_instrument PT24H)';  
update element_description set element_id='mean(surface_air_pressure P1D)' where     element_id='mean(surface_air_pressure PT24H)';               
update element_description set element_id='mean(wind_speed P1D)' where     element_id='mean(wind_speed PT24H)';               
update element_description set element_id='mean(wind_speed_of_gust P1D)' where     element_id='mean(wind_speed_of_gust PT24H)';               
update element_description set element_id='mean_k(air_temperature P1D)' where     element_id='mean_k(air_temperature PT24H)';               
update element_description set element_id='min(air_pressure_at_sea_level P1D)' where     element_id='min(air_pressure_at_sea_level PT24H)';               
update element_description set element_id='min(air_temperature P1D)' where     element_id='min(air_temperature PT24H)';               
update element_description set element_id='min(cloud_area_fraction P1D)' where     element_id='min(cloud_area_fraction PT24H)';               
update element_description set element_id='min(grass_temperature P1D)' where     element_id='min(grass_temperature PT24H)';               
update element_description set element_id='min(max(wind_speed PT1H) P1D)' where    element_id='min(max(wind_speed PT1H) PT24H)';              
update element_description set element_id='min(max(wind_speed P1D) P1M)' where    element_id='min(max(wind_speed PT24H) P1M)';              
update element_description set element_id='min(relative_humidity P1D)' where     element_id='min(relative_humidity PT24H)';               
update element_description set element_id='min(sea_state P1D)' where     element_id='min(sea_state PT24H)';               
update element_description set element_id='min(sea_surface_wave_period_from_instrument P1D)' where     element_id='min(sea_surface_wave_period_from_instrument PT24H)';               
update element_description set element_id='min(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='min(sea_surface_wave_significant_height_from_instrument PT24H)';               
update element_description set element_id='min(sum(duration_of_sunshine P1D) P1M)' where    element_id='min(sum(duration_of_sunshine PT24H) P1M)';              
update element_description set element_id='min(surface_air_pressure P1D)' where     element_id='min(surface_air_pressure PT24H)';               
update element_description set element_id='min(visibility_in_air_horizontal P1D)' where     element_id='min(visibility_in_air_horizontal PT24H)';               
update element_description set element_id='min(wind_speed P1D)' where     element_id='min(wind_speed PT24H)';               
update element_description set element_id='min(wind_speed_of_gust P1D)' where     element_id='min(wind_speed_of_gust PT24H)';               
update element_description set element_id='number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)' where   element_id='number_of_days_gte(sum(precipitation_amount PT24H) P1M 0.1)';             
update element_description set element_id='sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)' where    element_id='sum(boolean_overcast_weather(cloud_area_fraction PT24H) P1M)';              
update element_description set element_id='sum(duration_of_sunshine P1D)' where     element_id='sum(duration_of_sunshine PT24H)';               
update element_description set element_id='sum(precipitation_amount P1D)' where     element_id='sum(precipitation_amount PT24H)';               
update element_description set element_id='sum(water_evaporation_amount P1D)' where     element_id='sum(water_evaporation_amount PT24H)';               
update element_description set element_id='sum_over_undefined_period(precipitation_amount P1D)' where     element_id='sum_over_undefined_period(precipitation_amount PT24H)';               
update element_description set element_id='time_of_event_of_max(max(wind_speed P1D) P1M)' where    element_id='time_of_event_of_max(max(wind_speed PT24H) P1M)';              
update element_description set element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)' where    element_id='time_of_event_of_max(sum(precipitation_amount PT24H) P1M)';                  

--codetable
update element_codetable set element_id='max(sea_state P1D)' where     element_id='max(sea_state PT24H)'; 
update element_codetable set element_id='min(sea_state P1D)' where     element_id='min(sea_state PT24H)';   
            
--category, status and metnoelement did not exist when the error was introduced

--kdvh_element
update kdvh_element set element_id='best_estimate_mean(air_temperature P1D)' where     element_id='best_estimate_mean(air_temperature PT24H)';             
update kdvh_element set element_id='boolean_overcast_weather(cloud_area_fraction P1D)' where     element_id='boolean_overcast_weather(cloud_area_fraction PT24H)';        
update kdvh_element set element_id='change_over_time(surface_snow_amount P1D)' where     element_id='change_over_time(surface_snow_amount PT24H)';               
update kdvh_element set element_id='change_over_time(surface_snow_thickness P1D)' where     element_id='change_over_time(surface_snow_thickness PT24H)';             
update kdvh_element set element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)' where   element_id='integral_of_deficit(mean(air_temperature PT1H) PT24H 5.0)';             
update kdvh_element set element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)' where   element_id='integral_of_deficit(mean(air_temperature PT24H) P1M 5.0)';             
update kdvh_element set element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)' where   element_id='integral_of_excess_interpolated(mean(air_temperature PT24H) P1M P17.0)';             
update kdvh_element set element_id='max(air_pressure_at_sea_level P1D)' where     element_id='max(air_pressure_at_sea_level PT24H)';               
update kdvh_element set element_id='max(air_temperature P1D)' where     element_id='max(air_temperature PT24H)';              
update kdvh_element set element_id='max(cloud_area_fraction P1D)' where     element_id='max(cloud_area_fraction PT24H)';               
update kdvh_element set element_id='max(relative_humidity P1D)' where     element_id='max(relative_humidity PT24H)';               
update kdvh_element set element_id='max(sea_state P1D)' where     element_id='max(sea_state PT24H)';               
update kdvh_element set element_id='max(sea_surface_wave_period_from_instrument P1D)' where     element_id='max(sea_surface_wave_period_from_instrument PT24H)';               
update kdvh_element set element_id='max(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='max(sea_surface_wave_significant_height_from_instrument PT24H)';               
update kdvh_element set element_id='max(sum(duration_of_sunshine P1D) P1M)' where    element_id='max(sum(duration_of_sunshine PT24H) P1M)';              
update kdvh_element set element_id='max(sum(precipitation_amount P1D) P1M)' where    element_id='max(sum(precipitation_amount PT24H) P1M)';              
update kdvh_element set element_id='max(surface_air_pressure P1D)' where     element_id='max(surface_air_pressure PT24H)';               
update kdvh_element set element_id='max(timeperiod_weather_type_significance1 P1D)' where     element_id='max(timeperiod_weather_type_significance1 PT24H)';               
update kdvh_element set element_id='max(visibility_in_air_horizontal P1D)' where     element_id='max(visibility_in_air_horizontal PT24H)';               
update kdvh_element set element_id='max(wind_speed P1D)' where     element_id='max(wind_speed PT24H)';               
update kdvh_element set element_id='max(wind_speed_of_gust P1D)' where     element_id='max(wind_speed_of_gust PT24H)';               
update kdvh_element set element_id='mean(air_pressure_at_sea_level P1D)' where     element_id='mean(air_pressure_at_sea_level PT24H)';               
update kdvh_element set element_id='mean(air_temperature P1D)' where     element_id='mean(air_temperature PT24H)';               
update kdvh_element set element_id='mean(cloud_area_fraction P1D)' where     element_id='mean(cloud_area_fraction PT24H)';               
update kdvh_element set element_id='mean(dew_point_temperature P1D)' where     element_id='mean(dew_point_temperature PT24H)';               
update kdvh_element set element_id='mean(max(air_temperature P1D) P1M)' where    element_id='mean(max(air_temperature PT24H) P1M)';                  
update kdvh_element set element_id='mean(min(air_temperature P1D) P1M)' where    element_id='mean(min(air_temperature PT24H) P1M)';              
update kdvh_element set element_id='mean(relative_humidity P1D)' where     element_id='mean(relative_humidity PT24H)';               
update kdvh_element set element_id='mean(sea_surface_wave_period_from_instrument P1D)' where     element_id='mean(sea_surface_wave_period_from_instrument PT24H)';               
update kdvh_element set element_id='mean(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='mean(sea_surface_wave_significant_height_from_instrument PT24H)';  
update kdvh_element set element_id='mean(surface_air_pressure P1D)' where     element_id='mean(surface_air_pressure PT24H)';               
update kdvh_element set element_id='mean(wind_speed P1D)' where     element_id='mean(wind_speed PT24H)';               
update kdvh_element set element_id='mean(wind_speed_of_gust P1D)' where     element_id='mean(wind_speed_of_gust PT24H)';               
update kdvh_element set element_id='mean_k(air_temperature P1D)' where     element_id='mean_k(air_temperature PT24H)';               
update kdvh_element set element_id='min(air_pressure_at_sea_level P1D)' where     element_id='min(air_pressure_at_sea_level PT24H)';               
update kdvh_element set element_id='min(air_temperature P1D)' where     element_id='min(air_temperature PT24H)';               
update kdvh_element set element_id='min(cloud_area_fraction P1D)' where     element_id='min(cloud_area_fraction PT24H)';               
update kdvh_element set element_id='min(grass_temperature P1D)' where     element_id='min(grass_temperature PT24H)';               
update kdvh_element set element_id='min(max(wind_speed PT1H) P1D)' where    element_id='min(max(wind_speed PT1H) PT24H)';              
update kdvh_element set element_id='min(max(wind_speed P1D) P1M)' where    element_id='min(max(wind_speed PT24H) P1M)';              
update kdvh_element set element_id='min(relative_humidity P1D)' where     element_id='min(relative_humidity PT24H)';               
update kdvh_element set element_id='min(sea_state P1D)' where     element_id='min(sea_state PT24H)';               
update kdvh_element set element_id='min(sea_surface_wave_period_from_instrument P1D)' where     element_id='min(sea_surface_wave_period_from_instrument PT24H)';               
update kdvh_element set element_id='min(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='min(sea_surface_wave_significant_height_from_instrument PT24H)';               
update kdvh_element set element_id='min(sum(duration_of_sunshine P1D) P1M)' where    element_id='min(sum(duration_of_sunshine PT24H) P1M)';              
update kdvh_element set element_id='min(surface_air_pressure P1D)' where     element_id='min(surface_air_pressure PT24H)';               
update kdvh_element set element_id='min(visibility_in_air_horizontal P1D)' where     element_id='min(visibility_in_air_horizontal PT24H)';               
update kdvh_element set element_id='min(wind_speed P1D)' where     element_id='min(wind_speed PT24H)';               
update kdvh_element set element_id='min(wind_speed_of_gust P1D)' where     element_id='min(wind_speed_of_gust PT24H)';               
update kdvh_element set element_id='number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)' where   element_id='number_of_days_gte(sum(precipitation_amount PT24H) P1M 0.1)';             
update kdvh_element set element_id='sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)' where    element_id='sum(boolean_overcast_weather(cloud_area_fraction PT24H) P1M)';              
update kdvh_element set element_id='sum(duration_of_sunshine P1D)' where     element_id='sum(duration_of_sunshine PT24H)';               
update kdvh_element set element_id='sum(precipitation_amount P1D)' where     element_id='sum(precipitation_amount PT24H)';               
update kdvh_element set element_id='sum(water_evaporation_amount P1D)' where     element_id='sum(water_evaporation_amount PT24H)';               
update kdvh_element set element_id='sum_over_undefined_period(precipitation_amount P1D)' where     element_id='sum_over_undefined_period(precipitation_amount PT24H)';               
update kdvh_element set element_id='time_of_event_of_max(max(wind_speed P1D) P1M)' where    element_id='time_of_event_of_max(max(wind_speed PT24H) P1M)';              
update kdvh_element set element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)' where    element_id='time_of_event_of_max(sum(precipitation_amount PT24H) P1M)';                  

--cfelement
update cf_element set element_id='best_estimate_mean(air_temperature P1D)' where     element_id='best_estimate_mean(air_temperature PT24H)';             
update cf_element set element_id='boolean_overcast_weather(cloud_area_fraction P1D)' where     element_id='boolean_overcast_weather(cloud_area_fraction PT24H)';        
update cf_element set element_id='change_over_time(surface_snow_amount P1D)' where     element_id='change_over_time(surface_snow_amount PT24H)';               
update cf_element set element_id='change_over_time(surface_snow_thickness P1D)' where     element_id='change_over_time(surface_snow_thickness PT24H)';             
update cf_element set element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)' where   element_id='integral_of_deficit(mean(air_temperature PT1H) PT24H 5.0)';             
update cf_element set element_id='integral_of_deficit(mean(air_temperature P1D) P1M 5.0)' where   element_id='integral_of_deficit(mean(air_temperature PT24H) P1M 5.0)';             
update cf_element set element_id='integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)' where   element_id='integral_of_excess_interpolated(mean(air_temperature PT24H) P1M P17.0)';             
update cf_element set element_id='max(air_pressure_at_sea_level P1D)' where     element_id='max(air_pressure_at_sea_level PT24H)';               
update cf_element set element_id='max(air_temperature P1D)' where     element_id='max(air_temperature PT24H)';              
update cf_element set element_id='max(cloud_area_fraction P1D)' where     element_id='max(cloud_area_fraction PT24H)';               
update cf_element set element_id='max(relative_humidity P1D)' where     element_id='max(relative_humidity PT24H)';               
update cf_element set element_id='max(sea_state P1D)' where     element_id='max(sea_state PT24H)';               
update cf_element set element_id='max(sea_surface_wave_period_from_instrument P1D)' where     element_id='max(sea_surface_wave_period_from_instrument PT24H)';               
update cf_element set element_id='max(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='max(sea_surface_wave_significant_height_from_instrument PT24H)';               
update cf_element set element_id='max(sum(duration_of_sunshine P1D) P1M)' where    element_id='max(sum(duration_of_sunshine PT24H) P1M)';              
update cf_element set element_id='max(sum(precipitation_amount P1D) P1M)' where    element_id='max(sum(precipitation_amount PT24H) P1M)';              
update cf_element set element_id='max(surface_air_pressure P1D)' where     element_id='max(surface_air_pressure PT24H)';               
update cf_element set element_id='max(timeperiod_weather_type_significance1 P1D)' where     element_id='max(timeperiod_weather_type_significance1 PT24H)';               
update cf_element set element_id='max(visibility_in_air_horizontal P1D)' where     element_id='max(visibility_in_air_horizontal PT24H)';               
update cf_element set element_id='max(wind_speed P1D)' where     element_id='max(wind_speed PT24H)';               
update cf_element set element_id='max(wind_speed_of_gust P1D)' where     element_id='max(wind_speed_of_gust PT24H)';               
update cf_element set element_id='mean(air_pressure_at_sea_level P1D)' where     element_id='mean(air_pressure_at_sea_level PT24H)';               
update cf_element set element_id='mean(air_temperature P1D)' where     element_id='mean(air_temperature PT24H)';               
update cf_element set element_id='mean(cloud_area_fraction P1D)' where     element_id='mean(cloud_area_fraction PT24H)';               
update cf_element set element_id='mean(dew_point_temperature P1D)' where     element_id='mean(dew_point_temperature PT24H)';               
update cf_element set element_id='mean(max(air_temperature P1D) P1M)' where    element_id='mean(max(air_temperature PT24H) P1M)';                  
update cf_element set element_id='mean(min(air_temperature P1D) P1M)' where    element_id='mean(min(air_temperature PT24H) P1M)';              
update cf_element set element_id='mean(relative_humidity P1D)' where     element_id='mean(relative_humidity PT24H)';               
update cf_element set element_id='mean(sea_surface_wave_period_from_instrument P1D)' where     element_id='mean(sea_surface_wave_period_from_instrument PT24H)';               
update cf_element set element_id='mean(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='mean(sea_surface_wave_significant_height_from_instrument PT24H)';  
update cf_element set element_id='mean(surface_air_pressure P1D)' where     element_id='mean(surface_air_pressure PT24H)';               
update cf_element set element_id='mean(wind_speed P1D)' where     element_id='mean(wind_speed PT24H)';               
update cf_element set element_id='mean(wind_speed_of_gust P1D)' where     element_id='mean(wind_speed_of_gust PT24H)';               
update cf_element set element_id='mean_k(air_temperature P1D)' where     element_id='mean_k(air_temperature PT24H)';               
update cf_element set element_id='min(air_pressure_at_sea_level P1D)' where     element_id='min(air_pressure_at_sea_level PT24H)';               
update cf_element set element_id='min(air_temperature P1D)' where     element_id='min(air_temperature PT24H)';               
update cf_element set element_id='min(cloud_area_fraction P1D)' where     element_id='min(cloud_area_fraction PT24H)';               
update cf_element set element_id='min(grass_temperature P1D)' where     element_id='min(grass_temperature PT24H)';               
update cf_element set element_id='min(max(wind_speed PT1H) P1D)' where    element_id='min(max(wind_speed PT1H) PT24H)';              
update cf_element set element_id='min(max(wind_speed P1D) P1M)' where    element_id='min(max(wind_speed PT24H) P1M)';              
update cf_element set element_id='min(relative_humidity P1D)' where     element_id='min(relative_humidity PT24H)';               
update cf_element set element_id='min(sea_state P1D)' where     element_id='min(sea_state PT24H)';               
update cf_element set element_id='min(sea_surface_wave_period_from_instrument P1D)' where     element_id='min(sea_surface_wave_period_from_instrument PT24H)';               
update cf_element set element_id='min(sea_surface_wave_significant_height_from_instrument P1D)' where     element_id='min(sea_surface_wave_significant_height_from_instrument PT24H)';               
update cf_element set element_id='min(sum(duration_of_sunshine P1D) P1M)' where    element_id='min(sum(duration_of_sunshine PT24H) P1M)';              
update cf_element set element_id='min(surface_air_pressure P1D)' where     element_id='min(surface_air_pressure PT24H)';               
update cf_element set element_id='min(visibility_in_air_horizontal P1D)' where     element_id='min(visibility_in_air_horizontal PT24H)';               
update cf_element set element_id='min(wind_speed P1D)' where     element_id='min(wind_speed PT24H)';               
update cf_element set element_id='min(wind_speed_of_gust P1D)' where     element_id='min(wind_speed_of_gust PT24H)';               
update cf_element set element_id='number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)' where   element_id='number_of_days_gte(sum(precipitation_amount PT24H) P1M 0.1)';             
update cf_element set element_id='sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)' where    element_id='sum(boolean_overcast_weather(cloud_area_fraction PT24H) P1M)';              
update cf_element set element_id='sum(duration_of_sunshine P1D)' where     element_id='sum(duration_of_sunshine PT24H)';               
update cf_element set element_id='sum(precipitation_amount P1D)' where     element_id='sum(precipitation_amount PT24H)';               
update cf_element set element_id='sum(water_evaporation_amount P1D)' where     element_id='sum(water_evaporation_amount PT24H)';               
update cf_element set element_id='sum_over_undefined_period(precipitation_amount P1D)' where     element_id='sum_over_undefined_period(precipitation_amount PT24H)';               
update cf_element set element_id='time_of_event_of_max(max(wind_speed P1D) P1M)' where    element_id='time_of_event_of_max(max(wind_speed PT24H) P1M)';              
update cf_element set element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)' where    element_id='time_of_event_of_max(sum(precipitation_amount PT24H) P1M)';               


# --- !Downs
