# --- !Ups

CREATE TYPE LOCALE AS ENUM ('en-US', 'nb-NO', 'nn-NO');

CREATE TABLE element (
  id TEXT NOT NULL,
  unit TEXT NOT NULL
);

CREATE TABLE element_name (
  element_id TEXT NOT NULL,
  name TEXT NOT NULL,
  name_locale LOCALE NOT NULL
);

CREATE TABLE element_description (
  element_id TEXT NOT NULL,
  description TEXT NOT NULL,
  description_locale LOCALE NOT NULL
);

CREATE TABLE element_codetable (
  element_id TEXT NOT NULL,
  codetable_name TEXT NOT NULL
);

CREATE TABLE codetable (
  id TEXT NOT NULL
);

CREATE TABLE codetable_description (
  codetable_id TEXT NOT NULL,
  description TEXT NOT NULL,
  additional_info TEXT,
  description_locale LOCALE NOT NULL
);

CREATE TABLE codetable_entry (
  codetable_id TEXT NOT NULL,
  value TEXT NOT NULL,
  meaning TEXT NOT NULL,
  additional_info TEXT,
  meaning_locale LOCALE NOT NULL
);

CREATE TABLE cf_element (
  standard_name TEXT NOT NULL,
  cell_method TEXT,
  unit TEXT NOT NULL,
  status TEXT NOT NULL,
  element_id TEXT NOT NULL
);

CREATE TABLE kdvh_element (
  elem_code TEXT NOT NULL,
  unit TEXT NOT NULL,
  category TEXT NOT NULL,
  element_id TEXT NOT NULL
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

CREATE VIEW get_elements_v AS
SELECT
  t1.id AS id,
  t2.name AS name,
  t3.description AS description,
  t1.unit AS unit,
  t4.codetable_name AS codetable,
  t3.description_locale AS locale,
  ARRAY_AGG(t5.elem_code) AS legacyMetNoConvention_elemcodes,
  min(t5.category) AS legacyMetNoConvention_category,
  min(t5.unit) AS legacyMetNoConvention_unit,
  t6.standard_name AS cfConvention_standardname,
  t6.cell_method AS cfConvention_cellmethod,
  t6.unit AS cfConvention_unit,
  t6.status AS cfConvention_status 
FROM
  (((element t1 LEFT OUTER JOIN 
   (element_name t2 LEFT OUTER JOIN element_description t3 ON (t2.element_id = t3.element_id AND t2.name_locale = t3.description_locale))
   ON t1.id = t2.element_id) 
   LEFT OUTER JOIN element_codetable t4 ON (t1.id = t4.element_id))
   LEFT OUTER JOIN kdvh_element t5 ON (t1.id = t5.element_id))
   LEFT OUTER JOIN cf_element t6 ON (t1.id = t6.element_id)
GROUP BY
  t1.id, t2.name, t3.description, t1.unit, t4.codetable_name, t3.description_locale, t6.standard_name, t6.cell_method, t6.unit, t6.status
ORDER BY
  id, legacyMetNoConvention_elemcodes, cfConvention_standardname, name, unit;


# --- !Downs

DROP VIEW IF EXISTS get_elements_v;
DROP TABLE IF EXISTS element_kdvh_xref_v;
DROP TABLE IF EXISTS kdvh_element;
DROP TABLE IF EXISTS codetable_entry;
DROP TABLE IF EXISTS codetable;
DROP TABLE IF EXISTS cf_element;
DROP TABLE IF EXISTS element_codetable;
DROP TABLE IF EXISTS element_comment;
DROP TABLE IF EXISTS element_description;
DROP TABLE IF EXISTS element;
DROP TYPE IF EXISTS locale;
