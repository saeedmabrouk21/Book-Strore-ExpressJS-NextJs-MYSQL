"use client";
import { useRouter } from "next/navigation";
import styles from "./page.module.css";
import bookStoreLogo from "@/images/book_store_logo.jpg";
import Link from "next/link";
import { useState } from "react";

export default function LoginForm() {
  const router = useRouter();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [wrongCredentials, setWrongCredentials] = useState(false); // Fix the typo here

  async function handleSubmit(e) {
    e.preventDefault();
    try {
      const response = await fetch("http://localhost:3000/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ username, password }),
      });

      if (response.ok) {
        router.push("/clienthome");
      } else {
        setWrongCredentials(true);
      }
    } catch (error) {
      console.error("Error during login:", error);
    }
  }

  return (
    <>
      <div className={styles.container}>
        <form
          className={styles["login-form"]}
          method="post"
          action="http://localhost:3000/login"
          onSubmit={handleSubmit}
        >
          <img src={bookStoreLogo.src} />

          <label htmlFor="username">Username</label>
          <input
            id="username"
            name="username"
            type="text"
            onChange={(e) => setUsername(e.target.value)}
            required
          />

          <label htmlFor="password">password</label>
          <input
            id="password"
            name="password"
            type="password"
            onChange={(e) => setPassword(e.target.value)}
            required
          />

          <input type="submit" required></input>
          <hr />
          <span>
            Don't have an account? <Link href="register">register</Link>
          </span>
          {wrongCredentials && <div>Wrong Credentials</div>}
        </form>
      </div>
    </>
  );
}
