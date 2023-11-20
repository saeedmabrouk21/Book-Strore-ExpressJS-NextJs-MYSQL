"use strict";
const loginRouter = require("../back-end/routes/login.js");
const registerRouter = require("./routes/register.js");
const express = require("express");
const app = express();
const cors = require("cors");
const bookRouter = require("./routes/books.js");

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/login", loginRouter);
app.use("/register", registerRouter);
app.use("/books", bookRouter);
app.use(cors());

app.get("/", (req, res) => {});

app.listen(3000, (error) => {
  if (error) {
    console.log(`there was a problem ${error}`);
    return;
  }
  console.log("listing on port 3000");
});
