import styles from "./page.module.css";
import BookCard from "@/components/bookCard";
import bookStoreLogo from "@/images/book_store_logo.jpg";
import Image from "next/image";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import { pink } from "@mui/material/colors";

import {
  Card,
  CardContent,
  CardMedia,
  Typography,
  Grid,
  Button,
} from "@mui/material";
import { AddAlarm } from "@mui/icons-material";
export default async function CategoryPage({ info }) {
  let books;

  try {
    const response = await fetch(
      `http://localhost:3000/books/${search.category}`,
      {
        cache: "no-store",
        method: "get",
        headers: {
          "Content-Type": "application/json",
        },
      }
    );
    books = await response.json();
  } catch (error) {
    console.error("Error during login:", error);
  }

  return (
    <>
      <div className={styles["container"]}>
        <nav>
          <Image
            alt="book store logo"
            src={bookStoreLogo}
            width={100}
            height={100}
          ></Image>
          <ul>
            <li>home</li>
            <li>books</li>
          </ul>
          <ShoppingCartIcon sx={{ color: pink[500] }}></ShoppingCartIcon>
        </nav>

        <section style={{ backgroundImage: `url(${search.url})` }}>
          <div>
            <input type="search" placeholder="search by your book name"></input>
          </div>
        </section>
        <main>
          <section className={styles["books"]}>
            <h2>Books</h2>
            <div>
              {books.map((element) => (
                <BookCard info={element} key={element.name}></BookCard>
              ))}
            </div>
          </section>
        </main>
      </div>
    </>
  );
}
