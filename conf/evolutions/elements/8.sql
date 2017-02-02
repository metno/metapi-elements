# --- !Ups

UPDATE cf_element SET cell_method=NULL WHERE cell_method='boolean_fair_weather';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='time_of_event_of_max';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='boolean_overcast_weather';
UPDATE cf_element SET cell_method='time: sum (best estimate)' WHERE cell_method='best_estimate_sum';
UPDATE cf_element SET cell_method='time: mean' WHERE cell_method='mean_k';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='from_direction_of_max';
UPDATE cf_element SET cell_method='time: maximum' WHERE cell_method='max';
UPDATE cf_element SET cell_method='time: sum' WHERE cell_method='sum';
UPDATE cf_element SET cell_method='time: minimum' WHERE cell_method='min';
UPDATE cf_element SET cell_method='time: sum (estimated by spectral moments)' WHERE cell_method='estimated_by_spectral_moments_1';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='integral_of_excess_interpolated';
UPDATE cf_element SET cell_method='time: mean (best estimate)' WHERE cell_method='best_estimate_mean';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='integral_of_excess';
UPDATE cf_element SET cell_method='time: sum (unknown period)' WHERE cell_method='sum_over_undefined_period';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='change_over_time';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='integral_of_deficit';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='time_of_event_of_min';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='boolean_clear_sky_weather';
UPDATE cf_element SET cell_method=NULL WHERE cell_method='number_of_days_gte';
UPDATE cf_element SET cell_method='time: mean' WHERE cell_method='mean';

ALTER TABLE cf_element ALTER COLUMN standard_name DROP NOT NULL;

UPDATE cf_element SET standard_name=NULL WHERE element_id like 'boolean_fair_weather%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'time_of_event_of_max%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'boolean_overcast_weather%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'from_direction_of_max%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'integral_of_excess_interpolated%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'integral_of_excess%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'change_over_time%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'integral_of_deficit%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'time_of_event_of_min%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'boolean_clear_sky_weather%';
UPDATE cf_element SET standard_name=NULL WHERE element_id like 'number_of_days_gte%';

UPDATE cf_element SET status='37';


# --- !Downs
