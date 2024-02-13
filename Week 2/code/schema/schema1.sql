-- Adds type affinities
-- Creates mbta.db

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS "riders";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "visits";
DROP TABLE IF EXISTS "swipes";
DROP TABLE IF EXISTS "cards";

-- Creates tables with updated schema
CREATE TABLE "riders" (
    "id" INTEGER,
    "name" TEXT
);

CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT,
    "line" TEXT
);

CREATE TABLE "visits" (
    "rider_id" INTEGER,
    "station_id" INTEGER
);
