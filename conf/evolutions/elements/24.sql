# --- !Ups

DROP VIEW IF EXISTS get_elements_v;
CREATE VIEW get_elements_v AS
 SELECT t1.id,
    t2.name,
    t3.description,
    t1.unit,
    t4.codetable_name AS codetable,
    t3.description_locale AS locale,
    array_agg(t5.elem_code) AS legacymetnoconvention_elemcodes,
    min(t5.unit) AS legacymetnoconvention_unit,
    t6.standard_name AS cfconvention_basename,
    t6.cell_method AS cfconvention_cellmethod,
    t6.unit AS cfconvention_unit,
    t6.status AS cfconvention_status,
    t7.status_id AS status,
    t8.category,
    t9.metno_name AS basename
   FROM element t1
     LEFT JOIN (element_name t2
     LEFT JOIN element_description t3 ON t2.element_id = t3.element_id AND t2.name_locale = t3.description_locale) ON t1.id = t2.element_id
     LEFT JOIN element_codetable t4 ON t1.id = t4.element_id
     LEFT JOIN kdvh_element t5 ON t1.id = t5.element_id
     LEFT JOIN cf_element t6 ON t1.id = t6.element_id
     LEFT JOIN element_status t7 ON t1.id = t7.element_id
     LEFT JOIN element_category t8 ON t1.id = t8.element_id AND t3.description_locale = t8.category_locale
     LEFT JOIN metno_element t9 ON t1.id = t9.element_id
  GROUP BY t1.id, t2.name, t3.description, t1.unit, t4.codetable_name, t3.description_locale, t6.standard_name, t6.cell_method, t6.unit, t6.status,
     t7.status_id, t8.category, t9.metno_name
  ORDER BY t1.id, array_agg(t5.elem_code), t6.standard_name, t2.name, t1.unit;

# --- !Downs
