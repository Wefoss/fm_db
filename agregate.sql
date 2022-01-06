SELECT avg("height")
FROM "users";

SELECT min("weight"), "last_name"
FROM "users" WHERE "id"%2=0 AND "is_male" = true
GROUP BY "last_name" LIMIT 10;


SELECT avg("weight"), "is_male"
FROM "users"
GROUP BY "is_male";


SELECT count("id")
FROM "users" WHERE "is_male" = true;

SELECT avg("height"),  "is_male" 
FROM "users" 
GROUP BY "is_male";

SELECT min("weight"), "is_male"
FROM "users" 
GROUP BY "is_male";

SELECT count("id")
FROM "users" WHERE EXTRACT('year' FROM "birthday")=1982;

SELECT sum("weight") "first_name"
FROM "users" WHERE "first_name"='Anna'
GROUP BY "first_name";

SELECT count("id"), "first_name"
FROM "users" WHERE "first_name"='Anna'
GROUP BY "first_name";

SELECT count("id")
FROM "users" WHERE EXTRACT('day' FROM "birthday")=11 AND EXTRACT('month' FROM "birthday")=05;

SELECT "weight"
FROM "users" WHERE "first_name"='Anna';

SELECT count("id") 
FROM "users" WHERE "height" > 1.8;
