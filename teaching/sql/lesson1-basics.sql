
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

-- SELECT * FROM users
-- SELECT city FROM users

UPDATE users SET location = 'Kysucke nove mesto' WHERE name = 'bruno';

-- SELECT DISTINCT city from users;
-- SELECT * FROM users WHERE location = 'Brno';
-- SELECT * FROM users WHERE location = 'Brno' AND origin = 'Modra';
-- SELECT * FROM users WHERE location = 'Brno' AND (origin = 'Modra' OR origin = 'Žilina');

ALTER TABLE users ADD COLUMN hasJob boolean;
UPDATE users SET hasJob = true;
UPDATE users SET hasJob = false WHERE name = 'samo';

-- SELECT * FROM users
-- SELECT * FROM users ORDER BY name ASC

DELETE FROM users WHERE hasJob = false;
DELETE FROM users WHERE NOT hasJob;

-- todo explain difference here
-- DELETE FROM users;

DROP TABLE users;
