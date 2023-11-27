"use client"
import styles from "./components.module.css";
import bookStoreLogo from "@/images/book_store_logo.jpg";
import Image from "next/image";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import { pink } from "@mui/material/colors";
import AddShoppingCartIcon from "@mui/icons-material/AddShoppingCart";
import Link from "next/link";

export default function NavBarStatus({
  info = {
    login: false,
    state: false, //false means customer true means admin
  },
}) {
  return (
    <>
      
      {info.login ? (
        state ? (
          <div>admin</div>
        ) : (
          <ShoppingCartIcon sx={{ color: pink[500] }}></ShoppingCartIcon>
        )
      ) : (
        <Link href="login">login</Link>
      )}
    </>
  );
}
