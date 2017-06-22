# --- !Ups


UPDATE element SET id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)' WHERE id='max(surface_downwelling_shortwave_flux_in_air PT1H)';
UPDATE element_name SET element_id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)' WHERE element_id='max(surface_downwelling_shortwave_flux_in_air PT1H)';
UPDATE element_description SET element_id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)' WHERE element_id='max(surface_downwelling_shortwave_flux_in_air PT1H)';
UPDATE element_codetable SET element_id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)' WHERE element_id='max(surface_downwelling_shortwave_flux_in_air PT1H)';
UPDATE cf_element SET element_id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)' WHERE element_id='max(surface_downwelling_shortwave_flux_in_air PT1H)';
UPDATE kdvh_element SET element_id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)' WHERE element_id='max(surface_downwelling_shortwave_flux_in_air PT1H)';
UPDATE element_status SET element_id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)' WHERE element_id='max(surface_downwelling_shortwave_flux_in_air PT1H)';
UPDATE element_category SET element_id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)' WHERE element_id='max(surface_downwelling_shortwave_flux_in_air PT1H)';


insert into element (id, unit) values ('accumulated(precipitation_amount)','mm');
insert into element (id, unit) values ('humidity_mixing_ratio','gr/kg');
insert into element (id, unit) values ('mean(humidity_mixing_ratio P1M)','gr/kg');

insert into element_name (element_id, name, name_locale) values ('accumulated(precipitation_amount)','Total nedbør','nb-NO');
insert into element_name (element_id, name, name_locale) values ('accumulated(precipitation_amount)','Total nedbør','nn-NO');
insert into element_name (element_id, name, name_locale) values ('accumulated(precipitation_amount)','Total precipitation','en-US');
insert into element_name (element_id, name, name_locale) values ('humidity_mixing_ratio','Blandingsforhold (mixing ratio)','nb-NO');
insert into element_name (element_id, name, name_locale) values ('humidity_mixing_ratio','Blandingsforhold (mixing ratio)','nn-NO');
insert into element_name (element_id, name, name_locale) values ('humidity_mixing_ratio','Mixing ratio','en-US');
insert into element_name (element_id, name, name_locale) values ('mean(humidity_mixing_ratio P1M)','Mean mixing ratio','en-US');
insert into element_name (element_id, name, name_locale) values ('mean(humidity_mixing_ratio P1M)','Midlere blandingsforhold (mixing ratio)','nb-NO');
insert into element_name (element_id, name, name_locale) values ('mean(humidity_mixing_ratio P1M)','Midlere blandingsforhold (mixing ratio)','nn-NO');

insert into element_description (element_id, description, description_locale) values ('accumulated(precipitation_amount)','Automatic station: Total precipitation in container (accumulated since last emptying)','en-US');
insert into element_description (element_id, description, description_locale) values ('accumulated(precipitation_amount)','Automatstasjon: Total nedbørmengd i bøtta (samlemengd sidan sist tømming)','nn-NO');
insert into element_description (element_id, description, description_locale) values ('accumulated(precipitation_amount)','Automatstasjon: Total nedbørmengde i bøtta (samlemengde siden sist tømming)','nb-NO');
insert into element_description (element_id, description, description_locale) values ('humidity_mixing_ratio','Density of vapour related to density of dry air','en-US');
insert into element_description (element_id, description, description_locale) values ('humidity_mixing_ratio','Forholdet mellom tettleiken til vanndampen og til den tørre lufta','nn-NO');
insert into element_description (element_id, description, description_locale) values ('humidity_mixing_ratio','Forholdet mellom vanndampens og den tørre luftens tetthet','nb-NO');
insert into element_description (element_id, description, description_locale) values ('mean(humidity_mixing_ratio P1M)','Mean (over month) of density of vapour related to density of dry air','en-US');
insert into element_description (element_id, description, description_locale) values ('mean(humidity_mixing_ratio P1M)','Middel (over månad) av forholdet mellom tettleiken til vanndampen og til den tørre lufta','nn-NO');
insert into element_description (element_id, description, description_locale) values ('mean(humidity_mixing_ratio P1M)','Middel (over måned) av forholdet mellom vanndampens og den tørre luftens tetthet','nb-NO');

insert into element_category (element_id, category, category_locale) values ('accumulated(precipitation_amount)','Nedbør','nb-NO');
insert into element_category (element_id, category, category_locale) values ('accumulated(precipitation_amount)','Nedbør','nn-NO');
insert into element_category (element_id, category, category_locale) values ('accumulated(precipitation_amount)','Precipitation','en-US');
insert into element_category (element_id, category, category_locale) values ('humidity_mixing_ratio','Fukt (råme)','nn-NO');
insert into element_category (element_id, category, category_locale) values ('humidity_mixing_ratio','Fuktighet','nb-NO');
insert into element_category (element_id, category, category_locale) values ('humidity_mixing_ratio','Humidity','en-US');
insert into element_category (element_id, category, category_locale) values ('mean(humidity_mixing_ratio P1M)','Fukt (råme)','nn-NO');
insert into element_category (element_id, category, category_locale) values ('mean(humidity_mixing_ratio P1M)','Fuktighet','nb-NO');
insert into element_category (element_id, category, category_locale) values ('mean(humidity_mixing_ratio P1M)','Humidity','en-US');

insert into element_status (element_id, status_id) values ('accumulated(precipitation_amount)', 'CF-name');
insert into element_status (element_id, status_id) values ('humidity_mixing_ratio', 'CF-name');
insert into element_status (element_id, status_id) values ('mean(humidity_mixing_ratio P1M)', 'CF-name');

insert into kdvh_element (element_id, elem_code,param_id,unit) values ('accumulated(precipitation_amount)','RA','104','mm');
insert into kdvh_element (element_id, elem_code,param_id,unit) values ('humidity_mixing_ratio','MR',NULL,'gr/kg');
insert into kdvh_element (element_id, elem_code,param_id,unit) values ('mean(humidity_mixing_ratio P1M)','MRM',NULL,'gr/kg');

--lauvsprett
insert into element (id, unit) values ('day_of_year_for_birch_leafing','1');

insert into element_name (element_id, name, name_locale) values ('day_of_year_for_birch_leafing','Dagnummer for løvsprett','nb-NO');
insert into element_name (element_id, name, name_locale) values ('day_of_year_for_birch_leafing','Dagnummer for lauvsprett','nn-NO');
insert into element_name (element_id, name, name_locale) values ('day_of_year_for_birch_leafing','Day of year for birch leafing','en-US');

insert into element_description (element_id, description, description_locale) values ('day_of_year_for_birch_leafing','The day of the birch leafing is reported by using the BBCH-scale to identify the phenological development stage of the plant.','en-US');
insert into element_description (element_id, description, description_locale) values ('day_of_year_for_birch_leafing','Dagen for lauvsprett er funnen ved å bruke BBCH-skalaen, som er ein fenologisk skala for utviklingsstega til ei plante.','nn-NO');
insert into element_description (element_id, description, description_locale) values ('day_of_year_for_birch_leafing','Dagen for løvprett er funnet ved å bruke BBCH-skalaen, som er en fenologisk skala som er en fenologisk skala for planters utviklingssteg.','nb-NO');

insert into element_category (element_id, category, category_locale) values ('day_of_year_for_birch_leafing','Frekvens','nn-NO');
insert into element_category (element_id, category, category_locale) values ('day_of_year_for_birch_leafing','Frekvens','nb-NO');
insert into element_category (element_id, category, category_locale) values ('day_of_year_for_birch_leafing','Frequency','en-US');

insert into element_status (element_id, status_id) values ('day_of_year_for_birch_leafing', 'MET-name');

insert into kdvh_element (element_id, elem_code,unit) values ('day_of_year_for_birch_leafing','DAGNUMMER','1');

insert into metno_element (element_id, metno_name) values ('day_of_year_for_birch_leafing', 'day_of_year_for_birch_leafing');

update calculation_method set description='Accumulated from 0, which means the sum over an unknown period.' where method_id='accumulated' and description_locale='en-US';


Update calculation_method set description='Best estimimate sum values are homogenized sum values. This means a high quality dataset of sums with no kind of breaks in the timeseries.' where method_id='best_estimate_sum' and description_locale='en-US';
Update calculation_method set description='Best estimimate mean values are homogenized mean values. This means a high quality dataset of mean values with no kind of breaks in the timeseries.' where method_id='best_estimate_mean' and description_locale='en-US';
Update calculation_method set description='Count of days with a measurement exceeding a given threshold.' where method_id='number_of_days_gte' and description_locale='en-US';
Update calculation_method set description='Accumulated deviation below a threshold over time. Temperature deficit is defined as the sum over days, of temperature threshold minus the daily mean air temperatures, taking only into account the temperatures below the threshold. This metric is often named after a specification and "degree-days", e.g. heating degree-days.' where method_id='integral_of_deficit' and description_locale='en-US';
Update calculation_method set description='Accumulated deviation above a threshold over time. Temperature excess is defined as the sum over days, of the daily mean air temperatures minus the temperature threshold, taking only into account the temperatures above the threshold. This metric is often named after a specification and "degree-days", e.g. growing degree-days.' where method_id='integral_of_excess' and description_locale='en-US';
Update calculation_method set description='The time difference of a variable. E.g. P1D is the difference between one day and the previous day.' where method_id='change_over_time' and description_locale='en-US';
Update calculation_method set description='Weather symbol is a number corresponding to the visualization of the weather as an icon. Weather symbol is derived from a combination of cloud cover (colud_area_fraction) and type of weather (weather_type).' where method_id='weather_symbol' and description_locale='en-US';
Update calculation_method set description='A method to describe the observation of what has happened since last observation, often used for type of weather.' where method_id='over_time' and description_locale='en-US';
Update calculation_method set description='Indicates the direction of the flow. The vector "from_direction" is used in the construction X_from_direction and indicates where the velocity vector of X is coming from.' where method_id='from_direction' and description_locale='en-US';
Update calculation_method set description='Accumulated value since last observation, over undefined time periods greater than or equal (gte) the given time period. E.g. precipitation amounts from observations at irregular intervals.' where method_id='sum_over_undefined_period' and description_locale='en-US';
Update calculation_method set description='A measure of completeness of the observations over a given period in percent' where method_id='percent_coverage' and description_locale='en-US';
Update calculation_method set description='Minimum value observed or calculated in the given period' where method_id='min' and description_locale='en-US';
Update calculation_method set description='Maximum value observed or calculated in the given period' where method_id='max' and description_locale='en-US';
Update calculation_method set description='Standard arithmetic mean value for the given period' where method_id='mean' and description_locale='en-US';
Update calculation_method set description='Mean value calculated with the Køppen formula.' where method_id='mean_k' and description_locale='en-US';
Update calculation_method set description='Accumulated deviation below a threshold over time. Interpolated temperature deficit is defined as the temperature threshold minus geographically interpolated air temperatures, taking only into account the temperatures below the threshold. This metric is often named after a specification and "degree-days", e.g. heating degree-days"' where method_id='integral_of_deficit_interpolated' and description_locale='en-US';
Update calculation_method set description='The arithmetic sum of data values or accumulated value in a given period.' where method_id='sum' and description_locale='en-US';
Update calculation_method set description='The time or date for the maximum value of the given element in the given period.' where method_id='time_of_event_of_max' and description_locale='en-US';
Update calculation_method set description='The time or date for the minimum value of the given element in the given period.' where method_id='time_of_event_of_min' and description_locale='en-US';
Update calculation_method set description='Indicates the direction of the flow. The vector "from_direction" is used in the construction X_from_direction and indicates the direction from which the velocity vector of X (here the mean value) is coming.' where method_id='from_direction_of_mean' and description_locale='en-US';
Update calculation_method set description='Indicates the direction of the flow. The vector "from_direction" is used in the construction X_from_direction and indicates the direction from which the velocity vector of X (here the peak value) is coming.' where method_id='from_direction_of_peak' and description_locale='en-US';
Update calculation_method set description='Indicates the direction of the flow. The vector "from_direction" is used in the construction X_from_direction and indicates the direction from which the velocity vector of X (here the max value) is coming.' where method_id='from_direction_of_max' and description_locale='en-US';
Update calculation_method set description='Estimate of the average period of individual waves using moments using m0/m1' where method_id='estimated_by_spectral_moments_1' and description_locale='en-US';
Update calculation_method set description='Directional spread (standard deviation).' where method_id='directional_spread' and description_locale='en-US';
Update calculation_method set description='The sum of the cloud cover observations at 06 and 12 UTC where no single values above 4, (and at 18 utc is 9 or lower?). The sum should be below 9 (max 24 if all overcast), then it is fair weather and boolean is true, that means 1, else 0 (false).' where method_id='boolean_fair_weather' and description_locale='en-US';
Update calculation_method set description='The sum of the cloud cover observations at 06, 12 and 18 UTC. The sum should be below 4 (max 24 if all overcast), then it is clear sky weather and boolean is true, that means 1, else 0 (false).' where method_id='boolean_clear_sky_weather' and description_locale='en-US';
Update calculation_method set description='The sum of the cloud cover observations at 06, 12 and 18 UTC. The sum should be 20 or more (max 24 if all overcast), then it is overcast weather and boolean is true, that means 1, else 0 (false).' where method_id='boolean_overcast_weather' and description_locale='en-US';

Update calculation_method set description='Summen av verdiar i ein periode, det vil seie den akkumulerte verdien.' where method_id='sum' and description_locale='nn-NO';

update element_description set description='Lågaste registrerte temperatur i perioden.' where element_id in ('min(air_temperature PT10M)', 'min(air_temperature P1D)', 'min(air_temperature PT1H)') and description_locale='nn-NO';

update element_description set description='Laveste registrerte temperatur i perioden.' where element_id in ('min(air_temperature PT10M)', 'min(air_temperature P1D)', 'min(air_temperature PT1H)') and description_locale='nb-NO';

update element_description set description='Lowest observed temperature in the given period.' where element_id in ('min(air_temperature PT10M)', 'min(air_temperature P1D)', 'min(air_temperature PT1H)') and description_locale='en-US';

update element_description set description='Jordtemperatur i gitt djupn (standard er 10 cm), middel av dei 60 minuttverdiane siste time' where element_id = 'mean(soil_temperature PT1H)' and description_locale='nn-NO';

update element_description set description='Midlere jordtemperatur i angitt dybde (standard er 10 cm), middel av siste times 60 minuttverdier' where element_id = 'mean(soil_temperature PT1H)' and description_locale='nb-NO';

update element_description set description='Soil temperature at given depth (default 10 cm), mean of 60 minute-values from the last hour' where element_id ='mean(soil_temperature PT1H)' and description_locale='en-US';

update element_description set description='Jordtemperatur ved gitt djupn (standard  er 10 cm), nåverdi' where element_id = 'soil_temperature' and description_locale='nn-NO';

update element_description set description='Jordtemperatur i angitt dybde (standard er 10 cm), nåverdi' where element_id = 'soil_temperature' and description_locale='nb-NO';

update element_description set description='Soil temperature at given depth (default 10 cm), now value' where element_id ='soil_temperature' and description_locale='en-US';

update element_description set description='Værsymbol er et tall som korresponderer til visualiseringen av været som et ikon. Værsymbolet er avledet av kombinasjonen av skydekke (cloud_area_fraction) og værtypen (weather_type).' where element_id = 'weather_symbol(instant_weather_type cloud_area_fraction PT6H)' and description_locale='nb-NO';

update element_description set description='Vêrsymbol er eit tal som korresponderer til visualiseringa av vêret som eit ikon. Vêrsymbolet er leidd ut av kombinasjonen av skydekke (cloud_area_fraction) og vêrtypen (weather_type).' where element_id = 'weather_symbol(instant_weather_type cloud_area_fraction PT6H)' and description_locale='nn-NO';

update element_description set description='Weather symbol is a number corresponding to the visualization of the weather as an icon. Weather symbol is derived from a combination of cloud cover (cloud_area_fraction) and type of weather (weather_type).' where element_id = 'weather_symbol(instant_weather_type cloud_area_fraction PT6H)' and description_locale='en-US';

delete from calculation_method where method_id='weather_symbol';

UPDATE element SET id='over_time(weather_cloud_symbol PT6H)' WHERE id='weather_symbol(instant_weather_type cloud_area_fraction PT6H)';
UPDATE element_name SET element_id='over_time(weather_cloud_symbol PT6H)' WHERE element_id='weather_symbol(instant_weather_type cloud_area_fraction PT6H)';
UPDATE element_description SET element_id='over_time(weather_cloud_symbol PT6H)' WHERE element_id='weather_symbol(instant_weather_type cloud_area_fraction PT6H)';
UPDATE element_codetable SET element_id='over_time(weather_cloud_symbol PT6H)' WHERE element_id='weather_symbol(instant_weather_type cloud_area_fraction PT6H)';
UPDATE cf_element SET element_id='over_time(weather_cloud_symbol PT6H)' WHERE element_id='weather_symbol(instant_weather_type cloud_area_fraction PT6H)';
UPDATE kdvh_element SET element_id='over_time(weather_cloud_symbol PT6H)' WHERE element_id='weather_symbol(instant_weather_type cloud_area_fraction PT6H)';

UPDATE element_status SET element_id='over_time(weather_cloud_symbol PT6H)' WHERE element_id='weather_symbol(instant_weather_type cloud_area_fraction PT6H)';
UPDATE element_category SET element_id='over_time(weather_cloud_symbol PT6H)' WHERE element_id='weather_symbol(instant_weather_type cloud_area_fraction PT6H)';

delete from metno_element where element_id='weather_symbol(instant_weather_type cloud_area_fraction PT6H)';

insert into metno_element(element_id, metno_name) values ('over_time(weather_cloud_symbol PT6H)', 'weather_cloud_symbol'); 

insert into cf_element (element_id, standard_name, unit, status) values ('integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)','air_temperature','K','37');
insert into cf_element (element_id, standard_name, unit, status) values ('integral_of_deficit(mean(air_temperature P1D) P6M 17.0)','air_temperature','K','37');
insert into cf_element (element_id, standard_name, unit, status) values ('integral_of_deficit(mean(air_temperature P1D) P3M 17.0)','air_temperature','K','37');
insert into cf_element (element_id, standard_name, unit, status) values ('integral_of_excess(mean(air_temperature P1D) P1M 0.0)','air_temperature','K','37');
insert into cf_element (element_id, standard_name, unit, status) values ('integral_of_deficit(mean(air_temperature P1D) P1M 17.0)','air_temperature','K','37');
insert into cf_element (element_id, standard_name, unit, status) values ('integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)','air_temperature','K','37');
insert into cf_element (element_id, standard_name, unit, status) values ('integral_of_excess(mean(air_temperature PT1H) P1D 0.0)','air_temperature','K','37');
insert into cf_element (element_id, standard_name, unit, status) values ('sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)','cloud_area_fraction','1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('sum(boolean_clear_sky_weather(cloud_area_fraction P1D) P1M)','cloud_area_fraction','1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('boolean_fair_weather(cloud_area_fraction P1D)','cloud_area_fraction','1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('boolean_clear_sky_weather(cloud_area_fraction P1D)','cloud_area_fraction','1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('sum(duration_of_sunshine PT1M)','duration_of_sunshine','s','37');
insert into cf_element (element_id, standard_name, unit, status) values ('humidity_mixing_ratio','humidity_mixing_ratio','1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('humidity_mixing_ratio','humidity_mixing_ratio','1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('mean(humidity_mixing_ratio P1M)','humidity_mixing_ratio','1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('sum(precipitation_amount PT30D)','precipitation_amount','kg m-2','37');
insert into cf_element (element_id, standard_name, unit, status) values ('accumulated(precipitation_amount)','precipitation_amount','kg m-2','37');
insert into cf_element (element_id, standard_name, unit, status) values ('accumulated(precipitation_amount)','precipitation_amount','kg m-2','37');
insert into cf_element (element_id, standard_name, unit, status) values ('min(relative_humidity PT1H)','relative_humidity','1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('max(relative_humidity PT1H)','relative_humidity','1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('max(surface_upwelling_longwave_flux_in_air PT1H)','surface_upwelling_longwave_flux_in_air','W m-2','37');
insert into cf_element (element_id, standard_name, unit, status) values ('max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)','surface_downwelling_shortwave_flux_in_air','W m-2','37');
insert into cf_element (element_id, standard_name, unit, status) values ('mean(water_vapor_partial_pressure_in_air P1M)','water_vapor_partial_pressure_in_air','Pa','37');
insert into cf_element (element_id, standard_name, unit, status) values ('mean(water_vapor_partial_pressure_in_air P1D)','water_vapor_partial_pressure_in_air','Pa','37');
insert into cf_element (element_id, standard_name, unit, status) values ('mean(max(wind_speed P1D) P1M)','wind_speed','m s-1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('max(max(wind_speed P1D) P1M)','wind_speed','m s-1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('mean(max(wind_speed PT1H) P1D)','wind_speed','m s-1','37');
insert into cf_element (element_id, standard_name, unit, status) values ('max(max(wind_speed PT1H) P1D)','wind_speed','m s-1','37');
	
update cf_element set standard_name ='integral_of_air_temperature_deficit_wrt_time' where element_id='integral_of_deficit(mean(air_temperature P1D) P1M 17.0)';
update cf_element set standard_name ='integral_of_air_temperature_deficit_wrt_time' where element_id='integral_of_deficit(mean(air_temperature P1D) P1Y 17.0)';
update cf_element set standard_name ='integral_of_air_temperature_deficit_wrt_time' where element_id='integral_of_deficit(mean(air_temperature P1D) P3M 17.0)';
update cf_element set standard_name ='integral_of_air_temperature_deficit_wrt_time' where element_id='integral_of_deficit(mean(air_temperature P1D) P6M 17.0)';
update cf_element set standard_name ='integral_of_air_temperature_deficit_wrt_time' where element_id='integral_of_deficit(mean(air_temperature PT1H) P1D 17.0)';

update cf_element set standard_name ='integral_of_air_temperature_excess_wrt_time' where element_id='integral_of_excess(mean(air_temperature P1D) P1M 0.0)';
update cf_element set standard_name ='integral_of_air_temperature_excess_wrt_time' where element_id='integral_of_excess(mean(air_temperature P1D) P1M 5.0)';
update cf_element set standard_name ='integral_of_air_temperature_excess_wrt_time' where element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)';
update cf_element set standard_name ='integral_of_air_temperature_excess_wrt_time' where element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)';

delete from cf_element where status='qnh_air_pressure';

UPDATE element SET id='air_pressure_at_sea_level_qnh' WHERE id='qnh_air_pressure';
UPDATE element_name SET element_id='air_pressure_at_sea_level_qnh' WHERE element_id='qnh_air_pressure';
UPDATE element_description SET element_id='air_pressure_at_sea_level_qnh' WHERE element_id='qnh_air_pressure';
UPDATE element_codetable SET element_id='air_pressure_at_sea_level_qnh' WHERE element_id='qnh_air_pressure';
UPDATE cf_element SET element_id='air_pressure_at_sea_level_qnh' WHERE element_id='qnh_air_pressure';
UPDATE kdvh_element SET element_id='air_pressure_at_sea_level_qnh' WHERE element_id='qnh_air_pressure';
UPDATE metno_element SET element_id='air_pressure_at_sea_level_qnh' WHERE element_id='qnh_air_pressure';
UPDATE element_status SET element_id='air_pressure_at_sea_level_qnh' WHERE element_id='qnh_air_pressure';
UPDATE element_category SET element_id='air_pressure_at_sea_level_qnh' WHERE element_id='qnh_air_pressure';

delete from  metno_element where element_id='air_pressure_at_sea_level'; 

Insert into CF_ELEMENT (STANDARD_NAME, UNIT, STATUS, ELEMENT_ID)
 Values ('air_pressure_at_sea_level', 'Pa', '37', 'air_pressure_at_sea_level_qnh');


# --- !Downs
