# --- !Ups

UPDATE element_description SET description='Period corresponding to maximum in the spectra in seconds'  WHERE element_id='sea_surface_wave_period_at_variance_spectral_density_maximum' AND description_locale='en-US'; 
UPDATE element_description SET description='Current speed at different depths below sea surface (default 10 m)'  WHERE element_id='sea_water_speed' AND description_locale='en-US'; 
UPDATE element_description SET description='Current direction at different depths below sea surface (default 10 m)'  WHERE element_id='sea_water_to_direction' AND description_locale='en-US'; 
UPDATE element_description SET description='Soil water at different depths (default 10 cm)'  WHERE element_id='volume_fraction_of_water_in_soil' AND description_locale='en-US'; 
UPDATE element_description SET description='Snow temperature in °C, now value at different depths (default 10 cm)'  WHERE element_id='snow_temperature' AND description_locale='en-US'; 
UPDATE element_description SET description='Snow temperature in °C, maximum minute value last hour at different depths (default 10 cm)'  WHERE element_id='max(snow_temperature PT1H)' AND description_locale='en-US'; 
UPDATE element_description SET description='Snow temperature in °C, minimum minute value last hour at different depths (default 10 cm)'  WHERE element_id='min(snow_temperature PT1H)' AND description_locale='en-US'; 
UPDATE element_description SET description='Snow temperature in °C, hourly mean value at different depths (default 10 cm)'  WHERE element_id='mean(snow_temperature PT1H)' AND description_locale='en-US';

UPDATE element_description SET description='Strømfart i ulike dybder under overflaten (standard 10 m)'  WHERE element_id='sea_water_speed' AND description_locale='nb-NO'; 
UPDATE element_description SET description='Strømretning i ulike dybder (standard 10 m)'  WHERE element_id='sea_water_to_direction' AND description_locale='nb-NO'; 
UPDATE element_description SET description='Jordens vanninnhold i ulike dyder (standard 10 cm)'  WHERE element_id='volume_fraction_of_water_in_soil' AND description_locale='nb-NO'; 
UPDATE element_description SET description='Snøtemperatur i °C, nåverdi i ulike dybder (standard 10 cm)'  WHERE element_id='snow_temperature' AND description_locale='nb-NO'; 
UPDATE element_description SET description='Snøtemperatur i °C, maksimum minuttverdi i timen i ulike dybder (standard 10 cm)'  WHERE element_id='max(snow_temperature PT1H)' AND description_locale='nb-NO'; 
UPDATE element_description SET description='Snøtemperatur i °C, minimum minuttverdi i timen i ulike dybder (standard 10 cm)'  WHERE element_id='min(snow_temperature PT1H)' AND description_locale='nb-NO'; 
UPDATE element_description SET description='Snøtemperatur i °C, timemiddel i ulike dybder (standard 10 cm)'  WHERE element_id='mean(snow_temperature PT1H)' AND description_locale='nb-NO';


UPDATE element_description SET description='Straumfart i ulike djupn under overflata (standard 10 m)'  WHERE element_id='sea_water_speed' AND description_locale='nn-NO'; 
UPDATE element_description SET description='Straumretning i ulike djupn under overflata (standard 10 m)'  WHERE element_id='sea_water_to_direction' AND description_locale='nn-NO'; 
UPDATE element_description SET description='Jorda sitt vassinnhald i ulike djupn (standard 10 cm)'  WHERE element_id='volume_fraction_of_water_in_soil' AND description_locale='nn-NO'; 
UPDATE element_description SET description='Snøtemperatur i °C, nåverdi i ulike djupn (standard 10 cm)'  WHERE element_id='snow_temperature' AND description_locale='nn-NO'; 
UPDATE element_description SET description='Snøtemperatur i °C, maksimum minuttverdi i timen i ulike djupn (standard 10 cm)'  WHERE element_id='max(snow_temperature PT1H)' AND description_locale='nn-NO'; 
UPDATE element_description SET description='Snøtemperatur i °C, minimum minuttverdi i timen i ulike djupn (standard 10 cm)'  WHERE element_id='min(snow_temperature PT1H)' AND description_locale='nn-NO'; 
UPDATE element_description SET description='Snøtemperatur i °C, timemiddel i ulike djupn (standard 10 cm)'  WHERE element_id='mean(snow_temperature PT1H)' AND description_locale='nn-NO';

# --- !Downs
