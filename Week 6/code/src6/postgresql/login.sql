-- Demonstrates navigating a PostgreSQL database

-- Starts PostgreSQL server using Docker
docker run --name postgres -p 5432:5432 -v /workspaces/$RepositoryName:/mnt -e POSTGRES_PASSWORD=crimson -d postgres

-- Logs in, if using 'crimson' as password
psql postgresql://postgres@127.0.0.1:5432/postgres

-- Lists all databases
\l
\list

-- Creates a database
CREATE DATABASE "mbta";

-- Connects to a particular database
\c
\connect

-- Lists all tables
\dt

-- Describes a particular table
\d "cards"

-- Quits
\q
