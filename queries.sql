/*Queries that provide answers to the questions from all projects.*/

//Find all animals whose name ends in "mon".
SELECT * FROM animals
WHERE name LIKE '%mon';


//List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN'2016-01-01' AND '2019-01-01';


//List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = 'True' AND escape_attempts < 3;


//List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';


//List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

//Find all animals that are neutered.
SELECT * FROM animals WHERE neutered='TRUE';

//Find all animals not named Gabumon.
SELECT * FROM animals WHERE NOT name='Gabumon';

//Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE (weight_kg BETWEEN 10.4 and 17.3 AND weight_kg =10.4 OR weight_kg= 17.3);

BEGIN TRANSACTION;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT SPA1;

UPDATE animals SET weight_kg=weight_kg * -1;

ROLLBACK TO SPA1;

UPDATE animals SET weight_kg=weight_kg * -1 WHERE weight_kg<0;

COMMIT;

// How many animals are there?
SELECT COUNT (id) FROM animals;

//How many animals have never tried to escape?
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts=0;

//What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

//Who escapes the most, neutered or not neutered animals?
SELECT MAX(escape_attempts) FROM animals WHERE neutered=TRUE OR FALSE;

//What is the minimum and maximum weight of each type of animal?
SELECT MIN(weight_kg) FROM animals;
SELECT MAX(weight_kg) FROM animals;

//What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

//Queries (using JOIN): 
SELECT name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals LEFT JOIN Species ON animals.species_id = species_id WHERE Species.name = 'Pokemon';
SELECT * FROM animals LEFT JOIN Owners ON animals.owner_id = owners.id;
SELECT Species.name, COUNT(animals.species_id) FROM animals JOIN Species ON animals.species_id = species_id GROUP BY Species.name;
SELECT * FROM animals a JOIN Owners O ON a.owner_id=O.id JOIN Species S ON a.species_id=S.id WHERE O.full_name='Jennifer Orwell' AND S.name='Digimon';
SELECT animals.name from animals JOIN Owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND animals.owner_id = 5;
SELECT full_name, COUNT(owner_id) FROM Owners JOIN animals on Owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT (owner_id) desc limit 1;


//Queries answered: 
SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets ON v.vets_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY v.date desc limit 1;
SELECT COUNT(animals.name) FROM visits JOIN animals ON visits.animal_id=animals.id JOIN vets ON visits.vets_id=vets.id WHERE vets.name='Stephanie Mendez';
SELECT vets.name, species.name FROM specializations JOIN species ON specializations.species_id=species.id FULL JOIN vets ON specializations.vets_id=vets.id;
SELECT animals.name FROM visits JOIN animals ON visits.animal_id=animals.id JOIN vets ON visits.vets_id=vets.id WHERE vets.name='Stephanie Mendez' AND visits.date BETWEEN '2020-04-01' AND '2020-08-30';
SELECT COUNT(animals.name), animals.name FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vets_id=vets.id GROUP BY animals.name ORDER BY COUNT(animals.name) DESC LIMIT 1;
SELECT animals.name FROM visits JOIN animals ON visits.animal_id=animals.id JOIN vets ON visits.vets_id=vets.id WHERE vets.name='Maisy Smith' ORDER BY visits.date LIMIT 1;
SELECT animals.*, vets.*, visits.date as date_visited FROM visits JOIN animals ON visits.animal_id=animals.id JOIN vets ON visits.vets_id=vets.id ORDER BY visits.date DESC LIMIT 1;
SELECT COUNT(*) FROM vets LEFT JOIN visits ON vets.id = visits.animal_id LEFT JOIN specializations ON specializations.species_id = vets.id LEFT JOIN species ON species.id = specializations.species_id WHERE species.id IS NULL;
SELECT COUNT(animals.id), animals.name, animals.species_id FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vets_id=vets.id WHERE vets.name = 'Maisy Smith' GROUP BY animals.id ORDER BY COUNT(animals.id) DESC LIMIT 1;