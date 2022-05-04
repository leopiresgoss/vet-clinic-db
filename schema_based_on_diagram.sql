/* Create clinic database */
CREATE DATABASE clinic;

/* Create patients table */
CREATE TABLE "patients"(
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);

CREATE TABLE "medical_histories"(
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "admitted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    FOREIGN KEY("patient_id") REFERENCES "patients"("id")
);