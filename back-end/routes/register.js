"use strict";
const express = require("express");
const registerRouter = express.Router();
const connection = require("../dbConnection");
const cors = require("cors");

registerRouter.use(cors());
connection.connect();
registerRouter.post("/", (req, res) => {
  connection.query("USE book_store;", (useErr) => {
    connection.query(
      `INSERT INTO customer VALUES(DEFAULT,"${req.body.firstname}","${req.body.lastname}","${req.body.email}","${req.body.phone}")`,
      (selectErr) => {
        connection.query(
          "select max(customerId) as id from customer ",
          (Err, result) => {
            connection.query(
              `INSERT INTO user  VALUES("${req.body.username}","${req.body.password}",1,${result[0].id})`,
              (err) => {
                if (!err) {
                  return res.status(200).json({ success: "Login successful" });
                } else {
                  return res.status(401).json({ error: "Invalid credentials" });
                }
              }
            );
          }
        );
      }
    );
  });
});

module.exports = registerRouter;
