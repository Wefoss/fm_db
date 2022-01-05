const { Client } = require("pg");
const axios = require('axios');

const http = axios.create({
  baseURL: 'https://randomuser.me/api/'
})

const loadUser = async () => {
 const {data:{results}} = await http.get('?results=1000&seed=db_fm&page=2')
 //console.log(results);
 return results
}


const config = {
  user: "postgres",
  pass: "postgres",
  host: "localhost",
  port: 5432,
  database: "fm_test",
};

// const user = [
//   {
//     first_name: "John",
//     last_name: "Snow",
//     email: "1john@mail.com",
//     is_male: true,
//     birthday: "1896-04-05",
//     height: 1.67,
//   },
//   {
//     first_name: "Bohn",
//     last_name: "Gnow",
//     email: "2john@mail.com",
//     is_male: true,
//     birthday: "1896-04-05",
//     height: 1.67,
//   },
//   {
//     first_name: "Zohn",
//     last_name: "Bnow",
//     email: "3john@mail.com",
//     is_male: true,
//     birthday: "1896-04-05",
//     height: 1.67,
//   },
// ];





const client = new Client(config);

start();

async function start() {
  await client.connect();
  const users = await loadUser();
  const res = await client.query(`
    INSERT INTO "users" ("first_name","last_name","email","is_male","birthday","height")
     VALUES ${userList(users)};
  `);
  console.log(res);
  await client.end();
}

function userList(arr) {
  return arr
    .map(
      ({name:{first, last}, email, gender, dob:{date}}) =>
        `('${first}', '${last}', '${email}', '${gender === 'male'}', '${date}', '${(Math.random() + 1.1).toFixed(2)}')`
    )
    .join(',');
}


