"use client";
import styles from "./components.module.css";
import { useState } from "react";
import Rating from "@mui/material/Rating";
import AddShoppingCartIcon from "@mui/icons-material/AddShoppingCart";
import { styled } from "@mui/material/styles";
const StyledRating = styled(Rating)({
  "& .MuiRating-iconFilled": {
    color: "#fffff",
  },

  "& .MuiRating-iconEmpty": {
    color: "#FFFFFF",
  },
  //   "& .MuiRating-sizeSmall": {},
});
export default function BookCard({



  
  info = {
    name: "",
    link: "",
    rate: 0,
    price: 0,
  },
}) {
  const [seeData, setSeeData] = useState(true);
  return (
    <>
      <div className={styles["card-container"]}>
        <img
          src={info.link}
          onMouseEnter={() => setSeeData(false)}
          onMouseLeave={() => setSeeData(true)}
        />
        
          <AddShoppingCartIcon className={styles["cart"]}></AddShoppingCartIcon>
       
        {seeData && (
          <div className={styles["data"]}>
            <p>{info.name}</p>

            <span className={styles["price"]}>{info.price}$</span>
            <span className={styles["rating"]}>
              
            <StyledRating
              name="read-only"
              value={info.rate}
              precision={0.1}
              size="small"
              readOnly
              
            />
            <span className={styles["people"]} >(233)</span>
            </span>
          </div>
        )}
      </div>
    </>
  );
}
