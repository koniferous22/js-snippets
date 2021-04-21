CREATE TABLE cartoon_characters(
	id SERIAL PRIMARY KEY,
  	first_name VARCHAR(40),
  	last_name VARCHAR(40),
  	father_id INTEGER,
  	CONSTRAINT fk_father FOREIGN KEY (father_id) REFERENCES cartoon_characters(id)
);

INSERT INTO cartoon_characters (first_name, last_name) VALUES ('Homer','simpson');
INSERT INTO cartoon_characters (first_name, last_name) VALUES ('Marge','simpson');
INSERT INTO cartoon_characters (first_name, last_name, father_id) VALUES ('Bart','simpson', 1);
INSERT INTO cartoon_characters (first_name, last_name, father_id) VALUES ('Lisa','simpson', 1);
INSERT INTO cartoon_characters (first_name, last_name, father_id) VALUES ('Maggie','simpson', 1);
INSERT INTO cartoon_characters (first_name, last_name) VALUES ('Peter','griffin');
INSERT INTO cartoon_characters (first_name, last_name) VALUES ('Lois','griffin');
INSERT INTO cartoon_characters (first_name, last_name, father_id) VALUES ('Stewie','griffin', 6);
INSERT INTO cartoon_characters (first_name, last_name, father_id) VALUES ('Meg','griffin', 6);
INSERT INTO cartoon_characters (first_name, last_name, father_id) VALUES ('Chris','griffin', 6);

