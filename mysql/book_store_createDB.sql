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
    category VARCHAR(50) PRIMARY KEY
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

