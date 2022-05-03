/* Database schema to keep the structure of entire database. */

CREATE TABLE species (
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(250)
);

CREATE TABLE owners (
    id                  SERIAL PRIMARY KEY,
    full_name           VARCHAR(250),
    age                 INT
);

CREATE TABLE animals (
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(250),
    date_of_birth       DATE,
    escape_attempts     INT,
    neutered            BOOLEAN,
    weight_kg           DECIMAL,
    species_id          INT,
    owner_id            INT,
    CONSTRAINT fk_specie
        FOREIGN KEY(species_id)
            REFERENCES species(id),
    CONSTRAINT fk_owner
        FOREIGN KEY(owner_id)
            REFERENCES owners(id)
);

CREATE TABLE vets (
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(250),
    age                 INT,
    date_of_graduation  DATE
);

CREATE TABLE specializations (
    id                  SERIAL PRIMARY KEY,
    vet_id              INT,
    species_id          INT,
    CONSTRAINT fk_vet FOREIGN KEY(vet_id) REFERENCES vets(id),
    CONSTRAINT fk_specializations_specie FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE TABLE visits (
    id                  SERIAL PRIMARY KEY,
    vet_id              INT,
    animal_id          INT,
    date_of_visit        DATE,
    CONSTRAINT fk_vet FOREIGN KEY(vet_id) REFERENCES vets(id),
    CONSTRAINT fk_visits_specie FOREIGN KEY(animal_id) REFERENCES animals(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Add a non-cluster index to improve the visits search by animal_id
CREATE INDEX visits_animal_id_asc ON visits(animal_id ASC);

-- Select all the visits where vets_id = 2
CREATE INDEX visit_vets_index ON visits(vet_id DESC);

-- Add a non-cluster index to improve the owners search by email
CREATE INDEX owners_email ON owners(email DESC);
