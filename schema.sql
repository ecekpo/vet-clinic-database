/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial primary key NOT NULL,
    name varchar(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species text
);



//Creating a table named owners
CREATE TABLE Owners (
    id serial PRIMARY KEY,
    full_name varchar(255) NOT NULL,
    age INTEGER
);

// Creating a table named species
CREATE TABLE Species (
    id serial PRIMARY KEY,
    name varchar(255) NOT NULL
);

