import styles from "./page.module.css";
import BookCard from "@/components/bookCard";
import CarouselV2 from "./carousel";
import CategoryCard from "@/components/categoryCard";
import Link from "next/link";
import NavBar from "@/components/navbar";
export default async function ClientHome({
  info = {
    login: false,
    state: false, //false means customer true means admin
  },
}) {
  let books;
  let categories;
  try {
    const response = await fetch("http://localhost:3000/books/recent", {
      cache: "no-store",
      method: "get",
      headers: {
        "Content-Type": "application/json",
      },
    });
    books = await response.json();
  } catch (error) {
    console.error("Error during login:", error);
  }

  try {
    const response = await fetch("http://localhost:3000/categories", {
      // cache: "no-store",
      method: "get",
      headers: {
        "Content-Type": "application/json",
      },
    });
    categories = await response.json();
  } catch (error) {
    console.error("Error during login:", error);
  }
  return (
    <>
      <div className={styles["container"]}>
        {/* <NavBar info={info}></NavBar> */}

        <section>
          <input type="search" placeholder="search by your book name"></input>
        </section>
        <main>
          <section className={styles["categories"]}>
            <h2>shop by categories</h2>
            <CarouselV2>
              {categories.map((item, index) => (
                <Link
                  href={`category/${item.category}`}
                  state={{ from: "occupation" }}
                  key={item.category}
                >
                  <CategoryCard info={item} key={item.category} />
                </Link>
              ))}
            </CarouselV2>
          </section>

          <section className={styles["recently"]}>
            <h2>Recently added</h2>
            <div className={styles["one-card"]}>
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
