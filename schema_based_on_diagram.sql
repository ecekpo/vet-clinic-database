//Database schema based on a given diagram

CREATE TABLE patients (
    id serial primary key NOT NULL,
    name varchar,
    date_of_birth date
);

CREATE TABLE medical_histories (
    id serial primary key NOT NULL,
    admitted_at timestamp,
    patient_id int,
    status varchar ,
    PRIMARY KEY(id),
    CONSTRAINT fk_patient,
      FOREIGN KEY(id) ,
	  REFERENCES patient(patient_id)
);

CREATE TABLE treatments (
    id serial primary key NOT NULL,
    type varchar,
    name varchar 
    CONSTRAINT fk_patient
    FOREIGN KEY(id) REFERENCES medical_histories(id)
);

CREATE TABLE invoices (
    id serial primary key NOT NULL,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int
    date_of_birth date 
    CONSTRAINT fk_invoice,
    FOREIGN KEY(id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id serial primary key NOT NULL,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int 
    CONSTRAINT fk_invoice
    FOREIGN KEY(id) REFERENCES invoice_id(id)
    FOREIGN KEY(id) REFERENCES treatments(id)
);