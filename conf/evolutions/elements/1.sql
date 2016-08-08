# --- !Ups

CREATE TYPE locale AS ENUM ('en-US', 'nb-NO', 'nn-NO');

CREATE TABLE element (
  name TEXT NOT NULL,
  timespan INTERVAL NOT NULL,
  unit TEXT NOT NULL, 
  cf_standard_name TEXT,
  cf_cell_method TEXT
);

CREATE TABLE element_description (
  element_name TEXT NOT NULL,
  description TEXT NOT NULL,
  description_locale LOCALE NOT NULL
);

CREATE TABLE element_comment (
  element_name TEXT NOT NULL,
  comment TEXT NOT NULL,
  comment_locale LOCALE NOT NULL
);

CREATE TABLE code_table (
  name TEXT NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE code_table_entry (
  code_table_name TEXT NOT NULL,
  entry TEXT NOT NULL,
  meaning TEXT NOT NULL,
  meaning_locale LOCALE NOT NULL
);

CREATE TABLE kdvh_element (
  code TEXT NOT NULL,        --The original element code, coming from the elem-table
  unit TEXT NOT NULL,
  table_name TEXT NOT NULL,
  element_name TEXT NOT NULL
);

CREATE TABLE kdvh_time_series (
  id SERIAL NOT NULL,
  source_id TEXT NOT NULL, -- STATION_NR and SENSOR_NR
  kdvh_element_code TEXT NOT NULL,
  from_date DATE NOT NULL, -- From DATE: for first observation
  to_date DATE NOT NULL, -- TO DATE: for last observation, Infinity if still observing.
  performance_category TEXT NOT NULL,
  exposure_category TEXT NOT NULL,
  kdvh_data_table TEXT NOT NULL, -- The name of the datatable to find the data in.
  kdvh_flag_table TEXT NOT NULL,
  public_access BOOLEAN NOT NULL,
  update_time TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE VIEW element_kdvh_xref_v AS
SELECT
  element.name AS element_name,
  element.unit AS element_unit,
  element_description.description AS element_description,
  element_description.description_locale AS element_description_locale,
  element.cf_standard_name AS cf_standard_name,
  element.cf_cell_method AS cf_cell_method,
  element.unit AS cf_unit,
  kdvh_element.code AS kdvh_code,
  kdvh_element.unit AS kdvh_unit,
  kdvh_element.table_name AS kdvh_table
FROM
  (element LEFT OUTER JOIN element_description ON (element.name = element_description.element_name))
    LEFT OUTER JOIN kdvh_element ON (element.name = kdvh_element.element_name);

# --- !Downs

DROP VIEW IF EXISTS element_kdvh_xref_v;
DROP TABLE IF EXISTS element_kdvh_xref_v;
DROP TABLE IF EXISTS kdvh_element;
DROP TABLE IF EXISTS code_table_entry;
DROP TABLE IF EXISTS code_table;
DROP TABLE IF EXISTS element_comment;
DROP TABLE IF EXISTS element_description;
DROP TABLE IF EXISTS element;
DROP TYPE IF EXISTS locale;
 