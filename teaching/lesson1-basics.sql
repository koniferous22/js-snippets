
CREATE TABLE users (
    id          integer,
  	name        varchar(40),
	location    varchar(1000),
    origin      varchar(1000)
);

INSERT INTO users (id, name, location, origin) VALUES (1, 'adam', 'Brno', 'Poprad');
INSERT INTO users (id, name, location, origin) VALUES (2, 'vinco', 'Brno', 'Modra');
INSERT INTO users (id, name, location, origin) VALUES (3, 'petra', 'Brno', 'Modra');
INSERT INTO users (id, name, location, origin) VALUES (4, 'bruno', 'Brno', 'Žilina');
INSERT INTO users (id, name, location, origin) VALUES (5, 'samo', 'Brno', 'Žilina');
INSERT INTO users (id, name, location, origin) VALUES (6, 'matus', 'Brno', 'Prešov');

UPDATE users SET location = 'Kysucke nove mesto' WHERE name = 'bruno';

ALTER TABLE users ADD COLUMN hasJob boolean;
UPDATE users SET hasJob = true;
UPDATE users SET hasJob = false WHERE name = 'samo';

DELETE FROM users WHERE hasJob = false;
DELETE FROM users WHERE NOT hasJob;

DROP TABLE users;
