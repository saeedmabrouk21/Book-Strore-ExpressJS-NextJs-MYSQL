"use strict";
const express = require("express");
const categoryRouter = express.Router();
const connection = require("../dbConnection");
const cors = require("cors");

categoryRouter.use(cors());
connection.connect();
categoryRouter.get("/", (req, res) => {
  connection.query("USE book_store;", (useErr) => {
    if (useErr) console.log("saeed fares");

    // Execute the SELECT query
    connection.query("CALL pr_categories()", (selectErr, rows) => {
      if (selectErr) console.log("saeed");
      if (rows.length == 0) {
        return res.status(204).json({ error: "NO content" });
      } else {
        return res.status(200).json(rows[0]);
      }
    });
  });
});

module.exports = categoryRouter;
