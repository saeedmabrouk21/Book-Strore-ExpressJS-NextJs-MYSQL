"use strict";
const express = require("express");
const bookRouter = express.Router();
const connection = require("../dbConnection");
const cors = require("cors");

// name: "Welcome to the jungle",
//     link: "https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/12/attachment_137125302-e1670235568295.jpeg?auto=format&q=60&fit=max&w=930",
//     rate: 3.5,
//     price: 3,

bookRouter.use(cors());
connection.connect();
bookRouter.get("/", (req, res) => {
  connection.query("USE book_store;", (useErr) => {
    if (useErr) console.log("saeed fares");

    // Execute the SELECT query
    connection.query(
      "SELECT bookname as name,coverLink as link,ratings as rate,price,people FROM Book",
      (selectErr, rows) => {
        if (selectErr) console.log("saeed");
        console.log("mr7b4");
        if (rows.length == 0) {
          return res.status(204).json({ error: "NO content" });
        } else {
          return res.status(200).json(rows);
        }
      }
    );
  });
});

module.exports = bookRouter;
