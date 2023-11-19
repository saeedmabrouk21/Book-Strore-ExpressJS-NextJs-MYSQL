const mysql = require("mysql2");
const connection = mysql.createConnection({
  host: "127.0.0.1",
  port: 3306,
  user: "root",
  password: "essaraeead", // Add your password here if you have set one
  database: "book_store", // Change to your actual database name
});
module.exports = connection;
