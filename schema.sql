/* Database schema to keep the structure of entire database. */
/*
id: integer
name: string
date_of_birth: date
escape_attempts: integer
neutered: boolean
weight_kg: decimal
*/

CREATE TABLE animals(
    id                  INT GENERATED ALWAYS AS IDENTITY,
    name                VARCHAR(250),
    date_of_birth       DATE,
    escape_attempts     INT,
    neutered            BOOLEAN,
    weight_kg           DECIMAL,
    PRIMARY KEY(id),
);
