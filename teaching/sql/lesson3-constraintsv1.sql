-- Basic setup
CREATE TABLE students (
  name varchar(40),
  favourite_subject varchar(40)
);

INSERT INTO students VALUES ('jozko', 'vlastiveda');
INSERT INTO students VALUES ('ferko', 'dejepis');
INSERT INTO students VALUES ('dezko', 'prirodopis');

-- Rest

ALTER TABLE students ADD COLUMN thesis_rating integer, ADD COLUMN thesis varchar(10000);

UPDATE students SET thesis_rating = 5, thesis='Kde bolo tam bolo...' WHERE name = 'jozko';
UPDATE students SET thesis_rating = 1, thesis='Kde bolo tam bolo...' WHERE name = 'ferko';
UPDATE students SET thesis_rating = 2, thesis='12345678' WHERE name = 'dezko';

ALTER TABLE students ADD UNIQUE(thesis);

-- SELECT * FROM students
