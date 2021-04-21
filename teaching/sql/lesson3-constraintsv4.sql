-- Basic setup
CREATE TABLE students (
  name varchar(40),
  favourite_subject varchar(40)
);

INSERT INTO students VALUES ('jozko', 'vlastiveda');
INSERT INTO students VALUES ('ferko', 'dejepis');
INSERT INTO students VALUES ('dezko', 'prirodopis');

-- Rest

DELETE FROM students;

ALTER TABLE students ADD COLUMN id SERIAL PRIMARY KEY;

INSERT INTO students (name,favourite_subject) VALUES ('jozko', 'vlastiveda');
INSERT INTO students (name,favourite_subject) VALUES ('ferko', 'dejepis');
INSERT INTO students (name,favourite_subject) VALUES ('dezko', 'prirodopis');

CREATE TABLE thesis (
  student_id serial UNIQUE,
  thesis_rating integer,
  thesis varchar(1000) UNIQUE,
  CONSTRAINT fk_student FOREIGN KEY(student_id) REFERENCES students(id)
);

INSERT INTO thesis VALUES (1, 5 ,'Kde bolo, tam bolo2...');
INSERT INTO thesis VALUES (2, 1 ,'Kde bolo, tam bolo...');
INSERT INTO thesis VALUES (3, 1 ,'12345678');

-- SELECT * FROM students JOIN thesis ON students.name = thesis.student;
