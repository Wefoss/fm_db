SELECT "email", "first_name" FROM "users" LIMIT 20 OFFSET 5;

SELECT * FROM "users" WHERE "is_male" = true;

SELECT * FROM "users" WHERE "id"%2=0 AND "is_male" = false;

SELECT * FROM "users" WHERE "first_name" = 'Anna';

SELECT * FROM "users" WHERE "first_name" IN ('lia', 'Anna', 'Julia');

SELECT age("birthday"),"birthday" FROM "users"  WHERE age("birthday")>make_interval(40);

SELECT * FROM "users"  WHERE 
"is_male" = true AND age("birthday") BETWEEN make_interval(40) AND make_interval(50);

SELECT * FROM "users"  WHERE "height" > 1.9;

SELECT "id", "birthday", "is_male"  FROM "users" WHERE 
EXTRACT('month' FROM "birthday")=5 AND "is_male" = false;

SELECT "id", "birthday", "is_male" FROM  "users" WHERE
EXTRACT('day' FROM "birthday")=31;

SELECT "email", "birthday", "height" FROM "users" WHERE 
age("birthday") > make_interval(35) AND "height" < 1.87;

SELECT * FROM "users" WHERE "first_name" = 'Anna' AND 
age("birthday") < make_interval(30);

SELECT * FROM "users" WHERE "is_male" = false AND "height" < 1.7 AND age("birthday") BETWEEN make_interval(18) AND make_interval(28);