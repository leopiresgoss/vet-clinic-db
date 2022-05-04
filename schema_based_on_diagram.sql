/* Create clinic database */
CREATE DATABASE clinic;

/* Create patients table */
CREATE TABLE "patients"(
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);