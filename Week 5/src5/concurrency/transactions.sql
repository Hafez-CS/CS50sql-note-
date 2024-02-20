-- Demonstrates atomicity of transactions
-- Uses bank.db

-- Shows schema, higlight CHECK constraint
.schema

-- Views account balances
SELECT * FROM "accounts";

-- Updates balance without a transaction
UPDATE "accounts" SET "balance" = "balance" + 10 WHERE "id" = 2;
SELECT * FROM "accounts"; -- Viewing here provides an improper view of total balances
UPDATE "accounts" SET "balance" = "balance" - 10 WHERE "id" = 1;
SELECT * FROM "accounts"; -- Viewing here, after all updated, results in proper view

-- Resets table
UPDATE "accounts" SET "balance" = "balance" - 10 WHERE "id" = 2;
UPDATE "accounts" SET "balance" = "balance" + 10 WHERE "id" = 1;

-- Creates a transaction which is successful
-- Views state of database from other terminal mid-way through transaction
BEGIN TRANSACTION;
UPDATE "accounts" SET "balance" = "balance" + 10 WHERE "id" = 2;
UPDATE "accounts" SET "balance" = "balance" - 10 WHERE "id" = 1;
COMMIT;

-- Completes invalid update of balance without a transaction
UPDATE "accounts" SET "balance" = "balance" + 10 WHERE "id" = 2;
UPDATE "accounts" SET "balance" = "balance" - 10 WHERE "id" = 1; -- Invokes constraint error, which is ABORTed

-- Rolls back the balance
UPDATE "accounts" SET "balance" = "balance" - 10 WHERE "id" = 2;

-- Creates a transaction which should be rolled back
BEGIN TRANSACTION;
UPDATE "accounts" SET "balance" = "balance" + 10 WHERE "id" = 2;
UPDATE "accounts" SET "balance" = "balance" - 10 WHERE "id" = 1; -- Invokes constraint error, which is ABORTed
ROLLBACK;
