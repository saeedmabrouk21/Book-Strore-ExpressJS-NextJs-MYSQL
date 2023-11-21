CREATE DATABASE IF NOT EXISTS book_store;
USE book_store;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Role;
CREATE TABLE IF NOT EXISTS Role
(
	roleId	  TINYINT UNSIGNED PRIMARY KEY,
    name     VARCHAR(50) NOT NULL

);

CREATE TABLE IF NOT EXISTS Customer
(
	customerId	 SMALLINT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,
    firstName 	VARCHAR(50) NOT NULL,
    lastName	VARCHAR(50) NOT NULL,
    email 		VARCHAR(50),
    phone		VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS User
(
	userName	VARCHAR(50) NOT NULL ,
    password    VARCHAR(50) NOT NULL ,
    PRIMARY KEY (userName, password),
    roleId   	TINYINT UNSIGNED,
    FOREIGN KEY fk_user_role(roleId)
    REFERENCES Role(roleId)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
    customerId SMALLINT UNSIGNED ,
    FOREIGN KEY fk_user_customer(customerId)
    REFERENCES Customer(customerId)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

DROP TABLE IF EXISTS BookCategory;
DROP TABLE IF EXISTS Book;
CREATE TABLE IF NOT EXISTS Book
(
	barcode	  CHAR(10) PRIMARY KEY,
    bookname VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    numberInStock SMALLINT UNSIGNED NOT NULL ,
    ratings float,
    coverLink VARCHAR(255) ,
    people INTEGER
    
);


DROP TABLE IF EXISTS Category;
CREATE TABLE IF NOT EXISTS Category (
    category VARCHAR(50) PRIMARY KEY,
    coverLink VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS BookCategory (
	barcode CHAR(10) NOT NULL,
    category VARCHAR(50) NOT NULL,
    PRIMARY KEY (barcode, category),
    FOREIGN KEY (barcode) REFERENCES Book(barcode),
    FOREIGN KEY (category) REFERENCES Category(category)
);

DROP TABLE IF EXISTS Coupon;
CREATE TABLE IF NOT EXISTS Coupon
(
	couponCode	  CHAR(10) PRIMARY KEY,
    discount FLOAT NOT NULL
);



CREATE TABLE IF NOT EXISTS Rental
(
	rentalId SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	customerId SMALLINT UNSIGNED NOT NULL,
    barcode CHAR(10) NOT NULL,
    couponCode CHAR(10),
	rentDate DATE NOT NULL,
    returnDate DATE,
    FOREIGN KEY fk_Rental_Customer(customerId)
    REFERENCES Customer(customerId)
	ON UPDATE CASCADE
    ON DELETE NO ACTION,
    FOREIGN KEY fk_Rental_Book(barcode)
    REFERENCES Book(barcode)
	ON UPDATE CASCADE
    ON DELETE NO ACTION,
    FOREIGN KEY fk_Rental_Coupon(couponCode)
    REFERENCES Coupon(couponCode)
	ON UPDATE CASCADE
    ON DELETE NO ACTION
    
);


-- Insert roles
INSERT IGNORE INTO Role (roleId, name) VALUES
(1, 'Admin'),
(2, 'User');

-- Insert customers
INSERT IGNORE INTO Customer (firstName, lastName, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678'),
('Robert', 'Johnson', 'robert.johnson@example.com', '555-9876'),
('Alice', 'Williams', 'alice.williams@example.com', '555-4321'),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-8765');

-- Insert coupons
INSERT IGNORE INTO Coupon (couponCode, discount) VALUES
('COUPON1', 0.1),
('COUPON2', 0.2);

-- Insert categories
INSERT IGNORE INTO Category (category,coverLink) VALUES
('Fiction','https://c8.alamy.com/comp/2E1A4R7/fiction-typography-word-cloud-create-with-text-only-2E1A4R7.jpg'),
('Classics','https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvam9iMjE3LWhlaW4tMTBiLnBuZw.png'),
('Mystery','https://upload.wikimedia.org/wikipedia/en/0/05/Mystery.png'),
('Romance','https://as2.ftcdn.net/v2/jpg/03/13/19/89/1000_F_313198932_3YjYbLau7QDKSaZDtHT77Wb8XrICSb0L.jpg'),
('Fantasy','https://as1.ftcdn.net/v2/jpg/00/71/49/44/1000_F_71494439_YlQR5mI03Ukc8kr1DTLX43AnAuy3MJ9l.jpg');

-- Insert books
INSERT IGNORE INTO Book (barcode, bookname, price, numberInStock, ratings,coverLink,people) VALUES
('B001', 'The Great Gatsby', 1.99, 20, 4.5,"https://designforwriters.com/wp-content/uploads/2017/10/design-for-writers-book-cover-tf-2-a-million-to-one.jpg",110),
('B002', 'To Kill a Mockingbird', 2.99, 15, 3.8,"https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/12/attachment_137125302-e1670235568295.jpeg?auto=format&q=60&fit=max&w=930",1210),
('B003', 'The Da Vinci Code', 1.49, 25, 4.2,"https://bukovero.com/wp-content/uploads/2016/07/Harry_Potter_and_the_Cursed_Child_Special_Rehearsal_Edition_Book_Cover.jpg",1140),
('B004', 'Pride and Prejudice', 3.49, 18, 4.7,"https://images.penguinrandomhouse.com/cover/9780593422182",310),
('B005', 'The Hobbit', 2.25, 30, 3.5,"https://m.media-amazon.com/images/I/41gr3r3FSWL.jpg",112),
('B006', 'Saeed Fares', 2.25, 30, 3.5,"https://theretrofuturist.com/wp-content/uploads/2019/01/space-cat-book-cover.jpg",1102);
-- Insert book-category associations
INSERT IGNORE INTO BookCategory (barcode, category) VALUES
('B001', 'Fiction'),
('B001', 'Classics'),
('B002', 'Classics'),
('B002', 'Mystery'),
('B003', 'Mystery'),
('B003', 'Romance'),
('B004', 'Romance'),
('B005', 'Fantasy'),
('B005', 'Fiction');

-- Insert users
INSERT IGNORE INTO User (userName, password, roleId, customerId) VALUES
('admin', 'admin123', 1, 1),
('user1', 'user123', 2, 2);

-- Insert rentals
INSERT IGNORE INTO Rental (customerId, barcode, couponCode, rentDate, returnDate) VALUES
(1, 'B001', 'COUPON1', '2023-01-01', '2023-01-15'),
(2, 'B002', 'COUPON2', '2023-02-01', '2023-02-10'),
(3, 'B003', NULL, '2023-03-01', '2023-03-25'),
(4, 'B004', NULL, '2023-04-01', '2023-04-10'),
(5, 'B005', 'COUPON1', '2023-05-01', '2023-05-18');


