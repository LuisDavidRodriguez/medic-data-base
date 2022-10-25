-- CREATE TABLE patients (
--   id INT GENERATED ALWAYS AS IDENTITY,
--   name varchar(30) NOT NULL DEFAULT 0,
--   date_of_birth date,
--   PRIMARY KEY (id)
-- );

-- CREATE TABLE medical_histories(
--   id INT GENERATED ALWAYS AS IDENTITY,
--   admitted_at TIMESTAMP WITH TIME ZONE,
--   patient_id INT,
--   status varchar(30),
--   PRIMARY KEY (id)
-- );

/* Add consraint many to one with medical_histories and patients */
-- ALTER TABLE medical_histories
-- ADD CONSTRAINT fk_medical_patients
-- FOREIGN KEY (patient_id)
-- REFERENCES patients(id)
-- ON DELETE CASCADE;

/* CREATE TABLE INVOICES WITH RELATION ONE TO ONE WITH medical_histories */
-- CREATE TABLE invoices(
--   id INT GENERATED ALWAYS AS IDENTITY,
--   total_amount FLOAT NOT NULL DEFAULT 0,
--   generated_at TIMESTAMP WITH TIME ZONE,
--   payed_at TIMESTAMP WITH TIME ZONE,
--   medical_history_id INT,
--   PRIMARY KEY (id),
--   CONSTRAINT fk_medical_histories
--     FOREIGN KEY(medical_history_id)
--       REFERENCES medical_histories(id)
--       ON DELETE CASCADE
-- );

/* Create invoise_items joint table many to many, many to one between invoices */
-- CREATE TABLE invoice_items (
--   id INT GENERATED ALWAYS AS IDENTITY,
--   unit_price FLOAT NOT NULL DEFAULT 0,
--   quantity INT NOT NULL DEFAULT 0,
--   total_price FLOAT NOT NULL DEFAULT 0,
--   invoice_id INT,
--   treatment_id INT,
--   PRIMARY KEY(id),
--   CONSTRAINT fk_invoices
--     FOREIGN KEY (invoice_id)
--       REFERENCES invoices(id)
--       ON DELETE CASCADE
-- );


/* Create treatments */
-- CREATE TABLE treatments(
--   id INT GENERATED ALWAYS AS IDENTITY,
--   type VARCHAR(50),
--   name VARCHAR(30),
--   PRIMARY KEY (id)
-- );

/* Add to invoice_items constrain relation many to one treatments */
-- ALTER TABLE invoice_items
-- ADD CONSTRAINT fk_treatments
-- FOREIGN KEY (treatment_id)
-- REFERENCES treatments(id)
-- ON DELETE CASCADE;

/* CREATE join table many to many between treatments and medical_histories */
-- CREATE TABLE join_treatments_histories(
--   treatments_id INT,
--   medical_histories_id INT,
--   PRIMARY KEY(treatments_id, medical_histories_id),
--   CONSTRAINT fk_treatments
--     FOREIGN KEY (treatments_id)
--       REFERENCES treatments(id)
--       ON DELETE CASCADE
-- );

/* ADD CONSTRAIN FOREIGN KEY */
-- ALTER TABLE join_treatments_histories
-- ADD CONSTRAINT fk_histories
-- FOREIGN KEY (medical_histories_id)
-- REFERENCES medical_histories(id)
-- ON DELETE CASCADE;

-- ALTER TABLE invoices
-- ADD UNIQUE(medical_history_id);

/*Create indexes FOREIGN KEYS */
-- CREATE INDEX patient_id_asc ON medical_histories(patient_id ASC);
-- CREATE INDEX medical_history_id_asc ON invoices(medical_history_id ASC);
-- CREATE INDEX invoice_asc ON invoice_items(invoice_id ASC);
-- CREATE INDEX treatment_id_asc ON invoice_items(treatment_id ASC);


