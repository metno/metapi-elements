# --- !Ups


-- update descriptions which contains fnutts with escape parameter in front
update element_description set description='Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc).Monthly value: Arithmetic mean of daily values.' where element_id='best_estimate_mean(air_temperature P1M)' and description_locale='en-US';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18) Månadsverdi: Aritmetisk middel av verdiar' where element_id='best_estimate_mean(air_temperature P1M)' and description_locale='nn-NO';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18) Månedsverdi: Aritmetisk middel av døgn verdier' where element_id='best_estimate_mean(air_temperature P1M)' and description_locale='nb-NO';
update element_description set description='Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc). Monthly value: Arithmetic mean of daily values.' where element_id='best_estimate_mean(air_temperature P1D)' and description_locale='en-US';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18) Månadsverdi: Aritmetisk middel av døgn verdiar' where element_id='best_estimate_mean(air_temperature P1D)' and description_locale='nn-NO';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18) Månedsverdi: Aritmetisk middel av døgn verdier' where element_id='best_estimate_mean(air_temperature P1D)' and description_locale='nb-NO';
update element_description set description='Daily value: If sum of NN at 6, 12 and 18 utc is 20 or higher, then NN20=1, else 0.Monthly value: Sum of daily NN20s (number of days with overcast).' where element_id='sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)' and description_locale='en-US';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 20 eller høgare, vert NN20=1, elles 0.Månadsverdi: Sum av døgn-NN20 (talet på dagar med overskya vêr).' where element_id='sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)' and description_locale='nn-NO';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 20 eller høyere, blir NN20=1, ellers 0.Månedsverdi: Sum av døgn-NN20 (antall dager med overskyet vær).' where element_id='sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)' and description_locale='nb-NO';
update element_description set description='Peak- retning referert til primærbølge (MIROS)' where element_id='from_direction_of_peak(sea_surface_primary_wave PT20M)' and description_locale='nn-NO';
update element_description set description='Peak- retning referert til primærbølge (MIROS)' where element_id='from_direction_of_peak(sea_surface_primary_wave PT20M)' and description_locale='nb-NO';
update element_description set description='Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc).Monthly value: Arithmetic mean of daily values.' where element_id='mean(air_temperature P1M)' and description_locale='en-US';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18) Månadsverdi: Aritmetisk middel av døgn verdiar' where element_id='mean(air_temperature P1M)' and description_locale='nn-NO';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18) Månedsverdi: Aritmetisk middel av døgn verdier' where element_id='mean(air_temperature P1M)' and description_locale='nb-NO';
update element_description set description='Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc).Monthly value: Arithmetic mean of daily values.' where element_id='mean(air_temperature PT1H)' and description_locale='en-US';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18) Månadsverdi: Aritmetisk middel av døgn verdiar' where element_id='mean(air_temperature PT1H)' and description_locale='nn-NO';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18) Månedsverdi: Aritmetisk middel av døgn verdier' where element_id='mean(air_temperature PT1H)' and description_locale='nb-NO';
update element_description set description='Hourly value: Arithmetic mean of minute values.Daily value: Arithmetic mean of 24 hourly values (00-00 utc), or a formula based mean value computed from fewer observations (18-18 utc). Monthly value: Arithmetic mean of daily values. ' where element_id='mean(air_temperature P1D)' and description_locale='en-US';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdiar døgnverdi: Aritmetisk middel av 24 timeverdiar (kl 00-00), evt formelbasert middelverdi ut frå færre observasjonar (kl 18-18) Månadsverdi: Aritmetisk middel av døgn verdiar' where element_id='mean(air_temperature P1D)' and description_locale='nn-NO';
update element_description set description='Timeverdi: Aritmetisk middel av minuttverdier Døgnverdi: Aritmetisk middel av 24 timeverdier (kl 00-00), evt formelbasert middelverdi ut fra færre observasjoner (kl 18-18) Månedsverdi: Aritmetisk middel av døgn verdier ' where element_id='mean(air_temperature P1D)' and description_locale='nb-NO';
update element_description set description='Kode 1 - 4: 1-3 = parts of the ground covered with snow, 4 = area around station all covered with snow. Code = -1 means no snow, presented as a dot (.)' where element_id='snow_coverage_type' and description_locale='en-US';
update element_description set description='Det vert nytta kodetal 1 - 4:  1 - 3 tydar at delar av marka er snødekt, og 4 at området rundt stasjonen er heilt snødekt.  Kode = -1 tydar "ikkje snø", presenterast som punktum (.)' where element_id='snow_coverage_type' and description_locale='nn-NO';
update element_description set description='Oppgis med kodetall 1 - 4: 1 - 3 betyr at deler av marka er snødekt, og 4 at området rundt stasjonen er helt snødekt. Kode = -1 betyr "ikke snø", presenterast som punktum (.)' where element_id='snow_coverage_type' and description_locale='nb-NO';
update element_description set description='Daily value: If sum of NN at 6, 12 and 18 utc is 20 or higher, then NN20=1, else 0.Monthly value: Sum of daily NN20s (number of days with overcast).' where element_id='boolean_overcast_weather(cloud_area_fraction P1D)' and description_locale='en-US';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 20 eller høgare, vert NN20=1, elles 0.Månadsverdi: Sum av døgn-NN20 (talet på dagar med overskya vêr).' where element_id='boolean_overcast_weather(cloud_area_fraction P1D)' and description_locale='nn-NO';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 20 eller høyere, blir NN20=1, ellers 0.Månedsverdi: Sum av døgn-NN20 (antall dager med overskyet vær).' where element_id='boolean_overcast_weather(cloud_area_fraction P1D)' and description_locale='nb-NO';
update element_description set description='Nedbør frå ikkje-dagleg stasjon. Nedbørmengda vert målt på "tilfeldige" dagar og gjeld frå førre måling' where element_id='sum_over_undefined_period(precipitation_amount P1D)' and description_locale='nn-NO';
update element_description set description='Nedbør fra ikke-daglig stasjon. Nedbørmengden måles på "tilfeldige" dager og gjelder fra forrige måling' where element_id='sum_over_undefined_period(precipitation_amount P1D)' and description_locale='nb-NO';
update element_description set description='Snow depth, total from ground up, normally measured in the morning. Code = -1 means no snow, presented as a dot (.), -3 means not possible to measure' where element_id='surface_snow_thickness' and description_locale='en-US';
update element_description set description='Snødjupn, totalt frå bakken, vert normalt målt på morgonen. Kode = -1 betyr snøbart, presentrast som puntkum (.), -3 tyder ikkje mogleg å måle' where element_id='surface_snow_thickness' and description_locale='nn-NO';
update element_description set description='Snødybde, totalt fra bakken, måles normalt på morgenen. Kode = -1 betyr snøbart, presenteres som punktum (.), -3 betyr umulig å måle' where element_id='surface_snow_thickness' and description_locale='nb-NO';
update element_description set description='Daily value: If sum of NN at 6, 12 and 18 utc is 4 or lower, then NN04=1, else 0.Monthly value: Sum of daily NN04s (number of days with clear sky).' where element_id='boolean_clear_sky_weather(cloud_area_fraction P1D)' and description_locale='en-US';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 4 eller lavere, blir NN04=1, ellers 0.Månedsverdi: Sum av døgn-NN04 (antall dager med klarvær).' where element_id='boolean_clear_sky_weather(cloud_area_fraction P1D)' and description_locale='nb-NO';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 4 eller lågare, vert NN04=1, elles 0.Månadsverdi: Sum av døgn-NN04 (talet på dagar med klårvêr).' where element_id='boolean_clear_sky_weather(cloud_area_fraction P1D)' and description_locale='nn-NO';
update element_description set description='Daily value: If sum of NN at 6, 12 and 18 utc is 9 or lower (and no single NN-value is above 4), then NN09=1, else 0.Monthly value: Sum of daily NN09s (number of days with fair weather).' where element_id='boolean_fair_weather(cloud_area_fraction P1D)' and description_locale='en-US';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 9 eller lavere (og ingen NN er høyere enn 4), blir NN09=1, ellers 0.Månedsverdi: Sum av døgn-NN09 (antall dager med pent vær).' where element_id='boolean_fair_weather(cloud_area_fraction P1D)' and description_locale='nb-NO';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 9 eller lågare (og ingen NN er høgare enn 4), vert NN09=1, elles 0.Månadsverdi: Sum av døgn-NN09 (talet på dagar med pent vêr).' where element_id='boolean_fair_weather(cloud_area_fraction P1D)' and description_locale='nn-NO';
update element_description set description='Daily value: If sum of NN at 6, 12 and 18 utc is 4 or lower, then NN04=1, else 0.Monthly value: Sum of daily NN04s (number of days with clear sky).' where element_id='sum(boolean_clear_sky_weather(cloud_area_fraction P1D) P1M)' and description_locale='en-US';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 4 eller lavere, blir NN04=1, ellers 0.Månedsverdi: Sum av døgn-NN04 (antall dager med klarvær).' where element_id='sum(boolean_clear_sky_weather(cloud_area_fraction P1D) P1M)' and description_locale='nb-NO';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 4 eller lågare, vert NN04=1, elles 0.Månadsverdi: Sum av døgn-NN04 (talet på dagar med klårvêr).' where element_id='sum(boolean_clear_sky_weather(cloud_area_fraction P1D) P1M)' and description_locale='nn-NO';
update element_description set description='Daily value: If sum of NN at 6, 12 and 18 utc is 9 or lower (and no single NN-value is above 4), then NN09=1, else 0.Monthly value: Sum of daily NN09s (number of days with fair weather).' where element_id='sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)' and description_locale='en-US';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 9 eller lavere (og ingen NN er høyere enn 4), blir NN09=1, ellers 0.Månedsverdi: Sum av døgn-NN09 (antall dager med pent vær).' where element_id='sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)' and description_locale='nb-NO';
update element_description set description='Døgnverdi: Dersom summen av NN kl 6, 12 og 18 utc er 9 eller lågare (og ingen NN er høgare enn 4), vert NN09=1, elles 0.Månadsverdi: Sum av døgn-NN09 (talet på dagar med pent vêr).' where element_id='sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)' and description_locale='nn-NO';

UPDATE metno_element SET metno_name='sea_surface_wave_energy_at_variance_spectral_density_maximum' WHERE metno_name='sea_wave_spectrum_peak_energy';

UPDATE element SET id='max_wind_speed(wind_from_direction PT1H)' WHERE id='from_direction_of_max(wind_speed PT1H)';
UPDATE element_name SET element_id='max_wind_speed(wind_from_direction PT1H)' WHERE element_id='from_direction_of_max(wind_speed PT1H)';
UPDATE element_description SET element_id='max_wind_speed(wind_from_direction PT1H)' WHERE element_id='from_direction_of_max(wind_speed PT1H)';
UPDATE element_codetable SET element_id='max_wind_speed(wind_from_direction PT1H)' WHERE element_id='from_direction_of_max(wind_speed PT1H)';
UPDATE cf_element SET element_id='max_wind_speed(wind_from_direction PT1H)' , cell_method='time: maximum (meaning, the corresponding vector to the maximum value of the vector over a time period)', unit='degree', standard_name='wind_from_direction' WHERE element_id='from_direction_of_max(wind_speed PT1H)';
UPDATE kdvh_element SET element_id='max_wind_speed(wind_from_direction PT1H)' WHERE element_id='from_direction_of_max(wind_speed PT1H)';
delete from metno_element WHERE element_id='from_direction_of_max(wind_speed PT1H)';
UPDATE element_status SET element_id='max_wind_speed(wind_from_direction PT1H)', status_id='CF-name' WHERE element_id='from_direction_of_max(wind_speed PT1H)';
UPDATE element_category SET element_id='max_wind_speed(wind_from_direction PT1H)' WHERE element_id='from_direction_of_max(wind_speed PT1H)';
UPDATE element_sensorlevel SET element_id='max_wind_speed(wind_from_direction PT1H)' WHERE element_id='from_direction_of_max(wind_speed PT1H)';

UPDATE element SET id='max_wind_speed(wind_from_direction PT3H)' WHERE id='from_direction_of_max(wind_speed PT3H)';
UPDATE element_name SET element_id='max_wind_speed(wind_from_direction PT3H)' WHERE element_id='from_direction_of_max(wind_speed PT3H)';
UPDATE element_description SET element_id='max_wind_speed(wind_from_direction PT3H)' WHERE element_id='from_direction_of_max(wind_speed PT3H)';
UPDATE element_codetable SET element_id='max_wind_speed(wind_from_direction PT3H)' WHERE element_id='from_direction_of_max(wind_speed PT3H)';
UPDATE cf_element SET element_id='max_wind_speed(wind_from_direction PT3H)', cell_method='time: maximum (meaning, the corresponding vector to the maximum value of the vector over a time period)', unit='degree', standard_name='wind_from_direction'  WHERE element_id='from_direction_of_max(wind_speed PT3H)';
UPDATE kdvh_element SET element_id='max_wind_speed(wind_from_direction PT3H)' WHERE element_id='from_direction_of_max(wind_speed PT3H)';
delete from metno_element WHERE element_id='from_direction_of_max(wind_speed PT3H)';
UPDATE element_status SET element_id='max_wind_speed(wind_from_direction PT3H)', status_id='CF-name' WHERE element_id='from_direction_of_max(wind_speed PT3H)';
UPDATE element_category SET element_id='max_wind_speed(wind_from_direction PT3H)' WHERE element_id='from_direction_of_max(wind_speed PT3H)';
UPDATE element_sensorlevel SET element_id='max_wind_speed(wind_from_direction PT3H)' WHERE element_id='from_direction_of_max(wind_speed PT3H)';

UPDATE element SET id='max_wind_speed(wind_from_direction_of_gust PT1H)' WHERE id='from_direction_of_max(wind_speed_of_gust PT1H)';
UPDATE element_name SET element_id='max_wind_speed(wind_from_direction_of_gust PT1H)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT1H)';
UPDATE element_description SET element_id='max_wind_speed(wind_from_direction_of_gust PT1H)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT1H)';
UPDATE element_codetable SET element_id='max_wind_speed(wind_from_direction_of_gust PT1H)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT1H)';
UPDATE cf_element SET element_id='max_wind_speed(wind_from_direction_of_gust PT1H)', cell_method='time: maximum (meaning, the corresponding vector to the maximum value of the vector over a time period)', unit='degree', standard_name='wind_from_direction_of_gust'  WHERE element_id='from_direction_of_max(wind_speed_of_gust PT1H)';
UPDATE kdvh_element SET element_id='max_wind_speed(wind_from_direction_of_gust PT1H)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT1H)';
delete from metno_element WHERE element_id='from_direction_of_max(wind_speed_of_gust PT1H)';
UPDATE element_status SET element_id='max_wind_speed(wind_from_direction_of_gust PT1H)' , status_id='CF-name' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT1H)';
UPDATE element_category SET element_id='max_wind_speed(wind_from_direction_of_gust PT1H)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT1H)';
UPDATE element_sensorlevel SET element_id='max_wind_speed(wind_from_direction_of_gust PT1H)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT1H)';

UPDATE element SET id='max_wind_speed(wind_from_direction_of_gust PT10M)' WHERE id='from_direction_of_max(wind_speed_of_gust PT10M)';
UPDATE element_name SET element_id='max_wind_speed(wind_from_direction_of_gust PT10M)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT10M)';
UPDATE element_description SET element_id='max_wind_speed(wind_from_direction_of_gust PT10M)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT10M)';
UPDATE element_codetable SET element_id='max_wind_speed(wind_from_direction_of_gust PT10M)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT10M)';
UPDATE cf_element SET element_id='max_wind_speed(wind_from_direction_of_gust PT10M)',cell_method='time: maximum (meaning, the corresponding vector to the maximum value of the vector over a time period)', unit='degree', standard_name='wind_from_direction_of_gust' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT10M)';
UPDATE kdvh_element SET element_id='max_wind_speed(wind_from_direction_of_gust PT10M)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT10M)';
delete from metno_element WHERE element_id='from_direction_of_max(wind_speed_of_gust PT10M)';
UPDATE element_status SET element_id='max_wind_speed(wind_from_direction_of_gust PT10M)', status_id='CF-name' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT10M)';
UPDATE element_category SET element_id='max_wind_speed(wind_from_direction_of_gust PT10M)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT10M)';
UPDATE element_sensorlevel SET element_id='max_wind_speed(wind_from_direction_of_gust PT10M)' WHERE element_id='from_direction_of_max(wind_speed_of_gust PT10M)';

--tendency of air pressure
UPDATE element_status SET status_id='CF-name'
where element_id='change_over_time(surface_air_pressure PT1H)';

UPDATE element_status SET status_id='CF-name'
where element_id='change_over_time(surface_air_pressure PT3H)';

UPDATE element_status SET status_id='CF-name'
where element_id='change_over_time(surface_air_pressure PT6H)';

UPDATE cf_element SET standard_name='tendency_of_surface_air_pressure'
where element_id='change_over_time(surface_air_pressure PT1H)';

UPDATE cf_element SET standard_name='tendency_of_surface_air_pressure'
where element_id='change_over_time(surface_air_pressure PT3H)';

UPDATE cf_element SET standard_name='tendency_of_surface_air_pressure'
where element_id='change_over_time(surface_air_pressure PT6H)';

UPDATE cf_element SET cell_method='time: maximum (meaning, the corresponding vector to the maximum value of the vector over a time period)'
where element_id='change_over_time(surface_air_pressure PT1H)';

UPDATE cf_element SET cell_method='time: maximum (meaning, the corresponding vector to the maximum value of the vector over a time period)'
where element_id='change_over_time(surface_air_pressure PT3H)';

UPDATE cf_element SET cell_method='time: maximum (meaning, the corresponding vector to the maximum value of the vector over a time period)'
where element_id='change_over_time(surface_air_pressure PT6H)';

UPDATE element SET id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE id='change_over_time(surface_air_pressure PT6H)';
UPDATE element_name SET element_id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE element_id='change_over_time(surface_air_pressure PT6H)';
UPDATE element_description SET element_id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE element_id='change_over_time(surface_air_pressure PT6H)';
UPDATE element_codetable SET element_id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE element_id='change_over_time(surface_air_pressure PT6H)';
UPDATE cf_element SET element_id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE element_id='change_over_time(surface_air_pressure PT6H)';
UPDATE kdvh_element SET element_id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE element_id='change_over_time(surface_air_pressure PT6H)';
UPDATE metno_element SET element_id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE element_id='change_over_time(surface_air_pressure PT6H)';
UPDATE element_status SET element_id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE element_id='change_over_time(surface_air_pressure PT6H)';
UPDATE element_category SET element_id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE element_id='change_over_time(surface_air_pressure PT6H)';
UPDATE element_sensorlevel SET element_id='over_time(tendency_of_surface_air_pressure PT6H)' WHERE element_id='change_over_time(surface_air_pressure PT6H)';

UPDATE element SET id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE id='change_over_time(surface_air_pressure PT3H)';
UPDATE element_name SET element_id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE element_id='change_over_time(surface_air_pressure PT3H)';
UPDATE element_description SET element_id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE element_id='change_over_time(surface_air_pressure PT3H)';
UPDATE element_codetable SET element_id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE element_id='change_over_time(surface_air_pressure PT3H)';
UPDATE cf_element SET element_id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE element_id='change_over_time(surface_air_pressure PT3H)';
UPDATE kdvh_element SET element_id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE element_id='change_over_time(surface_air_pressure PT3H)';
UPDATE metno_element SET element_id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE element_id='change_over_time(surface_air_pressure PT3H)';
UPDATE element_status SET element_id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE element_id='change_over_time(surface_air_pressure PT3H)';
UPDATE element_category SET element_id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE element_id='change_over_time(surface_air_pressure PT3H)';
UPDATE element_sensorlevel SET element_id='over_time(tendency_of_surface_air_pressure PT3H)' WHERE element_id='change_over_time(surface_air_pressure PT3H)';

UPDATE element SET id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE id='change_over_time(surface_air_pressure PT1H)';
UPDATE element_name SET element_id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE element_id='change_over_time(surface_air_pressure PT1H)';
UPDATE element_description SET element_id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE element_id='change_over_time(surface_air_pressure PT1H)';
UPDATE element_codetable SET element_id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE element_id='change_over_time(surface_air_pressure PT1H)';
UPDATE cf_element SET element_id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE element_id='change_over_time(surface_air_pressure PT1H)';
UPDATE kdvh_element SET element_id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE element_id='change_over_time(surface_air_pressure PT1H)';
UPDATE metno_element SET element_id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE element_id='change_over_time(surface_air_pressure PT1H)';
UPDATE element_status SET element_id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE element_id='change_over_time(surface_air_pressure PT1H)';
UPDATE element_category SET element_id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE element_id='change_over_time(surface_air_pressure PT1H)';
UPDATE element_sensorlevel SET element_id='over_time(tendency_of_surface_air_pressure PT1H)' WHERE element_id='change_over_time(surface_air_pressure PT1H)';


--new method:
Insert into calculation_method (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE) Values   
('max_wind_speed', 'Direction from where the maximum wind speed came from in the given period.', NULL, 'en-US');
 
Insert into calculation_method (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE) Values   
('max_wind_speed', 'Fra-retningen som tilhører maksimal vindhastighet i den gitte perioden', NULL, 'nb-NO');
 
Insert into calculation_method (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE) Values   
('max_wind_speed', 'Frå-retninga som tilhøyrer maksimal vindhastigheit i den gitte perioden', NULL, 'nn-NO');

delete from calculation_method where method_id='from_direction_of_max';

delete from calculation_method where method_id='percent_coverage';

--set SS_24 

UPDATE element SET id='over_time(thickness_of_snowfall_amount P1D)' WHERE id='change_over_time(surface_snow_thickness P1D)';
UPDATE element_name SET element_id='over_time(thickness_of_snowfall_amount P1D)' WHERE element_id='change_over_time(surface_snow_thickness P1D)';
UPDATE element_description SET element_id='over_time(thickness_of_snowfall_amount P1D)' WHERE element_id='change_over_time(surface_snow_thickness P1D)';
UPDATE element_codetable SET element_id='over_time(thickness_of_snowfall_amount P1D)' WHERE element_id='change_over_time(surface_snow_thickness P1D)';
UPDATE cf_element SET element_id='over_time(thickness_of_snowfall_amount P1D)' WHERE element_id='change_over_time(surface_snow_thickness P1D)';
UPDATE kdvh_element SET element_id='over_time(thickness_of_snowfall_amount P1D)' WHERE element_id='change_over_time(surface_snow_thickness P1D)';
UPDATE metno_element SET element_id='over_time(thickness_of_snowfall_amount P1D)' WHERE element_id='change_over_time(surface_snow_thickness P1D)';
UPDATE element_status SET element_id='over_time(thickness_of_snowfall_amount P1D)' WHERE element_id='change_over_time(surface_snow_thickness P1D)';
UPDATE element_category SET element_id='over_time(thickness_of_snowfall_amount P1D)' WHERE element_id='change_over_time(surface_snow_thickness P1D)';
UPDATE element_sensorlevel SET element_id='over_time(thickness_of_snowfall_amount P1D)' WHERE element_id='change_over_time(surface_snow_thickness P1D)';

--set SAE

UPDATE element SET id='over_time(change_in_surface_snow_thickness P1D)' WHERE id='change_over_time(surface_snow_amount P1D)';
UPDATE element_name SET element_id='over_time(change_in_surface_snow_thickness P1D)' WHERE element_id='change_over_time(surface_snow_amount P1D)';
UPDATE element_description SET element_id='over_time(change_in_surface_snow_thickness P1D)' WHERE element_id='change_over_time(surface_snow_amount P1D)';
UPDATE element_codetable SET element_id='over_time(change_in_surface_snow_thickness P1D)' WHERE element_id='change_over_time(surface_snow_amount P1D)';
UPDATE cf_element SET element_id='over_time(change_in_surface_snow_thickness P1D)' WHERE element_id='change_over_time(surface_snow_amount P1D)';
UPDATE kdvh_element SET element_id='over_time(change_in_surface_snow_thickness P1D)' WHERE element_id='change_over_time(surface_snow_amount P1D)';
UPDATE metno_element SET element_id='over_time(change_in_surface_snow_thickness P1D)' WHERE element_id='change_over_time(surface_snow_amount P1D)';
UPDATE element_status SET element_id='over_time(change_in_surface_snow_thickness P1D)', status_id='MET-name' WHERE element_id='change_over_time(surface_snow_amount P1D)';
UPDATE element_category SET element_id='over_time(change_in_surface_snow_thickness P1D)' WHERE element_id='change_over_time(surface_snow_amount P1D)';
UPDATE element_sensorlevel SET element_id='over_time(change_in_surface_snow_thickness P1D)' WHERE element_id='change_over_time(surface_snow_amount P1D)';

--RRX24DT
UPDATE element SET id='over_time(sum(time_of_maximum_precipitation_amount P1D) P1M)' WHERE id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';
UPDATE element_name SET element_id='over_time(sum(time_of_maximum_precipitation_amount P1D) P1M)' WHERE element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';
UPDATE element_description SET element_id='over_time(sum(time_of_maximum_precipitation_amount P1D) P1M)' WHERE element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';
UPDATE element_codetable SET element_id='over_time(sum(time_of_maximum_precipitation_amount P1D) P1M)' WHERE element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';
delete from cf_element where element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';
UPDATE kdvh_element SET element_id='over_time(sum(time_of_maximum_precipitation_amount P1D) P1M)' WHERE element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';
UPDATE metno_element SET element_id='over_time(sum(time_of_maximum_precipitation_amount P1D) P1M)' WHERE element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';
UPDATE element_status SET element_id='over_time(sum(time_of_maximum_precipitation_amount P1D) P1M)', status_id='MET-name' WHERE element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';
UPDATE element_category SET element_id='over_time(sum(time_of_maximum_precipitation_amount P1D) P1M)' WHERE element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';
UPDATE element_sensorlevel SET element_id='over_time(sum(time_of_maximum_precipitation_amount P1D) P1M)' WHERE element_id='time_of_event_of_max(sum(precipitation_amount P1D) P1M)';

--TAXDT
UPDATE element SET id='over_time(time_of_maximum_air_temperature P1M)' WHERE id='time_of_event_of_max(air_temperature P1M)';
UPDATE element_name SET element_id='over_time(time_of_maximum_air_temperature P1M)' WHERE element_id='time_of_event_of_max(air_temperature P1M)';
UPDATE element_description SET element_id='over_time(time_of_maximum_air_temperature P1M)' WHERE element_id='time_of_event_of_max(air_temperature P1M)';
UPDATE element_codetable SET element_id='over_time(time_of_maximum_air_temperature P1M)' WHERE element_id='time_of_event_of_max(air_temperature P1M)';
delete from cf_element where element_id like 'time_of_event_of_max(air_temperature P1M)';
UPDATE kdvh_element SET element_id='over_time(time_of_maximum_air_temperature P1M)' WHERE element_id='time_of_event_of_max(air_temperature P1M)';
UPDATE metno_element SET element_id='over_time(time_of_maximum_air_temperature P1M)' WHERE element_id='time_of_event_of_max(air_temperature P1M)';
UPDATE element_status SET element_id='over_time(time_of_maximum_air_temperature P1M)', status_id='MET-name' WHERE element_id='time_of_event_of_max(air_temperature P1M)';
UPDATE element_category SET element_id='over_time(time_of_maximum_air_temperature P1M)' WHERE element_id='time_of_event_of_max(air_temperature P1M)';
UPDATE element_sensorlevel SET element_id='over_time(time_of_maximum_air_temperature P1M)' WHERE element_id='time_of_event_of_max(air_temperature P1M)';

--TANDT
UPDATE element SET id='over_time(time_of_minimum_air_temperature P1M)' WHERE id='time_of_event_of_min(air_temperature P1M)';
UPDATE element_name SET element_id='over_time(time_of_minimum_air_temperature P1M)' WHERE element_id='time_of_event_of_min(air_temperature P1M)';
UPDATE element_description SET element_id='over_time(time_of_minimum_air_temperature P1M)' WHERE element_id='time_of_event_of_min(air_temperature P1M)';
UPDATE element_codetable SET element_id='over_time(time_of_minimum_air_temperature P1M)' WHERE element_id='time_of_event_of_min(air_temperature P1M)';
delete from cf_element where element_id like 'time_of_event_of_min(air_temperature P1M)';
UPDATE kdvh_element SET element_id='over_time(time_of_minimum_air_temperature P1M)' WHERE element_id='time_of_event_of_min(air_temperature P1M)';
UPDATE metno_element SET element_id='over_time(time_of_minimum_air_temperature P1M)' WHERE element_id='time_of_event_of_min(air_temperature P1M)';
UPDATE element_status SET element_id='over_time(time_of_minimum_air_temperature P1M)', status_id='MET-name' WHERE element_id='time_of_event_of_min(air_temperature P1M)';
UPDATE element_category SET element_id='over_time(time_of_minimum_air_temperature P1M)' WHERE element_id='time_of_event_of_min(air_temperature P1M)';
UPDATE element_sensorlevel SET element_id='over_time(time_of_minimum_air_temperature P1M)' WHERE element_id='time_of_event_of_min(air_temperature P1M)';

--FXXDT
UPDATE element SET id='over_time(time_of_maximum_wind_speed P1M)' WHERE id='time_of_event_of_max(max(wind_speed P1D) P1M)';
UPDATE element_name SET element_id='over_time(time_of_maximum_wind_speed P1M)' WHERE element_id='time_of_event_of_max(max(wind_speed P1D) P1M)';
UPDATE element_description SET element_id='over_time(time_of_maximum_wind_speed P1M)' WHERE element_id='time_of_event_of_max(max(wind_speed P1D) P1M)';
UPDATE element_codetable SET element_id='over_time(time_of_maximum_wind_speed P1M)' WHERE element_id='time_of_event_of_max(max(wind_speed P1D) P1M)';
delete from cf_element WHERE element_id='time_of_event_of_max(max(wind_speed P1D) P1M)';
UPDATE kdvh_element SET element_id='over_time(time_of_maximum_wind_speed P1M)' WHERE element_id='time_of_event_of_max(max(wind_speed P1D) P1M)';
UPDATE metno_element SET element_id='over_time(time_of_maximum_wind_speed P1M)'  WHERE element_id='time_of_event_of_max(max(wind_speed P1D) P1M)';
UPDATE element_status SET element_id='over_time(time_of_maximum_wind_speed P1M)' , status_id='MET-name' WHERE element_id='time_of_event_of_max(max(wind_speed P1D) P1M)';
UPDATE element_category SET element_id='over_time(time_of_maximum_wind_speed P1M)' WHERE element_id='time_of_event_of_max(max(wind_speed P1D) P1M)';
UPDATE element_sensorlevel SET element_id='over_time(time_of_maximum_wind_speed P1M)' WHERE element_id='time_of_event_of_max(max(wind_speed P1D) P1M)';

--KLFX
UPDATE element SET id='over_time(time_of_maximum_wind_speed PT1H)' WHERE id='time_of_event_of_max(wind_speed PT1H)';
UPDATE element_name SET element_id='over_time(time_of_maximum_wind_speed PT1H)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)';
UPDATE element_description SET element_id='over_time(time_of_maximum_wind_speed PT1H)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)';
UPDATE element_codetable SET element_id='over_time(time_of_maximum_wind_speed PT1H)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)';
delete from cf_element  WHERE element_id='time_of_event_of_max(wind_speed PT1H)';
UPDATE kdvh_element SET element_id='over_time(time_of_maximum_wind_speed PT1H)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)';
UPDATE metno_element SET element_id='over_time(time_of_maximum_wind_speed PT1H)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)';
UPDATE element_status SET element_id='over_time(time_of_maximum_wind_speed PT1H)' , status_id='MET-name' WHERE element_id='time_of_event_of_max(wind_speed PT1H)';
UPDATE element_category SET element_id='over_time(time_of_maximum_wind_speed PT1H)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)';
UPDATE element_sensorlevel SET element_id='over_time(time_of_maximum_wind_speed PT1H)' WHERE element_id='time_of_event_of_max(wind_speed PT1H)';

--KLFG
UPDATE element SET id='over_time(time_of_maximum_wind_speed_of_gust PT1H)' WHERE id='time_of_event_of_max(wind_speed_of_gust PT1H)';
UPDATE element_name SET element_id='over_time(time_of_maximum_wind_speed_of_gust PT1H)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)';
UPDATE element_description SET element_id='over_time(time_of_maximum_wind_speed_of_gust PT1H)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)';
UPDATE element_codetable SET element_id='over_time(time_of_maximum_wind_speed_of_gust PT1H)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)';
delete from cf_element  WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)';
UPDATE kdvh_element SET element_id='over_time(time_of_maximum_wind_speed_of_gust PT1H)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)';
UPDATE metno_element SET element_id='over_time(time_of_maximum_wind_speed_of_gust PT1H)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)';
UPDATE element_status SET element_id='over_time(time_of_maximum_wind_speed_of_gust PT1H)' , status_id='MET-name' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)';
UPDATE element_category SET element_id='over_time(time_of_maximum_wind_speed_of_gust PT1H)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)';
UPDATE element_sensorlevel SET element_id='over_time(time_of_maximum_wind_speed_of_gust PT1H)' WHERE element_id='time_of_event_of_max(wind_speed_of_gust PT1H)';

delete from calculation_method where method_id='time_of_event_of_max';

delete from calculation_method where method_id='time_of_event_of_min';

delete from calculation_method where method_id='change_over_time';

--update element names

UPDATE element_name SET name='Midlere jordtemperatur' WHERE element_id='mean(soil_temperature PT1H)' and name_locale='nb-NO';
UPDATE element_name SET name='Midlere jordtemperatur' WHERE element_id='mean(soil_temperature PT1H)' and name_locale='nn-NO';
UPDATE element_name SET name='Mean soil temperature' WHERE element_id='mean(soil_temperature PT1H)' and name_locale='en-US';

UPDATE element_name SET name='Jordtemperatur' WHERE element_id='soil_temperature' and name_locale='nb-NO';
UPDATE element_name SET name='Jordtemperatur' WHERE element_id='soil_temperature' and name_locale='nn-NO';
UPDATE element_name SET name='Soil temperature' WHERE element_id='soil_temperature' and name_locale='en-US';

UPDATE element_description SET description='Lufttemperatur (standard 2 m høyde), nåverdi' WHERE element_id='air_temperature' and description_locale='nb-NO';
UPDATE element_description SET description='Lufttemperatur (standard 2 m høyde), nåverdi' WHERE element_id='air_temperature' and description_locale='nn-NO';
UPDATE element_description SET description='Air temperature (default 2 m), now value ' WHERE element_id='air_temperature' and description_locale='en-US';

UPDATE element_name SET name='Jordens vanninnhold' WHERE element_id='volume_fraction_of_water_in_soil' and name_locale='nb-NO';


UPDATE element_description SET description='Antall minutter med sol' where element_id='sum(duration_of_sunshine PT1M)' and description_locale='nb-NO';
UPDATE element_description SET description='Kor mange minutt i det har vore sol' where element_id='sum(duration_of_sunshine PT1M)' and description_locale='nn-NO';
UPDATE element_description SET description='Number of minutes with sunshine' where element_id='sum(duration_of_sunshine PT1M)' and description_locale='en-US';

UPDATE element_description SET description='Høyeste registrerte temperatur i timen eller døgnet (over 24 timer i henhold til offset)' where element_id='max(air_temperature P1D)' and description_locale='nb-NO';
UPDATE element_description SET description='Høgaste registrerte temperatur i timen eller døgnet (over 24 timar i følge offset)' where element_id='max(air_temperature P1D)' and description_locale='nn-NO';
UPDATE element_description SET description='Highest noted temperature this hour/day (in 24 hours according to offset)' where element_id='max(air_temperature P1D)' and description_locale='en-US';

UPDATE element_description SET description='Høyeste registrerte temperatur i perioden' where element_id='max(air_temperature PT10M)' and description_locale='nb-NO';
UPDATE element_description SET description='Høgaste registrerte temperatur' where element_id='max(air_temperature PT10M)' and description_locale='nn-NO';
UPDATE element_description SET description='Highest noted temperature in period' where element_id='max(air_temperature PT10M)' and description_locale='en-US';


UPDATE element_description SET description='Number of hours with sunshine' where element_id='sum(duration_of_sunshine P1M)' and description_locale='en-US';

--update OT_01 in kdvh_element and add OT_010

update kdvh_element set elem_code='OT_01', param_id='2121' where element_id='sum(duration_of_sunshine PT1M)';

Insert into ELEMENT
   (ID, UNIT)
 Values
   ('sum(duration_of_sunshine PT10M)', 'minutes');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(duration_of_sunshine PT10M)', 'Sol siste time', 'nb-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(duration_of_sunshine PT10M)', 'Sol siste timen', 'nn-NO');
Insert into ELEMENT_NAME
   (ELEMENT_ID, NAME, NAME_LOCALE)
 Values
   ('sum(duration_of_sunshine PT10M)', 'Sunshine last hour', 'en-US');

Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(duration_of_sunshine PT10M)', 'Antall minutter med sol', 'nb-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(duration_of_sunshine PT10M)', 'Kor mange minutt i det har vore sol', 'nn-NO');
Insert into ELEMENT_DESCRIPTION
   (ELEMENT_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum(duration_of_sunshine PT10M)', 'Number of minutes with sunshine', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(duration_of_sunshine PT10M)', 'Sol', 'nn-NO');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(duration_of_sunshine PT10M)', 'Sunshine', 'en-US');
Insert into ELEMENT_CATEGORY
   (ELEMENT_ID, CATEGORY, CATEGORY_LOCALE)
 Values
   ('sum(duration_of_sunshine PT10M)', 'Sol', 'nb-NO');

Insert into ELEMENT_STATUS
   (ELEMENT_ID, STATUS_ID)
 Values
   ('sum(duration_of_sunshine PT10M)', 'CF-name');

Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, PARAM_ID, ELEMENT_ID)
 Values
   ('OT_010', 'minutes', '2122', 'sum(duration_of_sunshine PT10M)');

Insert into CF_ELEMENT
   (STANDARD_NAME, UNIT, STATUS, ELEMENT_ID, CELL_METHOD)
 Values
   ('duration_of_sunshine', 's', '37', 'sum(duration_of_sunshine PT10M)', 'time: sum');


--update visibility element id's
UPDATE element SET id='visibility_in_air_poorest_direction' WHERE id='visibility_in_air_horizontal';
UPDATE element_name SET element_id='visibility_in_air_poorest_direction' WHERE element_id='visibility_in_air_horizontal';
UPDATE element_description SET element_id='visibility_in_air_poorest_direction' WHERE element_id='visibility_in_air_horizontal';
UPDATE element_codetable SET element_id='visibility_in_air_poorest_direction' WHERE element_id='visibility_in_air_horizontal';
UPDATE cf_element SET element_id='visibility_in_air_poorest_direction' WHERE element_id='visibility_in_air_horizontal';
UPDATE kdvh_element SET element_id='visibility_in_air_poorest_direction' WHERE element_id='visibility_in_air_horizontal';
UPDATE metno_element SET element_id='visibility_in_air_poorest_direction' WHERE element_id='visibility_in_air_horizontal';
UPDATE element_status SET element_id='visibility_in_air_poorest_direction' WHERE element_id='visibility_in_air_horizontal';
UPDATE element_category SET element_id='visibility_in_air_poorest_direction' WHERE element_id='visibility_in_air_horizontal';

UPDATE element SET id='min(visibility_in_air_poorest_direction P1D)' WHERE id='min(visibility_in_air_horizontal P1D)';
UPDATE element_name SET element_id='min(visibility_in_air_poorest_direction P1D)' WHERE element_id='min(visibility_in_air_horizontal P1D)';
UPDATE element_description SET element_id='min(visibility_in_air_poorest_direction P1D)' WHERE element_id='min(visibility_in_air_horizontal P1D)';
UPDATE element_codetable SET element_id='min(visibility_in_air_poorest_direction P1D)' WHERE element_id='min(visibility_in_air_horizontal P1D)';
UPDATE cf_element SET element_id='min(visibility_in_air_poorest_direction P1D)' WHERE element_id='min(visibility_in_air_horizontal P1D)';
UPDATE kdvh_element SET element_id='min(visibility_in_air_poorest_direction P1D)' WHERE element_id='min(visibility_in_air_horizontal P1D)';
UPDATE metno_element SET element_id='min(visibility_in_air_poorest_direction P1D)' WHERE element_id='min(visibility_in_air_horizontal P1D)';
UPDATE element_status SET element_id='min(visibility_in_air_poorest_direction P1D)' WHERE element_id='min(visibility_in_air_horizontal P1D)';
UPDATE element_category SET element_id='min(visibility_in_air_poorest_direction P1D)' WHERE element_id='min(visibility_in_air_horizontal P1D)';

UPDATE element SET id='min(visibility_in_air_poorest_direction P1M)' WHERE id='min(visibility_in_air_horizontal P1M)';
UPDATE element_name SET element_id='min(visibility_in_air_poorest_direction P1M)' WHERE element_id='min(visibility_in_air_horizontal P1M)';
UPDATE element_description SET element_id='min(visibility_in_air_poorest_direction P1M)' WHERE element_id='min(visibility_in_air_horizontal P1M)';
UPDATE element_codetable SET element_id='min(visibility_in_air_poorest_direction P1M)' WHERE element_id='min(visibility_in_air_horizontal P1M)';
UPDATE cf_element SET element_id='min(visibility_in_air_poorest_direction P1M)' WHERE element_id='min(visibility_in_air_horizontal P1M)';
UPDATE kdvh_element SET element_id='min(visibility_in_air_poorest_direction P1M)' WHERE element_id='min(visibility_in_air_horizontal P1M)';
UPDATE metno_element SET element_id='min(visibility_in_air_poorest_direction P1M)' WHERE element_id='min(visibility_in_air_horizontal P1M)';
UPDATE element_status SET element_id='min(visibility_in_air_poorest_direction P1M)' WHERE element_id='min(visibility_in_air_horizontal P1M)';
UPDATE element_category SET element_id='min(visibility_in_air_poorest_direction P1M)' WHERE element_id='min(visibility_in_air_horizontal P1M)';

UPDATE element SET id='max(visibility_in_air_poorest_direction P1M)' WHERE id='max(visibility_in_air_horizontal P1M)';
UPDATE element_name SET element_id='max(visibility_in_air_poorest_direction P1M)' WHERE element_id='max(visibility_in_air_horizontal P1M)';
UPDATE element_description SET element_id='max(visibility_in_air_poorest_direction P1M)' WHERE element_id='max(visibility_in_air_horizontal P1M)';
UPDATE element_codetable SET element_id='max(visibility_in_air_poorest_direction P1M)' WHERE element_id='max(visibility_in_air_horizontal P1M)';
UPDATE cf_element SET element_id='max(visibility_in_air_poorest_direction P1M)' WHERE element_id='max(visibility_in_air_horizontal P1M)';
UPDATE kdvh_element SET element_id='max(visibility_in_air_poorest_direction P1M)' WHERE element_id='max(visibility_in_air_horizontal P1M)';
UPDATE metno_element SET element_id='max(visibility_in_air_poorest_direction P1M)' WHERE element_id='max(visibility_in_air_horizontal P1M)';
UPDATE element_status SET element_id='max(visibility_in_air_poorest_direction P1M)' WHERE element_id='max(visibility_in_air_horizontal P1M)';
UPDATE element_category SET element_id='max(visibility_in_air_poorest_direction P1M)' WHERE element_id='max(visibility_in_air_horizontal P1M)';

UPDATE element SET id='max(visibility_in_air_poorest_direction P1D)' WHERE id='max(visibility_in_air_horizontal P1D)';
UPDATE element_name SET element_id='max(visibility_in_air_poorest_direction P1D)' WHERE element_id='max(visibility_in_air_horizontal P1D)';
UPDATE element_description SET element_id='max(visibility_in_air_poorest_direction P1D)' WHERE element_id='max(visibility_in_air_horizontal P1D)';
UPDATE element_codetable SET element_id='max(visibility_in_air_poorest_direction P1D)' WHERE element_id='max(visibility_in_air_horizontal P1D)';
UPDATE cf_element SET element_id='max(visibility_in_air_poorest_direction P1D)' WHERE element_id='max(visibility_in_air_horizontal P1D)';
UPDATE kdvh_element SET element_id='max(visibility_in_air_poorest_direction P1D)' WHERE element_id='max(visibility_in_air_horizontal P1D)';
UPDATE metno_element SET element_id='max(visibility_in_air_poorest_direction P1D)' WHERE element_id='max(visibility_in_air_horizontal P1D)';
UPDATE element_status SET element_id='max(visibility_in_air_poorest_direction P1D)' WHERE element_id='max(visibility_in_air_horizontal P1D)';
UPDATE element_category SET element_id='max(visibility_in_air_poorest_direction P1D)' WHERE element_id='max(visibility_in_air_horizontal P1D)';



--UPDATE the CF CELL_METHOD

update cf_element set cell_method='time: sum' where element_id='sum(boolean_clear_sky_weather(cloud_area_fraction P1D) P1M)';
update cf_element set cell_method='time: sum' where element_id='sum(boolean_fair_weather(cloud_area_fraction P1D) P1M)';
update cf_element set cell_method='time: sum', standard_name='cloud_area_fraction' where element_id='sum(boolean_overcast_weather(cloud_area_fraction P1D) P1M)';

update cf_element set  standard_name='integral_of_air_temperature_deficit_wrt_time' where element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1M 17.0)';
update cf_element set  standard_name='integral_of_air_temperature_deficit_wrt_time' where element_id='integral_of_deficit_interpolated(mean(air_temperature P1D) P1Y 17.0)';

update cf_element set cell_method='time: maximum' where element_id='max(max(wind_speed P1D) P1M)';
update cf_element set cell_method='time: maximum' where element_id='max(max(wind_speed PT1H) P1D)';

update cf_element set cell_method='time: mean time: maximum' where element_id='mean(max(wind_speed P1D) P1M)';
update cf_element set cell_method='time: mean time: maximum' where element_id='mean(max(wind_speed PT1H) P1D)';

update cf_element set cell_method='time: maximum time: mean' where element_id='max(mean(surface_downwelling_shortwave_flux_in_air PT1M) PT1H)';

update cf_element set cell_method='time: sum (algorithm for occurences, boolean value 1 if found 0 if not)' , standard_name='cloud_area_fraction' where element_id='boolean_clear_sky_weather(cloud_area_fraction P1D)';
update cf_element set cell_method='time: sum (algorithm for occurences, boolean value 1 if found 0 if not)' , standard_name='cloud_area_fraction' where element_id='boolean_fair_weather(cloud_area_fraction P1D)';

update cf_element set cell_method='time: sum time:sum (counting a number of X)', standard_name='precipitation_amount' where element_id='number_of_days_gte(sum(precipitation_amount P1D) P1M 0.1)';
update cf_element set cell_method='time: sum time:sum (counting a number of X)', standard_name='precipitation_amount' where element_id='number_of_days_gte(sum(precipitation_amount P1D) P1Y 0.1)';

update cf_element set cell_method='time: sum (accumulated since the value was 0)' where element_id='accumulated(precipitation_amount)';
update cf_element set cell_method='time: sum (accumulated since the value was 0)' where element_id='accumulated(precipitation_amount)';
update cf_element set cell_method='time: maximum' where element_id='max(relative_humidity PT1H)';
update cf_element set cell_method='time: maximum' where element_id='max(surface_upwelling_longwave_flux_in_air PT1H)';
update cf_element set cell_method='time: mean' where element_id='mean(humidity_mixing_ratio P1M)';
update cf_element set cell_method='time: mean' where element_id='mean(water_vapor_partial_pressure_in_air P1D)';
update cf_element set cell_method='time: mean' where element_id='mean(water_vapor_partial_pressure_in_air P1M)';
update cf_element set cell_method='time: minimum' where element_id='min(relative_humidity PT1H)';
update cf_element set standard_name='thickness_of_snowfall_amount' where element_id='over_time(thickness_of_snowfall_amount P1D)';
update cf_element set cell_method='time: sum' where element_id='sum(duration_of_sunshine PT1M)';
update cf_element set cell_method='time: sum' where element_id='sum(precipitation_amount PT30D)';

update cf_element set cell_method='time: mean (using the k value)' where element_id='mean_k(air_temperature P1D)';

update cf_element set cell_method='time: mean (using the k value)' where element_id='mean_k(air_temperature P1M)';

delete from cf_element where element_id='over_time(change_in_surface_snow_thickness P1D)';

delete from metno_element where element_id='sea_surface_wave_energy_at_variance_spectral_density_maximum';

Insert into CF_ELEMENT
   (STANDARD_NAME, UNIT, STATUS, ELEMENT_ID)
 Values
   ('sea_surface_wave_energy_at_variance_spectral_density_maximum', 'm2 s', '37', 'sea_surface_wave_energy_at_variance_spectral_density_maximum');
   
Update CF_element set status='44';

delete from KDVH_ELEMENT where element_id='accumulated(precipitation_amount)';

Insert into KDVH_ELEMENT
   (ELEM_CODE, UNIT, PARAM_ID, ELEMENT_ID)
 Values
   ('RA', 'mm', '104', 'accumulated(precipitation_amount)');


# --- !Downs
