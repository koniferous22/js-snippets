CREATE TABLE roommates(
    id integer,
  name varchar(40),
  location varchar(255),
  origin varchar(255)
);
INSERT INTO roommates VALUES (1, 'adam', 'Brno', 'Poprad');
INSERT INTO roommates (id, name, location, origin) VALUES (2, 'vinco', 'Brno', 'Modra');
INSERT INTO roommates (id, name, location, origin) VALUES (3, 'petra', 'Brno', 'Modra');
INSERT INTO roommates (id, name, location, origin) VALUES (4, 'bruno', 'Brno', 'Žilina');
INSERT INTO roommates (id, name, location, origin) VALUES (5, 'samuel', 'Brno', 'Žilina');
INSERT INTO roommates (id, name, location, origin) VALUES (6, 'matus', 'Brno', 'Prešov');
UPDATE roommates SET location='Kysucké Nové Mesto' WHERE name='bruno';
ALTER TABLE roommates ADD COLUMN hasJob boolean;
UPDATE roommates set hasJob=true;
UPDATE roommates set hasJob=false WHERE name='samo';

CREATE TABLE name_days(
	name varchar(40),
    month integer,
  	day_in_month integer
);
INSERT INTO name_days VALUES ('samuel', 26, 8);
INSERT INTO name_days VALUES ('matus', 21, 9);
INSERT INTO name_days VALUES ('bruno', 10, 3);
INSERT INTO name_days VALUES ('vinco', 21, 2);
INSERT INTO name_days VALUES ('petra', 29, 6);
-- note: value just used for demonstrating missing values in both relations
INSERT INTO name_days VALUES ('martin', 11, 11);

-- Queries: 

-- SELECT * FROM roommates JOIN name_days
-- SELECT * FROM roommates JOIN name_days ON roommates.name = name_days.name
-- SELECT * FROM roommates JOIN name_days USING(name);
-- SELECT * FROM roommates LEFT JOIN name_days USING(name);
-- SELECT * FROM roommates FULL OUTER JOIN name_days USING(name);
