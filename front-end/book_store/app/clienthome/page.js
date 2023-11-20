import styles from "./page.module.css";
import BookCard from "@/components/bookCard";
import bookStoreLogo from "@/images/book_store_logo.jpg";

import Link from "next/link";

export default  async function ClientHome() {
  let books;

    try {
      const response = await fetch("http://localhost:3000/books", {
        method: "get",
        headers: {
          "Content-Type": "application/json",
        },
      });
      books = await response.json();
      console.log(books[0]);

      // if (response.ok) {

      // }
    } catch (error) {
      console.error("Error during login:", error);
    }
  



  return (
    <>
      <div className={styles["nav"]}>nav bar</div>
      <div className={styles["ddd"]}>
        {console.log("books", books)}
        {books.map(element => 
          <BookCard info={element}></BookCard>
        )}
      </div>
    </>
  );
}
