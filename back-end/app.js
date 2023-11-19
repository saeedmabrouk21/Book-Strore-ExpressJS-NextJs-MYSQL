"use strict";
const loginRouter = require("../book_store/routes/login.js");
const registerRouter = require("../book_store/routes/register.js");
const express = require("express");
const app = express();
const cors = require("cors");

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/login", loginRouter);
app.use("/register", registerRouter);
app.use(cors());

app.get("/", (req, res) => {});

app.listen(3000, (error) => {
  if (error) {
    console.log(`there was a problem ${error}`);
    return;
  }
  console.log("listing on port 3000");
});
