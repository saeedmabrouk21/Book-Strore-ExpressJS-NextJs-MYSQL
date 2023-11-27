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
import CategoryCard from "@/components/categoryCard";
import NavBar from "@/components/navbar";
export default async function SelectedCategory({ params }) {
  let books;
  let categories;
  try {
    const response = await fetch(
      `http://localhost:3000/books/category/${params.categoryName}`,
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
  let SelectedURL = categories.filter((item) => {
    return item.category.toUpperCase() === params.categoryName.toUpperCase();
  });


  return (
    <>
      <div className={styles["container"]}>
       
        <section
          style={{
            backgroundImage: `url(${SelectedURL[0].url})`,
          }}
        >
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

function Item(props) {
  return (
    <Paper>
      <h2>{props.item.name}</h2>
      <p>{props.item.description}</p>

      <Button className="CheckButton">Check it out!</Button>
    </Paper>
  );
}

function Banner(props) {
  const contentPosition = props.contentPosition
    ? props.contentPosition
    : "left";
  const totalItems = props.length ? props.length : 3;
  const mediaLength = totalItems - 1;

  let items = [];
  const content = (
    <Grid item xs={4} key="content">
      <CardContent className="Content">
        <Typography className="Title">{props.item.Name}</Typography>

        <Typography className="Caption">{props.item.Caption}</Typography>

        <Button variant="outlined" className="ViewButton">
          View Now
        </Button>
      </CardContent>
    </Grid>
  );

  for (let i = 0; i < mediaLength; i++) {
    const item = props.item.Items[i];

    const media = (
      <Grid item xs={4} key={item.Name}>
        <CardMedia className="Media" image={item.Image} title={item.Name}>
          <Typography className="MediaCaption">{item.Name}</Typography>
        </CardMedia>
      </Grid>
    );

    items.push(media);
  }

  if (contentPosition === "left") {
    items.unshift(content);
  } else if (contentPosition === "right") {
    items.push(content);
  } else if (contentPosition === "middle") {
    items.splice(items.length / 2, 0, content);
  }

  return (
    <Card raised className="Banner">
      <Grid container spacing={0} className="BannerGrid">
        {items}
      </Grid>
    </Card>
  );
}
