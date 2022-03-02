-- psql < medical _center.sql
DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center


CREATE TABLE doctor (
id SERIAL PRIMARY KEY,
d_name TEXT NOT NULL
);


CREATE TABLE patient(
id SERIAL PRIMARY KEY,
p_name TEXT NOT NULL,
insurance TEXT
);

CREATE TABLE visits(
id SERIAL PRIMARY KEY,
doctor_id INTEGER REFERENCES doctor,
patient_id INTEGER REFERENCES patient
);

CREATE TABLE disease(
id SERIAL PRIMARY KEY,
d_name TEXT NOT NULL
);

CREATE TABLE diagnoses(
id SERIAL PRIMARY KEY,
visit_id INTEGER REFERENCES visits,
desease_id INTEGER REFERENCES disease,
notes TEXT
);



INSERT INTO doctor
(d_name)
VALUES
('Steven'), ('jacoby'), ('sarah');

INSERT INTO patient
(p_name)
VALUES
('stevan'), ('lilly'), ('johhny');

INSERT INTO visits
(doctor_id, patient_id)
VALUES
(1,2),(2,1),(3,3),(1,1);


INSERT INTO disease
(d_name)
VALUES
('covid'), ('flu'), ('death');

INSERT INTO diagnoses
(visit_id,desease_id,notes)
VALUES
(1,3,'she died'),(2,1,'He got the vid'),(3,2,'Just a normal flu');

