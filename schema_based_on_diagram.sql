//Database schema based on a given diagram

CREATE TABLE medical_histories (
    id serial primary key NOT NULL,
    admitted_at timestamp,
    patient_id int,
    status varchar 
);


CREATE TABLE patients (
    id serial primary key NOT NULL,
    name varchar,
    date_of_birth date
);



CREATE TABLE treatments (
    id serial primary key NOT NULL,
    type varchar,
    name varchar 
);


CREATE TABLE invoices (
    id serial primary key NOT NULL,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int
    date_of_birth date 
);


CREATE TABLE invoice_items (
    id serial primary key NOT NULL,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int 
);