/* Create clinic database */
CREATE DATABASE clinic;

/* Create patients table */
CREATE TABLE "patients"(
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);

/* Create medical_histories table */
CREATE TABLE "medical_histories"(
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "admitted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    FOREIGN KEY("patient_id") REFERENCES "patients"("id")
);

/* Create invoices table */
CREATE TABLE "invoices"(
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "payed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" INTEGER NOT NULL,
    FOREIGN KEY("medical_history_id") REFERENCES "medical_histories"("id")   
);

/* Create treatments table */
CREATE TABLE "treatments"(
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "type" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL
);

/* Creat invoice_items table */
CREATE TABLE "invoice_items"(
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "unit_price" 	 	DECIMAL NOT NULL,
    "quantity" 		 	INT NOT NULL,
  	"total-price"  	    DECIMAL NOT NULL,
  	"invoice_id" 	    INT NOT NULL,
  	"treatments_id"     INT NOT NULL,
    FOREIGN KEY("invoice_id") REFERENCES "invoices"("id"),
  	FOREIGN KEY("treatments_id") REFERENCES "treatments"("id")
);

/* Create joining table between medical_histories and treatments */
CREATE TABLE "medical_histories_treatment"(
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "medical_histories_id" 		INT NOT NULL,
  	"treatments_id" 					INT NOT NULL,
    FOREIGN KEY("medical_histories_id") REFERENCES "medical_histories"("id"),
  	FOREIGN KEY("treatments_id") REFERENCES "treatments"("id")
);

CREATE INDEX "medical_histories_id_index" ON "medical_histories_treatment"("medical_histories_id");
CREATE INDEX "treatments_id_index" ON "medical_histories_treatment"("treatments_id");
