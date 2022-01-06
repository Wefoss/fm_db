ALTER TABLE "users" 
ADD COLUMN "weight" INT CHECK  ("weight" BETWEEN 0 AND 250);


SELECT * FROM "users";

UPDATE "users" SET "weight" = ("height" - 1)*100;

UPDATE "users" SET "weight" = 55 WHERE "first_name" = 'Anna';

SELECT * FROM "users" WHERE "first_name" = 'Anna';

UPDATE "users" SET  "weight" = 230 WHERE "is_male" = true AND "height" > 1.98;

UPDATE "users" SET  "weight" = 40 WHERE "is_male" = false  AND "height" = 1.45;

UPDATE "users" SET "last_name" = 'qwerty' WHERE "id" = 958;

DELETE FROM "users" WHERE "id" = 958;

UPDATE "users" SET "weight" = 55 WHERE "first_name" = 'Anna' RETURNING *;


SELECT "id" AS "numberId", length(concat("first_name", ' ', "last_name"))  AS "lenght" FROM "users" AS "u" WHERE length(concat("first_name", ' ', "last_name"))>15 LIMIT 10;

SELECT * FROM (
SELECT "id",concat("first_name", ' ', "last_name") AS "Full Name",
length(concat("first_name", ' ', "last_name")) AS "length"
 FROM "users") AS "tableFN" WHERE "tableFN"."length"=9 LIMIT 10;