--- Demonstrates PostgreSQL types

CREATE TABLE "cards" (
    "id" SERIAL,
    PRIMARY KEY("id")
);

CREATE TABLE "stations" (
    "id" SERIAL,
    "name" VARCHAR(32) NOT NULL UNIQUE,
    "line" VARCHAR(32) NOT NULL,
    PRIMARY KEY("id")
);

CREATE TYPE "swipe_type" AS ENUM('enter', 'exit', 'deposit');

CREATE TABLE "swipes" (
    "id" SERIAL,
    "card_id" INT,
    "station_id" INT,
    "type" "swipe_type" NOT NULL,
    "datetime" TIMESTAMP NOT NULL DEFAULT now(),
    "amount" NUMERIC(5,2) NOT NULL CHECK("amount" != 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id"),
    FOREIGN KEY("card_id") REFERENCES "cards"("id")
);
