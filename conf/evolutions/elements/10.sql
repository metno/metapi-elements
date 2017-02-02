# --- !Ups

-- Remove old, wrong entries
delete from cf_element where element_id='max(relative_humidity T24H)' and cell_method='time: mean';
delete from cf_element where element_id='min(relative_humidity T24H)' and cell_method='time: mean';

# --- !Downs
