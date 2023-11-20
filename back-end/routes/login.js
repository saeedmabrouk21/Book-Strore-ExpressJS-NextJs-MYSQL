"use strict";
const express = require("express");
const loginRouter = express.Router();
const connection = require("../dbConnection");
const cors = require("cors");

loginRouter.use(cors());
connection.connect();
loginRouter.post("/", (req, res) => {
  console.log(req.body);

  const { username, password } = req.body; // Assuming you're using body-parser middleware

  // // Validate credentials
  if (!username || !password) {
    return res
      .status(400)
      .json({ error: "Username and password are required" });
  }
  // connection.connect();
  connection.query("USE book_store;", (useErr) => {
    if (useErr) console.log("saeed fares");

    // Execute the SELECT query
    connection.query(
      `SELECT password FROM user WHERE userName = "${username}"`,
      (selectErr, rows) => {
        if (selectErr) console.log("saeed");

        console.log("Barcodes:", rows);
        // Check if user exists
        if (rows[0] && password === rows[0].password) {
          return res.status(200).json({ success: "Login successful" });
        } else {
          return res.status(401).json({ error: "Invalid credentials" });
        }
      }
    );
  });
});

module.exports = loginRouter;
