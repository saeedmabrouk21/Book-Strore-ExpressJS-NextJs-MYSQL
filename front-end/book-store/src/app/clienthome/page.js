import styles from "./page.module.css";
import BookCard from "@/components/bookCard";
import bookStoreLogo from "@/images/book_store_logo.jpg";
import Image from "next/image";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import { pink } from "@mui/material/colors";
import CarouselV2 from "./carousel";
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
export default async function ClientHome() {
  let books = [
    {
      name: "The Great Gatsby",
      link: "https://designforwriters.com/wp-content/uploads/2017/10/design-for-writers-book-cover-tf-2-a-million-to-one.jpg",
      rate: 4.5,
      price: 1.99,
      people: 110,
    },
    {
      name: "To Kill a Mockingbird",
      link: "https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/12/attachment_137125302-e1670235568295.jpeg?auto=format&q=60&fit=max&w=930",
      rate: 3.8,
      price: 2.99,
      people: 1210,
    },
    {
      name: "The Da Vinci Code",
      link: "https://bukovero.com/wp-content/uploads/2016/07/Harry_Potter_and_the_Cursed_Child_Special_Rehearsal_Edition_Book_Cover.jpg",
      rate: 4.2,
      price: 1.49,
      people: 1140,
    },
    {
      name: "Pride and Prejudice",
      link: "https://images.penguinrandomhouse.com/cover/9780593422182",
      rate: 4.7,
      price: 3.49,
      people: 310,
    },
    {
      name: "The Hobbit",
      link: "https://m.media-amazon.com/images/I/41gr3r3FSWL.jpg",
      rate: 3.5,
      price: 2.25,
      people: 112,
    },
    {
      name: "Saeed Fares",
      link: "https://theretrofuturist.com/wp-content/uploads/2019/01/space-cat-book-cover.jpg",
      rate: 3.5,
      price: 2.25,
      people: 1102,
    },
  ];

  let categories ;
  try {
    const response = await fetch("http://localhost:3000/books", {
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
        <nav>
          <Image src={bookStoreLogo} width={100} height={100}></Image>
          <ul>
            <li>home</li>
            <li>books</li>
          </ul>
          <ShoppingCartIcon sx={{ color: pink[500] }}></ShoppingCartIcon>
        </nav>
        <section>
          <input type="search" placeholder="search by your book name"></input>
        </section>
        <main>
          <section className={styles["categories"]}>
            <h2>shop by categories</h2>
            <CarouselV2>
         
              {categories.map((item, index) => (
                <CategoryCard info={item} key= {item.name} />
              ))}
            </CarouselV2>
          </section>

          <section className={styles["recently"]}>
            <h2>Recently added</h2>
            <div>
              {books.map((element) => (
                <BookCard info={element}></BookCard>
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
