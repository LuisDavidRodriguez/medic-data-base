CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(30) NOT NULL DEFAULT 0,
  date_of_birth date,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP WITH TIME ZONE,
  patient_id INT,
  status varchar(30),
  PRIMARY KEY (id)
);

/* Add consraint many to one with medical_histories and patients */
ALTER TABLE medical_histories
ADD CONSTRAINT fk_medical_patients
FOREIGN KEY (patient_id)
REFERENCES patients(id)
ON DELETE CASCADE;

/* CREATE TABLE INVOICES WITH RELATION ONE TO ONE WITH medical_histories */
CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount FLOAT NOT NULL DEFAULT 0,
  generated_at TIMESTAMP WITH TIME ZONE,
  payed_at TIMESTAMP WITH TIME ZONE,
  medical_history_id INT,
  PRIMARY KEY (id),
  CONSTRAINT fk_medical_histories
    FOREIGN KEY(medical_history_id)
      REFERENCES medical_histories(id)
      ON DELETE CASCADE
);
