# --- !Ups

ALTER TABLE timeoffset ADD PRIMARY KEY (id);

DELETE FROM element_timeoffset WHERE element_id='sum(precipitation_amount P1M)';
INSERT INTO element_timeoffset VALUES('sum(precipitation_amount P1M)','{''PT06H'',''PT18H''}');
ALTER TABLE element_timeoffset ADD PRIMARY KEY (element_id);

DELETE FROM element_timeoffset WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 0.0)';
DELETE FROM element_timeoffset WHERE element_id='integral_of_excess(mean(air_temperature PT1H) P1D 5.0)';
ALTER TABLE element_timeoffset ADD FOREIGN KEY (element_id) REFERENCES element(id) ON UPDATE CASCADE ON DELETE CASCADE;

# --- !Downs
