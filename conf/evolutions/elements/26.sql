# --- !Ups

-- new elements
insert into element (id, unit) values ('air_temperature_vertical_difference','degC');
insert into element (id, unit) values ('cloud_type_icao1','code');
insert into element (id, unit) values ('cloud_type_icao2','code');
insert into element (id, unit) values ('cloud_type_icao3','code');
insert into element (id, unit) values ('ice_of_land_origin_type','code');
insert into element (id, unit) values ('icing_rate_type_on_ship','code');
insert into element (id, unit) values ('icing_thickness','cm');
insert into element (id, unit) values ('icing_type_on_ship','code');
insert into element (id, unit) values ('mean(vessel_speed PT3H)','m/s');
insert into element (id, unit) values ('tendency_of_surface_air_pressure_type','code');
insert into element (id, unit) values ('time_since_deicing_index','Indeks');
insert into element (id, unit) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','code');

insert into element (id, unit) values ('sum_until_day_of_year(preciptation_amount P1D)','mm');

--names
insert into element_name (element_id, name, name_locale) values ('air_temperature_vertical_difference','Air temperature -vertical diff','en-US');
insert into element_name (element_id, name, name_locale) values ('air_temperature_vertical_difference','Lufttemperaturdifferanse vertikalt','nb-NO');
insert into element_name (element_id, name, name_locale) values ('air_temperature_vertical_difference','Lufttemperaturdiff. vertikalt','nn-NO');
insert into element_name (element_id, name, name_locale) values ('cloud_type_icao1','Clouds (CB/TCU)','en-US');
insert into element_name (element_id, name, name_locale) values ('cloud_type_icao1','Skytype (CB/TCU)','nb-NO');
insert into element_name (element_id, name, name_locale) values ('cloud_type_icao1','Skytype (CB/TCU)','nn-NO');
insert into element_name (element_id, name, name_locale) values ('cloud_type_icao2','Clouds (CB/TCU)','en-US');
insert into element_name (element_id, name, name_locale) values ('cloud_type_icao2','Skytype (CB/TCU)','nb-NO');
insert into element_name (element_id, name, name_locale) values ('cloud_type_icao2','Skytype (CB/TCU)','nn-NO');
insert into element_name (element_id, name, name_locale) values ('cloud_type_icao3','Clouds (CB/TCU)','en-US');
insert into element_name (element_id, name, name_locale) values ('cloud_type_icao3','Skytype (CB/TCU)','nb-NO');
insert into element_name (element_id, name, name_locale) values ('cloud_type_icao3','Skytype (CB/TCU)','nn-NO');
insert into element_name (element_id, name, name_locale) values ('ice_of_land_origin_type','Ice of land origin','en-US');
insert into element_name (element_id, name, name_locale) values ('ice_of_land_origin_type','Mengd av isfjell (navigasjonsfare)','nn-NO');
insert into element_name (element_id, name, name_locale) values ('ice_of_land_origin_type','Mengde av isfjell (navigasjonsfare)','nb-NO');
insert into element_name (element_id, name, name_locale) values ('icing_rate_type_on_ship','Endring i ising','nb-NO');
insert into element_name (element_id, name, name_locale) values ('icing_rate_type_on_ship','Endring i ising','nn-NO');
insert into element_name (element_id, name, name_locale) values ('icing_rate_type_on_ship','Rate of ice accretion on ships','en-US');
insert into element_name (element_id, name, name_locale) values ('icing_thickness','Icing','en-US');
insert into element_name (element_id, name, name_locale) values ('icing_thickness','Ising','nb-NO');
insert into element_name (element_id, name, name_locale) values ('icing_thickness','Ising','nn-NO');
insert into element_name (element_id, name, name_locale) values ('icing_type_on_ship','Ice accretion on ships','en-US');
insert into element_name (element_id, name, name_locale) values ('icing_type_on_ship','Årsak til ising på skip','nb-NO');
insert into element_name (element_id, name, name_locale) values ('icing_type_on_ship','Årsak til ising på skip','nn-NO');
insert into element_name (element_id, name, name_locale) values ('mean(vessel_speed PT3H)','Farta på fartøyet','nn-NO');
insert into element_name (element_id, name, name_locale) values ('mean(vessel_speed PT3H)','Fartøyets  hastighet','nb-NO');
insert into element_name (element_id, name, name_locale) values ('mean(vessel_speed PT3H)','Speed of vessel','en-US');
insert into element_name (element_id, name, name_locale) values ('tendency_of_surface_air_pressure_type','Air pressure characteristic','en-US');
insert into element_name (element_id, name, name_locale) values ('tendency_of_surface_air_pressure_type','Karakteristikk av lufttrykk','nb-NO');
insert into element_name (element_id, name, name_locale) values ('tendency_of_surface_air_pressure_type','Karakteristikk av lufttrykk','nn-NO');
insert into element_name (element_id, name, name_locale) values ('time_since_deicing_index','Icing index','en-US');
insert into element_name (element_id, name, name_locale) values ('time_since_deicing_index','Isingsindeks','nb-NO');
insert into element_name (element_id, name, name_locale) values ('time_since_deicing_index','Isingsindeks','nn-NO');

insert into element_name (element_id, name, name_locale) values ('sum_until_day_of_year(preciptation_amount P1D)','Precipitation sum until day of year','en-US');
insert into element_name (element_id, name, name_locale) values ('sum_until_day_of_year(preciptation_amount P1D)','Nedbørsum til årets dato','nb-NO');
insert into element_name (element_id, name, name_locale) values ('sum_until_day_of_year(preciptation_amount P1D)','Nedbørsum til årsets dato','nn-NO');

insert into element_name (element_id, name, name_locale) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','Weather symbol (icon number)','en-US');
insert into element_name (element_id, name, name_locale) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','Værsymbol (ikonnummer)','nb-NO');
insert into element_name (element_id, name, name_locale) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','Værsymbol (ikonnummer)','nn-NO');

--categories
insert into element_category (element_id, category, category_locale) values ('air_temperature_vertical_difference','Temperatur','nb-NO');
insert into element_category (element_id, category, category_locale) values ('air_temperature_vertical_difference','Temperatur','nn-NO');
insert into element_category (element_id, category, category_locale) values ('air_temperature_vertical_difference','Temperature','en-US');
insert into element_category (element_id, category, category_locale) values ('cloud_type_icao1','Clouds','en-US');
insert into element_category (element_id, category, category_locale) values ('cloud_type_icao1','Skyer','nb-NO');
insert into element_category (element_id, category, category_locale) values ('cloud_type_icao1','Skyer','nn-NO');
insert into element_category (element_id, category, category_locale) values ('cloud_type_icao2','Clouds','en-US');
insert into element_category (element_id, category, category_locale) values ('cloud_type_icao2','Skyer','nb-NO');
insert into element_category (element_id, category, category_locale) values ('cloud_type_icao2','Skyer','nn-NO');
insert into element_category (element_id, category, category_locale) values ('cloud_type_icao3','Clouds','en-US');
insert into element_category (element_id, category, category_locale) values ('cloud_type_icao3','Skyer','nb-NO');
insert into element_category (element_id, category, category_locale) values ('cloud_type_icao3','Skyer','nn-NO');
insert into element_category (element_id, category, category_locale) values ('ice_of_land_origin_type','Sea ice','en-US');
insert into element_category (element_id, category, category_locale) values ('ice_of_land_origin_type','Sjøis','nb-NO');
insert into element_category (element_id, category, category_locale) values ('ice_of_land_origin_type','Sjøis','nn-NO');
insert into element_category (element_id, category, category_locale) values ('icing_rate_type_on_ship','Icing','en-US');
insert into element_category (element_id, category, category_locale) values ('icing_rate_type_on_ship','Ising','nb-NO');
insert into element_category (element_id, category, category_locale) values ('icing_rate_type_on_ship','Ising','nn-NO');
insert into element_category (element_id, category, category_locale) values ('icing_thickness','Icing','en-US');
insert into element_category (element_id, category, category_locale) values ('icing_thickness','Ising','nb-NO');
insert into element_category (element_id, category, category_locale) values ('icing_thickness','Ising','nn-NO');
insert into element_category (element_id, category, category_locale) values ('icing_type_on_ship','Icing','en-US');
insert into element_category (element_id, category, category_locale) values ('icing_type_on_ship','Ising','nb-NO');
insert into element_category (element_id, category, category_locale) values ('icing_type_on_ship','Ising','nn-NO');
insert into element_category (element_id, category, category_locale) values ('mean(vessel_speed PT3H)','Metadata','en-US');
insert into element_category (element_id, category, category_locale) values ('mean(vessel_speed PT3H)','Metadata','nb-NO');
insert into element_category (element_id, category, category_locale) values ('mean(vessel_speed PT3H)','Metadata','nn-NO');
insert into element_category (element_id, category, category_locale) values ('tendency_of_surface_air_pressure_type','Air pressure','en-US');
insert into element_category (element_id, category, category_locale) values ('tendency_of_surface_air_pressure_type','Lufttrykk','nb-NO');
insert into element_category (element_id, category, category_locale) values ('tendency_of_surface_air_pressure_type','Lufttrykk','nn-NO');
insert into element_category (element_id, category, category_locale) values ('time_since_deicing_index','Icing','en-US');
insert into element_category (element_id, category, category_locale) values ('time_since_deicing_index','Ising','nb-NO');
insert into element_category (element_id, category, category_locale) values ('time_since_deicing_index','Ising','nn-NO');

insert into element_category (element_id, category, category_locale) values ('sum_until_day_of_year(preciptation_amount P1D)','Precipitation','en-US');
insert into element_category (element_id, category, category_locale) values ('sum_until_day_of_year(preciptation_amount P1D)','Nedbør','nb-NO');
insert into element_category (element_id, category, category_locale) values ('sum_until_day_of_year(preciptation_amount P1D)','Nedbør','nn-NO');

insert into element_category (element_id, category, category_locale) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','Weather','en-US');
insert into element_category (element_id, category, category_locale) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','Vær','nb-NO');
insert into element_category (element_id, category, category_locale) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','Vêr','nn-NO');

-- descriptions
insert into element_description (element_id, description, description_locale) values ('air_temperature_vertical_difference','Vertical differens i temperature','en-US');
insert into element_description (element_id, description, description_locale) values ('air_temperature_vertical_difference','Vertikal temperaturdifferanse','nb-NO');
insert into element_description (element_id, description, description_locale) values ('air_temperature_vertical_difference','Vertikal temperaturdifferanse','nn-NO');
insert into element_description (element_id, description, description_locale) values ('cloud_type_icao1','Additional cloud information for group HS1/NS1, tells if CB (cumulonimbus) or TCU (towering cumulus) are present. 1 refers to cloud_base_height1.','en-US');
insert into element_description (element_id, description, description_locale) values ('cloud_type_icao1','Tilleggsopplysing for skytype i gruppe HS1/NS1, seier om det er CB (cumulonimbus) eller TCU (towering cumulus). 1 refererer til cloud_base_height1.','nn-NO');
insert into element_description (element_id, description, description_locale) values ('cloud_type_icao1','Tilleggsopplysning for skytype i gruppe HS1/NS1, angir om det er CB (cumulonimbus) eller TCU (towering cumulus).  1 refererer til cloud_base_height1.','nb-NO');
insert into element_description (element_id, description, description_locale) values ('cloud_type_icao2','Additional cloud information for group HS2/NS2, tells if CB (cumulonimbus) or TCU (towering cumulus) are present. 2 refers to cloud_base_height2.','en-US');
insert into element_description (element_id, description, description_locale) values ('cloud_type_icao2','Tilleggsopplysing for skytype i gruppe HS2/NS2, seier om det er CB (cumulonimbus) eller TCU (towering cumulus). 2 refererer til cloud_base_height2.','nn-NO');
insert into element_description (element_id, description, description_locale) values ('cloud_type_icao2','Tilleggsopplysning for skytype i gruppe HS2/NS2, angir om det er CB (cumulonimbus) eller TCU (towering cumulus). 2 refererer til cloud_base_height2.','nb-NO');
insert into element_description (element_id, description, description_locale) values ('cloud_type_icao3','Additional cloud information for group HS3/NS3, tells if CB (cumulonimbus) or TCU (towering cumulus) are present. 3 refers to cloud_base_height3.','en-US');
insert into element_description (element_id, description, description_locale) values ('cloud_type_icao3','Tilleggsopplysing for skytype i gruppe HS3/NS3, seier om det er CB (cumulonimbus) eller TCU (towering cumulus). 3 refererer til cloud_base_height3.','nn-NO');
insert into element_description (element_id, description, description_locale) values ('cloud_type_icao3','Tilleggsopplysning for skytype i gruppe HS3/NS3, angir om det er CB (cumulonimbus) eller TCU (towering cumulus). 3 refererer til cloud_base_height3.','nb-NO');
insert into element_description (element_id, description, description_locale) values ('ice_of_land_origin_type','Mengd av isfjell (navigasjonsfare). WMO-kode 0439.','nn-NO');
insert into element_description (element_id, description, description_locale) values ('ice_of_land_origin_type','Mengde av isfjell (navigasjonsfare). WMO-kode 0439.','nb-NO');
insert into element_description (element_id, description, description_locale) values ('ice_of_land_origin_type','Number of icebergs (navigation hazard). WMO code 0439.','en-US');
insert into element_description (element_id, description, description_locale) values ('icing_rate_type_on_ship','How rapidly ice is building up or melting. WMO code 3551.','en-US');
insert into element_description (element_id, description, description_locale) values ('icing_rate_type_on_ship','Om det er aukande eller minkande ising, og kor fort endringa skjer. WMO-kode 3551.','nn-NO');
insert into element_description (element_id, description, description_locale) values ('icing_rate_type_on_ship','Om det er økende eller minkende ising, og hvor fort endringen skjer. WMO-kode 3551.','nb-NO');
insert into element_description (element_id, description, description_locale) values ('icing_thickness','Ice accretion thickness at observation time','en-US');
insert into element_description (element_id, description, description_locale) values ('icing_thickness','Istjukkleik på fartøy eller plattform ved observasjonstida','nn-NO');
insert into element_description (element_id, description, description_locale) values ('icing_thickness','Istykkelse på fartøy eller plattform ved observasjonstiden','nb-NO');
insert into element_description (element_id, description, description_locale) values ('icing_type_on_ship','Cause of icing on ships (rain, fog, ocean spray etc). WMO code 1751.','en-US');
insert into element_description (element_id, description, description_locale) values ('icing_type_on_ship','Om ising skuldest tåke, regn, sjøsprøyt osb. WMO-kode 1751.','nn-NO');
insert into element_description (element_id, description, description_locale) values ('icing_type_on_ship','Om ising skyldes tåke, regn, sjøsprøyt osv. WMO-kode 1751.','nb-NO');
insert into element_description (element_id, description, description_locale) values ('mean(vessel_speed PT3H)','Fartøyet si middelfart siste tre timar, konvertert frå kodetal','nn-NO');
insert into element_description (element_id, description, description_locale) values ('mean(vessel_speed PT3H)','Fartøyets midlere fart siste tre timer, konvertert fra kodetall','nb-NO');
insert into element_description (element_id, description, description_locale) values ('mean(vessel_speed PT3H)','The vessel''s average speed last three hours, converted from code','en-US');
insert into element_description (element_id, description, description_locale) values ('tendency_of_surface_air_pressure_type','Barometertendensens karakteristikk oppgitt i kodetall (0-8) etter bevegelsesmåten (stigende, synkende, stabilt)','nb-NO');
insert into element_description (element_id, description, description_locale) values ('tendency_of_surface_air_pressure_type','Characteristic of the pressure tendency, given by code 0 - 8, indicating if pressure is rising, falling or steady.','en-US');
insert into element_description (element_id, description, description_locale) values ('tendency_of_surface_air_pressure_type','Karakteristikk på barometertendensen, oppgitt i kodetal (0-8) etter retninga (stigande, synkande, stabilt)','nn-NO');
insert into element_description (element_id, description, description_locale) values ('time_since_deicing_index','Icing index. Time since deicing on wessel.','en-US');
insert into element_description (element_id, description, description_locale) values ('time_since_deicing_index','Isingsindeks. Tiden siden avising på skipet.','nb-NO');
insert into element_description (element_id, description, description_locale) values ('time_since_deicing_index','Isingsindeks. Tida sidan avising på skipet.','nn-NO');

insert into element_description (element_id, description, description_locale) values ('sum_until_day_of_year(preciptation_amount P1D)','Precipitation accumulated from 1 day of year until a certain day of year.','en-US');
insert into element_description (element_id, description, description_locale) values ('sum_until_day_of_year(preciptation_amount P1D)','Nedbør akkumulert fra første dagen i året til en gitt dag i året.','nb-NO');
insert into element_description (element_id, description, description_locale) values ('sum_until_day_of_year(preciptation_amount P1D)','Nedbør akkumulert frå fyrste dag i året til ein dag i året.','nn-NO');

insert into element_description (element_id, description, description_locale) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','Weather symbol described as a combination of cloud cover and weather type.','en-US');
insert into element_description (element_id, description, description_locale) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','Værsymbolet er beregnet fra en kombinasjon av værtype og skydekke.','nb-NO');
insert into element_description (element_id, description, description_locale) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','Vêrsymbolet er utleda frå vêrtype og skydekke.','nn-NO');

--kdvh element
insert into kdvh_element (element_id, elem_code,category,unit) values ('air_temperature_vertical_difference','TA_DELTA','Temperature','ºC');
insert into kdvh_element (element_id, elem_code,category,unit) values ('cloud_type_icao1','CC1','Clouds','code');
insert into kdvh_element (element_id, elem_code,category,unit) values ('cloud_type_icao2','CC2','Clouds','code');
insert into kdvh_element (element_id, elem_code,category,unit) values ('cloud_type_icao3','CC3','Clouds','code');
insert into kdvh_element (element_id, elem_code,category,unit) values ('ice_of_land_origin_type','BI','Sea ice','code');
insert into kdvh_element (element_id, elem_code,category,unit) values ('icing_rate_type_on_ship','RS','Icing','code');
insert into kdvh_element (element_id, elem_code,category,unit) values ('icing_thickness','ES','Icing','cm');
insert into kdvh_element (element_id, elem_code,category,unit) values ('icing_type_on_ship','IZ','Icing','code');
insert into kdvh_element (element_id, elem_code,category,unit) values ('mean(vessel_speed PT3H)','MSPEED','Metadata','m/s');
insert into kdvh_element (element_id, elem_code,category,unit) values ('tendency_of_surface_air_pressure_type','AA','Air pressure','code');
insert into kdvh_element (element_id, elem_code,category,unit) values ('time_since_deicing_index','IK','Icing','Indeks');
insert into kdvh_element (element_id, elem_code,category,unit) values ('sum_until_day_of_year(preciptation_amount P1D)','RR_ACC','Precipitation','mm');

--status
insert into element_status (element_id, status_id) values ('air_temperature_vertical_difference', 'MET-name');
insert into element_status (element_id, status_id) values ('cloud_type_icao1', 'MET-name');
insert into element_status (element_id, status_id) values ('cloud_type_icao2', 'MET-name');
insert into element_status (element_id, status_id) values ('cloud_type_icao3', 'MET-name');
insert into element_status (element_id, status_id) values ('ice_of_land_origin_type', 'MET-name');
insert into element_status (element_id, status_id) values ('icing_rate_type_on_ship', 'MET-name');
insert into element_status (element_id, status_id) values ('icing_thickness', 'MET-name');
insert into element_status (element_id, status_id) values ('icing_type_on_ship', 'MET-name');
insert into element_status (element_id, status_id) values ('mean(vessel_speed PT3H)', 'MET-name');
insert into element_status (element_id, status_id) values ('tendency_of_surface_air_pressure_type', 'MET-name');
insert into element_status (element_id, status_id) values ('time_since_deicing_index', 'MET-name');
insert into element_status (element_id, status_id) values ('sum_until_day_of_year(preciptation_amount P1D)', 'MET-name');
insert into element_status (element_id, status_id) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)', 'MET-name');

--metno element
insert into metno_element (element_id, metno_name) values ('air_temperature_vertical_difference','air_temperature_vertical_difference');
insert into metno_element (element_id, metno_name) values ('cloud_type_icao1','cloud_type_icao1');
insert into metno_element (element_id, metno_name) values ('cloud_type_icao2','cloud_type_icao2');
insert into metno_element (element_id, metno_name) values ('cloud_type_icao3','cloud_type_icao3');
insert into metno_element (element_id, metno_name) values ('ice_of_land_origin_type','ice_of_land_origin_type');
insert into metno_element (element_id, metno_name) values ('icing_rate_type_on_ship','icing_rate_type_on_ship');
insert into metno_element (element_id, metno_name) values ('icing_thickness','icing_thickness');
insert into metno_element (element_id, metno_name) values ('icing_type_on_ship','icing_type_on_ship');
insert into metno_element (element_id, metno_name) values ('mean(vessel_speed PT3H)','mean(vessel_speed PT3H)');
insert into metno_element (element_id, metno_name) values ('tendency_of_surface_air_pressure_type','tendency_of_surface_air_pressure_type');
insert into metno_element (element_id, metno_name) values ('time_since_deicing_index','time_since_deicing_index');
insert into metno_element (element_id, metno_name) values ('sum_until_day_of_year(preciptation_amount P1D)','preciptation_amount');
insert into metno_element (element_id, metno_name) values ('weather_symbol(instant_weather_type cloud_area_fraction PT6H)','instant_weather_type_combined_cloud_area_fraction');

--calculation method

CREATE TABLE calculation_method (
  method_id TEXT NOT NULL,
  description TEXT NOT NULL,
  method_unit TEXT,
  description_locale LOCALE NOT NULL
);

Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum', 'Best estimimate sum values are homogenized sum values. This means a high quality dataset of sums with no kind of breaks in the timeseries.', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum', 'Beste estimimerte sum er homogeniserte sum-verdier. Det betyr et datasett med høy kvalitet hvor alle fysikalske brudd og uregelmessigheter i tidsserien er korrigert slik at den representerer klimatologien mest mulig korrekt.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('number_of_days_gte', 'Counting number of days grater than or equal a threshold.', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit', 'Integral of Y (e.g. air temperature) with respect to time means int Y dt, specifying the limits of the integral for Y as bounds. The temperature deficit is the air temperature threshold minus the air temperature. Its integral with respect to time is often called after its units of "degree-days".', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_excess', 'Integral of Y (e.g. air temperature) with respect to time means int Y dt, specifying the limits of the integral for Y as bounds. The air temperature excess is the air temperature minus the air temperature threshold. Its integral with respect to time is often called after its units of "degree-days".', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('change_over_time', 'Changes in value for the element with respect to time, in the meaning over time span. E.g for 1D changes since yesterday.', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('weather_symbol', 'Weather symbol is a number corresponding to the visualization of the weather as an icon. Weather symbol is derived from a combination of cloud cover (colud_area_fraction) and type of weather (weather_type).', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('weather_symbol', 'Værsymbol er et tall som korresponderer til visualiseringen av været som et ikon. Værsymbolet er avledet av kombinasjonen av skydekke (colud_area_fraction) og værtypen (weather_type).', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('over_time', 'A method to describe the observation of what has happened since last observation, often used for type of weather.', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('over_time', 'En metode for å beskrive været siden forrige observasjon, altså det som har skjedd over tid. Metoden er oftest brukt ved observasjon av værtype.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_sum', 'Beste estimimerte sum er homogeniserte sumverdiar. Det vil seie eit datasett med høg kvalitet der alle fysikalske brot og uregelmessigheiter i tidsserien er korrigerte slik at han representerer klimatologien mest mogleg korrekt.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('weather_symbol', 'Vêrsymbol er eit tal som korresponderer til visualiseringa av vêret som eit ikon. Vêrsymbolet er leidd ut av kombinasjonen av skydekke (colud_area_fraction) og vêrtypen (weather_type).', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('over_time', 'Ein metode for å skildre vêret sidan førre observasjon, altså det som har skjedd over tid. Metoden er oftast brukt ved observasjon av vêrtype.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum_over_undefined_period', 'Summen av verdiar i ein udefinert periode, større eller lik (gte) den perioden som er oppgitt. Det vil seie ein aggregert verdi sidan førre måling vart gjort.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('number_of_days_gte', 'Talet på dagar større enn eller lik ein terskel.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit', 'Integralet av Y (f.eks. lufttemperatur) med omsyn til tid betyr intY dt, der terskelen viser grensene for integralet av Y. Berekninga blir gjort ved å ta lufttemperaturterskelen minus lufttemperaturen og blir integrert med omsyn til tid. Derfor blir eininga som oftast kalla "graddager".', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_excess', 'Integralet av Y (f.eks. lufttemperatur) med omsyn til tid betyr intY dt, der terskelen viser grensene for integralet av Y. Berekninga blir gjort ved å ta lufttemperaturen minus lufttemperaturterskelen og blir integrert med omsyn til tid. Derfor blir eininga som oftast kalla "graddager".', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('change_over_time', 'Endringar i verdi for elementet med omsyn til (over) tid. F.eks. gjeld 1D endringar sidan i går.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction', 'Vektoren "from_direction" (frå-retninga) er brukt i konstruksjonen X_from_direction og viser kva i for retning hastigheitsvektoren X kjem.', 'degrees', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('percent_coverage', 'Prosentvis datadekking av elementet over den gitte perioden.', 'percentage', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean', 'Beste estimerte middelverdiar er homogeniserte middelverdiar. Det vil seie eit datasett med høg kvalitet der alle fysikalske brot og uregelmessigheiter i tidsserien er korrigerte slik at han representerer klimatologien mest mogleg korrekt.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min', 'Minimumsverdien observert eller berekna i den gitte perioden.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max', 'Maksimumsverdien observert eller berekna i den gitte perioden.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean', 'Standard aritmetiske gjennomsnittsverdi for den gitte perioden.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean_k', 'Middelverdi berekna med Koppens formel.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_excess_interpolated', 'Interpolert verdi berekna frå eit rutenett med avleidde punkt-verdiar. Deretter integralet av Y (f.eks. lufttemperatur) med omsyn til tid betyr intY dt, der terskelen viser grensene for integralet av Y. Berekninga blir gjort ved å ta lufttemperaturen minus lufttemperaturenterskelen og blir integrert med omsyn til tid. Derfor blir eininga oftast kalla "graddager".', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum', 'Summen av verdiar i ein periode, det vil seie den aggregerte verdien.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('time_of_event_of_max', 'Datoen og eller klokkeslettet som følger maksimumsverdien for det gitte elementet i den gitte perioden.', 'DATE', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('time_of_event_of_min', 'Datoen og eller klokkeslettet som følger minimumsverdien for det gitte elementet i den gitte perioden.', 'DATE', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction_of_mean', 'Vektoren "from_direction" (frå-retninga) er brukt i konstruksjonen X_from_direction og viser i kva retning hastigheitsvektoren X (her middelverdien) kjem.', 'degrees', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction_of_peak', 'Vektoren "from_direction" (frå-retninga) er brukt i konstruksjonen X_from_direction og viser i kva retning hastigheitsvektoren X (her peak-verdien) kjem.', 'degrees', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction_of_max', 'Vektoren "from_direction" (frå-retninga) er brukt i konstruksjonen X_from_direction og viser i kva retning hastigheitsvektoren X (her maksimums-verdien) kjem.', 'degrees', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('estimated_by_spectral_moments_1', 'Estimat av gjennomsnittleg bølgeperiode for individuelle bølger ved bruk av bølgemoment ved m0/m1', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('directional_spread', 'Retningsvariasjonen (standardavviket)', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('boolean_fair_weather', 'Summen av observasjonstala vil bli eit tall mellom 0 (heilt klart vêr ved alle observasjonane) og 24 (heilt overskya ved alle). Dersom summen er 9 (maks 24 ved heilt overskya) eller mindre og ikkje høgare enn 4 ved nokon enkeltobservasjon, blir dagen rekna for å vere ein penvêrsdag(=1), eller 0.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('boolean_clear_sky_weather', 'Summen av observasjonstala vil bli eit tal mellom 0 (heilt klart vêr ved alle observasjonane) og 24 (heilt overskya ved alle). Dersom summen er 4 (maks 24 ved heilt overskya) eller mindre, vert dagen rekna for å vere ein klarvêrsdag.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('boolean_overcast_weather', 'Summen av observasjonstala vil bli eit tal mellom 0 (heilt klart vêr ved alle observasjonane) og 24 (heilt overskya ved alle). Dersom summen er 20 eller høgare, vert dagen rekna for å vere ein overskya dag.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum_until_day_of_year', 'Summen av verdiar sidan 1.januar, det vil seie den aggregerte verdien til ein dato i året.', 'nn-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum_until_day_of_year', 'The arithmetic sum of datavalues in the period since 1. January to a day in the year.', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum_until_day_of_year', 'Summen av verdier i perioden siden 1. januar, det vil si den aggregerte verdien til en dag i året.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction', 'The vector "from_direction" is used in the construction X_from_direction and indicates the direction from which the velocity vector of X is coming.', 'degrees', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum_over_undefined_period', 'The arithmetic sum of datavalues in an undefined period, greater than or equal (gte) the timeperiod given. That means an aggregated value since the last measurement.', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum_over_undefined_period', 'Summen av verdier i en udefinert periode, større eller lik (gte) den perioden som er oppgitt. Det vil si en aggregerte verdi siden forrige måling ble tatt.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('percent_coverage', 'Percentage datacoverage of the element over the given period', 'percentage', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean', 'Best estimimate means are homogenized mean values. That means a high quality dataset of mean values with no kind of breaks during the timeserie.', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min', 'Minimum value observed or calculated in the given period', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max', 'Maximum value observed or calculated in the given period', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean', 'Standard arithmetic mean value for the given period', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean_k', 'Mean value calculated with Køppens formula.', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_excess_interpolated', 'Interpolated value calculated as grid with derived point-values. Integral of Y (e.g. air temperature) with respect to time means int Y dt, specifying the limits of the integral for Y as bounds. The air temperature excess is the air temperature minus the air temperature threshold. Its integral with respect to time is often called after its units of "degree-days".', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('number_of_days_gte', 'Antall dager større enn eller lik en terskel.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_deficit', 'Integralet av Y (f.eks lufttemperatur) med hensyn til tid betyr intY dt, hvor terskelen angir grensene for integralet av Y. Beregningen gjøres ved å ta lufttemperaturterskelen minus lufttemperaturen og integrereres med hensyn til tid, derfor kalles enheten oftest "graddager".', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_excess', 'Integralet av Y (f.eks lufttemperatur) med hensyn til tid betyr intY dt, hvor terskelen angir grensene for integralet av Y. Beregningen gjøres ved å ta lufttemperaturen minus lufttemperaturenterskelen og integreres med hensyn til tid, derfor kalles enheten oftest "graddager".', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('change_over_time', 'Endringer i verdi for elementet med hensyn til (over) tid. F.eks for 1D gjelder endringer siden i går.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction', 'Vektoren "from_direction" (fra-retningen) er brukt i konstruksjonen X_from_direction og angir hvilken retning hastighetsvektoren X kommer.', 'degrees', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('percent_coverage', 'Prosentvis datadekning av elementet over den gitte perioden.', 'percentage', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('best_estimate_mean', 'Beste estimerte middelverdier er homogeniserte middelverider. Det betyr et datasett med høy kvalitet hvor alle fysikalske brudd og uregelmessigheter i tidsserien er korrigert slik at den representerer klimatologien mest mulig korrekt.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('min', 'Minimumsverdien observert eller beregnet i den gitte perioden.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('max', 'Maksimumsverdien observert eller beregnet i den gitte perioden.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean', 'Standard aritmetiske gjennomsnittsverdi for den gitte perioden.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('mean_k', 'Middelverdi beregnet med Koppens formel.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('integral_of_excess_interpolated', 'Interpolert verdi beregnet fra et rutenett med avledede punkt-verdier. Deretter integralet av Y (f.eks lufttemperatur) med hensyn til tid betyr intY dt, hvor terskelen angir grensene for integralet av Y. Beregningen gjøres ved å ta lufttemperaturen minus lufttemperaturenterskelen og integreres med hensyn til tid, derfor kalles enheten oftest "graddager".', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum', 'The arithmetic sum of datavalues in a given period.', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('sum', 'Summen av verdier i en periode, det vil si den aggregerte verdien.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('time_of_event_of_max', 'The time or date for the maximum value of the given element in the given period.', 'DATE', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('time_of_event_of_min', 'The time or date for the minimum value of the given element in the given period.', 'DATE', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('time_of_event_of_max', 'Dato og eller klokkeslettet som følger maksimums verdien for det gitte element i den gitte perioden.', 'DATE', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('time_of_event_of_min', 'Dato og eller klokkeslettet som følger minimums verdien for det gitte element i den gitte perioden.', 'DATE', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction_of_mean', 'The vector "from_direction" is used in the construction X_from_direction and indicates the direction from which the velocity vector of X (here the mean value) is coming.', 'degrees', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction_of_mean', 'Vektoren "from_direction" (fra-retningen) er brukt i konstruksjonen X_from_direction og angir hvilken retning hastighetsvektoren X (her middelverdien) kommer.', 'degrees', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction_of_peak', 'The vector "from_direction" is used in the construction X_from_direction and indicates the direction from which the velocity vector of X (here the peak value) is coming.', 'degrees', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction_of_peak', 'Vektoren "from_direction" (fra-retningen) er brukt i konstruksjonen X_from_direction og angir hvilken retning hastighetsvektoren X (her peak-verdien) kommer.', 'degrees', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction_of_max', 'The vector "from_direction" is used in the construction X_from_direction and indicates the direction from which the velocity vector of X (here the max value) is coming.', 'degrees', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, METHOD_UNIT, DESCRIPTION_LOCALE)
 Values
   ('from_direction_of_max', 'Vektoren "from_direction" (fra-retningen) er brukt i konstruksjonen X_from_direction og angir hvilken retning hastighetsvektoren X (her maksimums-verdien) kommer.', 'degrees', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('estimated_by_spectral_moments_1', 'Estimate of the average period of individual waves using moments using m0/m1', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('estimated_by_spectral_moments_1', 'Estimat av gjennomsnittleg bølgeperiode for individuelle bølger ved bruk av bølgemomenter ved m0/m1', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('directional_spread', 'Directional spread (standard deviation).', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('directional_spread', 'Retningsvariasjonen (standardavviket)', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('boolean_fair_weather', 'The sum of the cloud cover observations at 06 and 12 UTC where no single values above 4, (and at 18 utc is 9 or lower?). The sum should be below 9 (max 24 if all overcast), then it is fair weather and boolean is true, that means 1, else 0 (false).', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('boolean_fair_weather', 'Summen av observasjonstallene vil bli et tall mellom 0 (helt klart vær ved alle observasjonene) og 24 (helt overskyet ved alle). Dersom summen er 9 (maks 24 ved helt overskyet) eller mindre og ikke høyere enn 4 ved noen enkelt observasjon, betegnes dagen som en penværsdag(=1), ellers 0.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('boolean_clear_sky_weather', 'Summen av observasjonstallene vil bli et tall mellom 0 (helt klart vær ved alle observasjonene) og 24 (helt overskyet ved alle). Dersom summen er 4 (maks 24 ved helt overskyet) eller mindre, betegnes dagen som en klarværsdag.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('boolean_clear_sky_weather', 'The sum of the cloud cover observations at 06, 12 and 18 UTC. The sum should be below 4 (max 24 if all overcast), then it is clear sky weather and boolean is true, that means 1, else 0 (false).', 'en-US');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('boolean_overcast_weather', 'Summen av observasjonstallene vil bli et tall mellom 0 (helt klart vær ved alle observasjonene) og 24 (helt overskyet ved alle). Dersom summen er 20 eller høyere, betegnes dagen som en overskyet dag.', 'nb-NO');
Insert into calculation_method
   (METHOD_ID, DESCRIPTION, DESCRIPTION_LOCALE)
 Values
   ('boolean_overcast_weather', 'The sum of the cloud cover observations at 06, 12 and 18 UTC. The sum should be 20 or more (max 24 if all overcast), then it is overcast weather and boolean is true, that means 1, else 0 (false).', 'en-US');

# --- !Downs

