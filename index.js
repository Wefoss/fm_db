const { Client } = require("pg");

const config = {
  user: "postgres",
  pass: "postgres",
  host: "localhost",
  port: 5432,
  database: "fm_test",
};

const user = {
  first_name: "John",
  last_name: "Snow",
  email: 'john@mail.com',
  is_male: true,
  birthday: '1896-04-05',
  height: 1.67,
}

const client = new Client(config);

start();

async function start() {
  await client.connect();
  const res = await client.query(`
    INSERT INTO "users" ("first_name","last_name","email","is_male","birthday","height")
     VALUES ('${user.first_name}', '${user.last_name}', '${user.email}', '${user.is_male}', '${user.birthday}', '${user.height}');
  `);
  console.log(res);
  await client.end();
}
