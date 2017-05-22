# --- !Ups

CREATE TABLE element_status (
  element_id TEXT NOT NULL,
  status_id TEXT NOT NULL
);
insert into element_status (element_id, status_id) values ('specific_humidity', 'CF-name');
insert into element_status (element_id, status_id) values ('cloud_area_fraction2', 'MET-name');
insert into element_status (element_id, status_id) values ('weather_type_automatic', 'MET-name');
insert into element_status (element_id, status_id) values ('wind_speed_of_gust', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_period_at_variance_spectral_density_maximum', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction(sea_surface_swell_wave_second_mean_height PT3H)', 'MET-name');
insert into element_status (element_id, status_id) values ('from_direction(sea_surface_swell_wave_first_mean_height PT10M)', 'MET-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_secondary_significance_intensity P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('from_direction_of_peak(sea_surface_secondary_wave PT10M)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(wind_speed PT3H)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(sea_surface_wind_wave_from_direction_of_spectral_peak_period PT20M)', 'MET-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_primary_significance PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('sum(water_evaporation_amount P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(sea_surface_temperature PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(max(wind_speed PT1H) P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(relative_humidity P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(sea_surface_wave_significant_height_from_instrument P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(snow_coverage_type P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(wind_speed_of_gust P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(max(wind_speed P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(duration_of_sunshine P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(visibility_in_air_horizontal P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(wind_speed_of_gust P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(specific_humidity P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('volume_fraction_of_water_in_soil', 'MET-name');
insert into element_status (element_id, status_id) values ('min(cloud_base_height PT1H)', 'MET-name');
insert into element_status (element_id, status_id) values ('best_estimate_mean(air_temperature P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_quaternary_significance PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('precipitation_type_tertiary_significance', 'MET-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_primary_significance P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_steepness_of_steepest_wave', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(cloud_area_fraction P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('directional_spread(sea_surface_peak_period PT20M)', 'MET-name');
insert into element_status (element_id, status_id) values ('surface_downwelling_photosynthetic_radiative_flux_in_air', 'CF-name');
insert into element_status (element_id, status_id) values ('integral_of_deficit(mean(air_temperature PT1H) P1D 5.0)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(wind_speed_of_gust PT20M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(snow_temperature PT1H)', 'CF-alias');
insert into element_status (element_id, status_id) values ('cloud_area_fraction3', 'MET-name');
insert into element_status (element_id, status_id) values ('cloud_base_height1', 'MET-name');
insert into element_status (element_id, status_id) values ('cloud_base_height4', 'MET-name');
insert into element_status (element_id, status_id) values ('surface_downwelling_shortwave_flux_in_air', 'CF-name');
insert into element_status (element_id, status_id) values ('surface_upwelling_shortwave_flux_in_air', 'CF-name');
insert into element_status (element_id, status_id) values ('latitude', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_period_of_maximum_height', 'MET-name');
insert into element_status (element_id, status_id) values ('longitude', 'CF-name');
insert into element_status (element_id, status_id) values ('air_pressure_at_sea_level', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_peak(sea_surface_wave_total_energy PT10M)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(sea_surface_swell_wave_from_direction_of_spectral_peak_period PT20M)', 'MET-name');
insert into element_status (element_id, status_id) values ('from_direction(sea_surface_swell_wave_first_mean_height PT3H)', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_period', 'MET-name');
insert into element_status (element_id, status_id) values ('boolean_clear_sky_weather(cloud_area_fraction P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(soil_temperature PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(air_temperature PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(air_temperature PT12H)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(visibility_in_air_horizontal P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_mean_steepness', 'MET-name');
insert into element_status (element_id, status_id) values ('relative_humidity', 'CF-name');
insert into element_status (element_id, status_id) values ('max(beaufort_wind_force PT6H)', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_state', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_significant_height_from_instrument', 'MET-name');
insert into element_status (element_id, status_id) values ('change_over_time(surface_air_pressure PT6H)', 'CF-name');
insert into element_status (element_id, status_id) values ('boolean_fair_weather(cloud_area_fraction P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(surface_air_pressure P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(sea_state P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('integral_of_deficit(mean(air_temperature PT1H) P1D 0.0)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(relative_humidity P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(surface_air_pressure P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(min(air_temperature P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(snow_coverage_type P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean_k(air_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(min(grass_temperature P1D) P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(relative_humidity PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(relative_humidity PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_primary_significance_intensity P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('change_over_time(surface_air_pressure PT3H)', 'CF-name');
insert into element_status (element_id, status_id) values ('low_type_cloud_area_fraction', 'CF-name');
insert into element_status (element_id, status_id) values ('precipitation_amount', 'CF-name');
insert into element_status (element_id, status_id) values ('max(relative_humidity P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(sea_surface_temperature PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(dew_point_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(surface_air_pressure P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(water_vapor_partial_pressure_in_air P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_max(wind_speed PT3H)', 'CF-name');
insert into element_status (element_id, status_id) values ('surface_net_downward_radiative_flux', 'CF-name');
insert into element_status (element_id, status_id) values ('min(grass_temperature P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(surface_snow_thickness P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(sea_surface_wave_period_from_instrument P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(snow_temperature PT1H)', 'CF-alias');
insert into element_status (element_id, status_id) values ('max(wind_speed_of_gust PT10M)', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_mean(sea_surface_secondary_wave PT10M)', 'MET-name');
insert into element_status (element_id, status_id) values ('dew_point_temperature', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_steepness_of_highest_wave', 'MET-name');
insert into element_status (element_id, status_id) values ('max(grass_temperature PT1H)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(sea_surface_wave_period_from_instrument P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(min(grass_temperature P1D) P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(air_pressure_at_sea_level P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(duration_of_sunshine PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(air_temperature_anomaly P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('time_of_event_of_max(air_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(duration_of_sunshine PT1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_peak(sea_surface_primary_wave PT20M)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(sea_surface_wave_period PT20M) ', 'MET-name');
insert into element_status (element_id, status_id) values ('high_type_cloud', 'MET-name');
insert into element_status (element_id, status_id) values ('min(air_temperature P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('low_type_cloud', 'MET-name');
insert into element_status (element_id, status_id) values ('grass_temperature', 'MET-name');
insert into element_status (element_id, status_id) values ('mean_k(air_temperature P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(wind_speed P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('change_over_time(surface_snow_amount P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(wind_speed_of_gust P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(min(grass_temperature P1D) P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(wind_speed P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(air_pressure_at_sea_level P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(cloud_area_fraction P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(sea_state P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(wind_speed_of_gust P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(sea_surface_wave_significant_height_from_instrument P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(air_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(cloud_area_fraction P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum_over_undefined_period(precipitation_amount P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(sea_surface_temperature PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('best_estimate_mean(air_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(weather_type_secondary_significance PT3H)', 'MET-name');
insert into element_status (element_id, status_id) values ('visibility_in_air_horizontal', 'MET-name');
insert into element_status (element_id, status_id) values ('sum(boolean_clear_sky_weather(cloud_area_fraction P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount PT12H)', 'CF-name');
insert into element_status (element_id, status_id) values ('cloud_area_fraction1', 'MET-name');
insert into element_status (element_id, status_id) values ('cloud_area_fraction4', 'MET-name');
insert into element_status (element_id, status_id) values ('surface_air_pressure', 'CF-name');
insert into element_status (element_id, status_id) values ('directional_spread(sea_surface_wave_total_energy PT20M)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(sea_surface_wave_height PT20M)', 'MET-name');
insert into element_status (element_id, status_id) values ('surface_snow_thickness', 'CF-name');
insert into element_status (element_id, status_id) values ('max(surface_snow_thickness PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_max(wind_speed PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_tertiary_significance_intensity P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('wind_from_direction_of_gust', 'MET-name');
insert into element_status (element_id, status_id) values ('min(air_temperature PT10M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('change_over_time(surface_snow_thickness P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(wind_speed P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(sea_surface_wave_period_from_instrument P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(max(wind_speed PT1H) P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(air_pressure_at_sea_level P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(sea_surface_wave_period_from_instrument P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(sea_surface_wave_significant_height_from_instrument P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(sea_state P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(sea_surface_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(sum(precipitation_amount P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(max(wind_speed P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(surface_snow_thickness P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(grass_temperature PT1H)', 'MET-name');
insert into element_status (element_id, status_id) values ('diffuse_downwelling_shortwave_flux_in_air', 'CF-name');
insert into element_status (element_id, status_id) values ('min(grass_temperature PT1H)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(surface_air_pressure PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_secondary_significance P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('best_estimate_sum(precipitation_amount_anomaly P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(wind_speed P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('integral_of_excess(mean(air_temperature PT1H) P1D 17.0)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(visibility_in_air_horizontal P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(air_pressure_at_sea_level P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_tertiary_significance P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(surface_upwelling_longwave_flux_in_air PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(surface_downwelling_shortwave_flux_in_air PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_water_speed', 'CF-name');
insert into element_status (element_id, status_id) values ('cloud_base_height3', 'MET-name');
insert into element_status (element_id, status_id) values ('cloud_base_height2', 'MET-name');
insert into element_status (element_id, status_id) values ('surface_downwelling_longwave_flux_in_air', 'CF-name');
insert into element_status (element_id, status_id) values ('wind_speed', 'CF-name');
insert into element_status (element_id, status_id) values ('surface_temperature', 'CF-name');
insert into element_status (element_id, status_id) values ('wind_from_direction', 'CF-name');
insert into element_status (element_id, status_id) values ('estimated_by_spectral_moments_1(sea_surface_wave_zero_upcrossing_period PT10M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_period_from_instrument', 'MET-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount PT6H)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(wind_speed_of_gust P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(max(wind_speed PT1H) P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(air_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(air_temperature PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(water_evaporation_amount PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('medium_type_cloud', 'MET-name');
insert into element_status (element_id, status_id) values ('max(wind_speed PT6H)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(weather_type_primary_significance PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount PT3H)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(weather_type_additional1 PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('beaufort_wind_force', 'CF-name');
insert into element_status (element_id, status_id) values ('max(air_temperature P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(weather_type_additional2 PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(wind_speed_of_gust P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(air_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(air_temperature P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(cloud_area_fraction P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(cloud_area_fraction P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(sum(duration_of_sunshine P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(air_pressure_at_sea_level P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('integral_of_deficit(mean(air_temperature P1D) P1M 5.0)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(sea_surface_wave_from_direction_of_spectral_peak_period PT20M)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(relative_humidity P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_mean(sea_surface_wave_total_energy PT20M)', 'MET-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount PT1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('surface_upwelling_longwave_flux_in_air', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_significant_height_from_spectrum', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_temperature', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_height', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_swell_wave_first_mean_period', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_swell_wave_first_mean_height', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_swell_wave_second_mean_period', 'MET-name');
insert into element_status (element_id, status_id) values ('from_direction_of_mean(sea_surface_wave_total_energy PT10M)', 'MET-name');
insert into element_status (element_id, status_id) values ('liquid_water_content_of_surface_snow', 'CF-name');
insert into element_status (element_id, status_id) values ('qnh_air_pressure', 'MET-name');
insert into element_status (element_id, status_id) values ('max(air_pressure_at_sea_level P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount_anomaly P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('surface_albedo', 'CF-name');
insert into element_status (element_id, status_id) values ('best_estimate_mean(air_temperature_anomaly P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('integral_of_excess_interpolated(mean(air_temperature P1D) P1M 17.0)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(wind_speed PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_max(wind_speed_of_gust PT10M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_wave_spectrum_peak_energy', 'MET-name');
insert into element_status (element_id, status_id) values ('precipitation_type_primary_significance', 'MET-name');
insert into element_status (element_id, status_id) values ('sum_over_undefined_period(precipitation_amount PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(duration_of_sunshine P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('precipitation_type_secondary_significance', 'MET-name');
insert into element_status (element_id, status_id) values ('min(grass_temperature PT12H)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(air_temperature PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(wind_speed P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(relative_humidity P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(sea_surface_wave_period_from_instrument P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('time_of_event_of_max(wind_speed_of_gust PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(surface_snow_thickness PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_max(wind_speed_of_gust PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(relative_humidity PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(weather_type_primary_significance PT3H)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(dew_point_temperature P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(sea_surface_wave_period_from_instrument P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(cloud_area_fraction P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('time_of_event_of_max(max(wind_speed P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount PT30D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(sea_surface_wave_significant_height_from_instrument P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(surface_air_pressure PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_steepest_height', 'MET-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount PT10M)', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_peak(sea_surface_primary_wave)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(sea_surface_wave_height PT10M)', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_zero_upcrossing_period', 'CF-name');
insert into element_status (element_id, status_id) values ('max(wind_speed PT10M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_period_at_variance_spectral_density_second_maximum', 'MET-name');
insert into element_status (element_id, status_id) values ('max(wind_speed_of_gust PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(wind_from_direction PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('cloud_area_fraction', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_water_to_direction', 'MET-name');
insert into element_status (element_id, status_id) values ('max(wind_speed PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('instant_weather_type_from_instrument', 'MET-name');
insert into element_status (element_id, status_id) values ('snow_coverage_type', 'MET-name');
insert into element_status (element_id, status_id) values ('state_of_ground', 'MET-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(sum(duration_of_sunshine P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(wind_speed P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(relative_humidity P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(surface_snow_thickness P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(max(wind_speed P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(surface_air_pressure P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(surface_air_pressure PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('boolean_overcast_weather(cloud_area_fraction P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(surface_snow_thickness PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_swell_wave_second_mean_height', 'MET-name');
insert into element_status (element_id, status_id) values ('best_estimate_sum(precipitation_amount P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(sea_surface_wave_significant_height_from_instrument P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('integral_of_excess(mean(air_temperature P1D) P1M 17.0)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(visibility_in_air_horizontal P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(water_vapor_partial_pressure_in_air P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(sea_surface_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('integral_of_deficit(mean(air_temperature P1D) P1M 0.0)', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_mean(sea_surface_primary_wave PT20M) ', 'MET-name');
insert into element_status (element_id, status_id) values ('max(sea_state P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('snow_temperature', 'CF-alias');
insert into element_status (element_id, status_id) values ('min(snow_temperature PT1H)', 'CF-alias');
insert into element_status (element_id, status_id) values ('soil_temperature', 'CF-name');
insert into element_status (element_id, status_id) values ('air_temperature', 'CF-name');
insert into element_status (element_id, status_id) values ('from_direction_of_mean(sea_surface_primary_wave PT10M)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(air_temperature PT10M)', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_height_above_lowest_astronomical_tide', 'MET-name');
insert into element_status (element_id, status_id) values ('max(wind_speed PT20M)', 'CF-name');
insert into element_status (element_id, status_id) values ('timeperiod_weather_type_from_instrument', 'MET-name');
insert into element_status (element_id, status_id) values ('weather_type', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_mean_height', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_primary_wave_spectral_density', 'MET-name');
insert into element_status (element_id, status_id) values ('sea_surface_swell_wave_significant_height', 'CF-name');
insert into element_status (element_id, status_id) values ('cloud_base_height', 'MET-name');
insert into element_status (element_id, status_id) values ('sum(precipitation_amount P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(max(air_temperature P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('min(surface_air_pressure P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(sea_surface_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('time_of_event_of_max(sum(precipitation_amount P1D) P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('time_of_event_of_min(air_temperature P1M)', 'CF-name');
insert into element_status (element_id, status_id) values ('time_of_event_of_max(wind_speed PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('change_over_time(surface_air_pressure PT1H)', 'CF-name');
insert into element_status (element_id, status_id) values ('max(air_temperature PT12H)', 'CF-name');
insert into element_status (element_id, status_id) values ('sea_surface_wave_significant_height', 'CF-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_tertiary_significance PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('over_time(precipitation_type_secondary_significance PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('max(surface_air_pressure P1D)', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(sea_surface_wave_significant_height_from_instrument P1M)', 'MET-name');
insert into element_status (element_id, status_id) values ('over_time(weather_type_secondary_significance PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('over_time(weather_type_additional3 PT6H)', 'MET-name');
insert into element_status (element_id, status_id) values ('min(snow_coverage_type P1M)', 'MET-name');

-------------insert into the status description table

CREATE TABLE status (
  id TEXT NOT NULL,
  status TEXT NOT NULL,
  status_locale LOCALE NOT NULL
);

Insert into status
   (id, status, status_locale)
 Values
   ('MET-test','MET Norway - under contruction','en-US');
Insert into status
   (id, status, status_locale)
 Values
   ('CF-name', 'CF convention standard name.','en-US');
Insert into status
   (id, status, status_locale)
 Values
   ('Proposal' ,' Name in review as CF standard.','en-US');
Insert into status
   (id, status, status_locale)
 Values
   ('MET-name', 'MET Norway local standard','en-US');
Insert into status
   (id, status, status_locale)
 Values
   ('CF-alias','Alias for a standard name in the CF convention.','en-US');

Insert into status
   (id, status, status_locale)
 Values
   ('MET-test','Navnet er under arbeid på Meteorologisk institutt.','nn-NO');
Insert into status
   (id, status, status_locale)
 Values
   ('CF-name', 'Standard navn i CF konvensjonen.','nn-NO');
Insert into status
   (id, status, status_locale)
 Values
   ('Proposal' ,' Navnet er under behandling i CF konvensjonens panel.','nn-NO');
Insert into status
   (id, status, status_locale)
 Values
   ('MET-name', 'Meteorologisk institutts standard navn.','nn-NO');
Insert into status
   (id, status, status_locale)
 Values
   ('CF-alias','Alias for et standard navn i CF konvensjonen.','nn-NO');
   
 Insert into status
    (id, status, status_locale)
  Values
    ('MET-test','Navnet er under arbeid på Meteorologisk institutt.','nb-NO');
 Insert into status
    (id, status, status_locale)
  Values
    ('CF-name', 'Standard navn i CF konvensjonen.','nb-NO');
 Insert into status
    (id, status, status_locale)
  Values
    ('Proposal' ,' Navnet er under behandling i CF konvensjonens panel.','nb-NO');
 Insert into status
    (id, status, status_locale)
  Values
    ('MET-name', 'Meteorologisk institutts standard navn.','nb-NO');
 Insert into status
    (id, status, status_locale)
  Values
   ('CF-alias','Alias for et standard navn i CF konvensjonen.','nb-NO');


# --- !Downs
