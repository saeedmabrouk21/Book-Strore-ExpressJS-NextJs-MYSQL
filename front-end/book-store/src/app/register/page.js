"use client";
import styles from "./page.module.css";
import { useState } from "react";
import bookStoreLogo from "@/images/book_store_logo.jpg";
import { useRouter } from "next/navigation";

import Link from "next/link";

export default function Register() {
  const router = useRouter();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [firstname, setFirstName] = useState("");
  const [lastname, setLastName] = useState("");
  const [email, setemail] = useState("");
  const [phone, setPhone] = useState("");
  const [rightCredentials, setRightCredentials] = useState(false);

  async function handleSubmit(e) {
    e.preventDefault();
    try {
      const response = await fetch("http://localhost:3000/register", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          username,
          password,
          firstname,
          lastname,
          email,
          phone,
        }),
      });

      if (response.ok) {
        setRightCredentials(true);
      }
    } catch (error) {
      console.error("Error during login:", error);
    }
  }

  return (
    <>
      <div className={styles.container}>
        <form className={styles["login-form"]} onSubmit={handleSubmit}>
          <img alt="bookstorelogo" src={bookStoreLogo.src} />

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
          <label htmlFor="firstname">First Name</label>
          <input
            id="firstname"
            name="firstname"
            type="text"
            onChange={(e) => setFirstName(e.target.value)}
            required
          />
          <label htmlFor="email">Last Name</label>
          <input
            id="lastname"
            name="lastname"
            type="text"
            onChange={(e) => setLastName(e.target.value)}
            required
          />
          <label htmlFor="email">E-mail</label>
          <input
            id="email"
            name="email"
            type="email"
            onChange={(e) => setemail(e.target.value)}
            required
          />
          <label htmlFor="phone">Phone</label>
          <input
            id="phone"
            name="phone"
            type="phone"
            onChange={(e) => setPhone(e.target.value)}
            required
          />

          <input type="submit" required></input>
          <hr />
          <span>
            Already have account ? <Link href="/">log in</Link>
          </span>
          {rightCredentials && <div>Registered successfully</div>}
        </form>
      </div>
    </>
  );
}
