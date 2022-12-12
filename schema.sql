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

//Modifying animals table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD owner_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners (id);

//Table created for vets
CREATE TABLE vets(
    id serial PRIMARY KEY,
    name varchar(255) NOT NULL,
    age INTEGER,
    date_of_graduation date
);

//Table created for specializations
CREATE TABLE specializations (
    species_id INT REFERENCES species(id),
    vets_id INT REFERENCES vets(id)
);

//Table created for visits
CREATE TABLE visits (
    animal_id INT REFERENCES animals(id),
    vets_id INT REFERENCES vets(id),
    date date
);


//Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);