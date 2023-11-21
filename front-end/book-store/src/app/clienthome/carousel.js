"use client";
import styles from "./page.module.css";
import Link from "next/link";
import { pink } from "@mui/material/colors";
import Carousel from "react-material-ui-carousel";
import { Paper, Button } from "@mui/material";

export default function CarouselV2({ children }) {
  return (
    <Carousel
     
    navButtonsAlwaysVisible= {true} 
    navButtonsAlwaysInvisible= {false}
      
    >
      {children}
    </Carousel>
  );
}

function Item(props) {
  return (
    <Paper>
      <h2>{props.item.name}</h2>
      <p>{props.item.description}</p>

      <Button className="CheckButton">Check it out!</Button>
    </Paper>
  );
}
