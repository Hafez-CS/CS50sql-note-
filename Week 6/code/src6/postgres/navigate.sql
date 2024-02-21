-- Demonstrates navigating a PostgreSQL database

-- Start docker container
docker start postgres

-- Log in
psql postgresql://postgres@127.0.0.1:5432/postgres

-- List all databases
\l
\list

-- Create a database
CREATE DATABASE "mbta";

-- Connect to a particular database
\c
\connect

-- List all tables
\dt

-- Describe a particular table
\d "cards"

-- Quit
\q
