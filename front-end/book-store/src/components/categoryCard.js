"use client";
import styles from "./components.module.css";
import { useState } from "react";
import Rating from "@mui/material/Rating";
import AddShoppingCartIcon from "@mui/icons-material/AddShoppingCart";
import { styled } from "@mui/material/styles";

export default function CategoryCard({
  info = {
    name: "",
    url: "",
  },
}) {
  return (
    <>
      <div className={styles["category-card-container"]}>
        {console.log(info)}
        <img
          src={info.url}
   
        />
        
         
       
      
      </div>
    </>
  );
}
