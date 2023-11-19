import styles from "./page.module.css";
import LoginForm from "./loginForm";
export default function Home() {
  return (
    <main className={styles.main}>
      <LoginForm></LoginForm>
    </main>
  );
}




