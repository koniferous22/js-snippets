CREATE TABLE bible_character(
	id serial PRIMARY KEY,
  	name varchar(100)
);

INSERT INTO bible_character (name) VALUES ('adam');
INSERT INTO bible_character (name) VALUES ('eva');
INSERT INTO bible_character (name) VALUES ('kain');
INSERT INTO bible_character (name) VALUES ('abel');

CREATE TABLE dislike_relation(
  	source_id integer,
  	dest_id integer,
  	CONSTRAINT fk_src FOREIGN KEY(source_id) REFERENCES bible_character(id),
  	CONSTRAINT fk_dest FOREIGN KEY(dest_id) REFERENCES bible_character(id)
);

INSERT INTO dislike_relation VALUES (3,4);

-- SELECT * FROM dislike_relation JOIN bible_character ON dislike_relation.source_id = bible_character.id

