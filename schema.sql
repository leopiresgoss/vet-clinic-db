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
