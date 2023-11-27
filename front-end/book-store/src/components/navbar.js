import styles from "./components.module.css";
import bookStoreLogo from "@/images/book_store_logo.jpg";
import Image from "next/image";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import { pink } from "@mui/material/colors";
import AddShoppingCartIcon from "@mui/icons-material/AddShoppingCart";
import NavBarStatus from "./navbarSatus";
import Link from "next/link";

export default function NavBar({
  info = {
    login: false,
    state: false, //false means customer true means admin
  },
}) {
  return (
    <div className={styles["nav-container"]}>
      <nav>
        <Link href="/"><Image src={bookStoreLogo} width={100} height={100}></Image></Link>
        <ul>
          <li >home</li>
          <li>books</li>
        </ul>
        <NavBarStatus info={info}></NavBarStatus>
      </nav>
    </div>
  );
}
