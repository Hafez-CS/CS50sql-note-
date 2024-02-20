-- Demonstrates race conditions
-- Uses bank.db

-- Connection 1
SELECT "balance" FROM "accounts" WHERE "id" = 3;

-- Connection 2
SELECT "balance" FROM "accounts" WHERE "id" = 3;

-- Connection 1
UPDATE "accounts" SET "balance" = "balance" + 30 WHERE "id" = 1;

-- Connection 2
UPDATE "accounts" SET "balance" = "balance" + 30 WHERE "id" = 1;

-- Connection 3
SELECT "balance" FROM "accounts" WHERE "id" = 1;
UPDATE "accounts" SET "balance" = "balance" - 30 WHERE "id" = 1;

-- Connection 1
UPDATE "accounts" SET "balance" = "balance" - 30 WHERE "id" = 3;

-- Connection 2
UPDATE "accounts" SET "balance" = "balance" - 30 WHERE "id" = 3;
