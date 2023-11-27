"use strict";
const express = require("express");
const bookRouter = express.Router();
const connection = require("../dbConnection");
const cors = require("cors");

bookRouter.use(cors());
connection.connect();
bookRouter.get("/", (req, res) => {
  connection.query("USE book_store;", (useErr) => {
    if (useErr) console.log("saeed fares");
    else {
    
      connection.query("CALL pr_getAllBooks()", (selectErr, rows) => {
        if (selectErr) console.log("saeedgetallbooks");
        else {
          if (rows[0].length == 0) {
            return res.status(204).json({ error: "NO content" });
          } else {
            return res.status(200).json(rows[0]);
          }
        }
      });
    }
  });
});

bookRouter.get("/recent", (req, res) => {
  connection.query("USE book_store;", (useErr) => {
    if (useErr) console.log("saeed fares");
    else {
      
      connection.query("CALL pr_getRecentBooks()", (selectErr, rows) => {
        if (selectErr) console.log("saeedgetallbooks");
        else {
          if (rows[0].length == 0) {
            return res.status(204).json({ error: "NO content" });
          } else {
            return res.status(200).json(rows[0]);
          }
        }
      });
    }
  });
});
bookRouter.get("/category/:category", (req, res) => {
  connection.query("USE book_store;", (useErr) => {
    if (useErr) console.log("saeed fares");
    let selectedCategory = req.params.category;
    selectedCategory = selectedCategory.toLowerCase();
    selectedCategory = selectedCategory.charAt(0) + selectedCategory.slice(1);
    connection.query(
      `CALL pr_getBooksWithCategory("${selectedCategory}")`,

      (selectErr, rows) => {
        if (selectErr) console.log("saeed");
        else {
          if (rows.length == 0) {
            return res.status(204).json({ error: "NO content" });
          } else {
            return res.status(200).json(rows[0]);
          }
        }
      }
    );
  });
});

module.exports = bookRouter;
