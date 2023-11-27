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
	bookId	  CHAR(10) PRIMARY KEY,
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
	bookId CHAR(10) NOT NULL,
    category VARCHAR(50) NOT NULL,
    PRIMARY KEY (bookId, category),
    FOREIGN KEY (bookId) REFERENCES Book(bookId),
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
    bookId CHAR(10) NOT NULL,
    couponCode CHAR(10),
	rentDate DATE NOT NULL,
    returnDate DATE,
    FOREIGN KEY fk_Rental_Customer(customerId)
    REFERENCES Customer(customerId)
	ON UPDATE CASCADE
    ON DELETE NO ACTION,
    FOREIGN KEY fk_Rental_Book(bookId)
    REFERENCES Book(bookId)
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
INSERT IGNORE INTO Book (bookId, bookname, price, numberInStock, ratings,coverLink,people) VALUES
('B001', 'Whispers of the Wind', 14.99, 22, 4.2, 'cover_link_1', 720),
('B002', 'Echoes in the Abyss', 16.50, 18, 4.6, 'cover_link_2', 890),
('B003', 'Shadows of Serenity', 19.99, 28, 4.8, 'cover_link_3', 950),
('B004', 'Pride and Prejudice', 3.49, 18, 4.7,"https://images.penguinrandomhouse.com/cover/9780593422182",310),
('B005', 'Lost in Dreams', 18.75, 25, 4.5, 'cover_link_5', 1050),
('B006', 'Eternal Shadows', 22.99, 20, 4.3, 'cover_link_6', 920),
('B007', 'Silent Whispers', 17.50, 30, 4.1, 'cover_link_7', 780),
('B008', 'Midnight Serenade', 20.99, 22, 4.7, 'cover_link_8', 1100),
('B009', 'Whispers of the Wind', 21.25, 28, 4.4, 'cover_link_9', 890),
('B010', 'Enchanted Dreams', 16.99, 35, 4.2, 'cover_link_10', 1200),
('B011', 'Celestial Harmony', 23.50, 19, 4.8, 'cover_link_11', 1050),
('B012', 'Mystic Echoes', 18.99, 26, 4.3, 'cover_link_12', 950),
('B013', 'Harmony\'s Embrace', 22.75, 23, 4.6, 'cover_link_13', 1100),
('B014', 'Moonlit Sonata', 20.99, 30, 4.5, 'cover_link_14', 980),
('B015', 'Sunset Serenity', 19.50, 32, 4.4, 'cover_link_15', 1000),
('B016', 'Whispers in the Dark', 17.99, 27, 4.7, 'cover_link_16', 880),
('B017', 'Ethereal Symphony', 24.25, 21, 4.9, 'cover_link_17', 1150),
('B018', 'Dusk\'s Melody', 16.75, 34, 4.1, 'cover_link_18', 850),
('B019', 'Lunar Lullaby', 21.99, 25, 4.3, 'cover_link_19', 920),
('B020', 'Starlight Serenade', 18.50, 29, 4.6, 'cover_link_20', 1050),
('B021', 'Serenading Shadows', 19.99, 26, 4.5, 'cover_link_21', 940),
('B022', 'Aurora\'s Whisper', 22.50, 23, 4.7, 'cover_link_22', 1050),
('B023', 'Eternal Twilight', 18.25, 28, 4.4, 'cover_link_23', 920),
('B024', 'Cascade of Stars', 21.75, 25, 4.8, 'cover_link_24', 990),
('B025', 'Silent Symphony', 20.50, 31, 4.3, 'cover_link_25', 980),
('B026', 'Nocturnal Rhapsody', 17.99, 30, 4.6, 'cover_link_26', 910),
('B027', 'Starry Reflections', 23.25, 22, 4.9, 'cover_link_27', 1100),
('B028', 'Harbor of Dreams', 18.75, 27, 4.2, 'cover_link_28', 960),
('B029', 'Crimson Horizon', 22.99, 24, 4.5, 'cover_link_29', 1030),
('B030', 'Whimsical Moonlight', 19.50, 29, 4.7, 'cover_link_30', 980),
('B031', 'Enigmatic Shadows', 24.99, 20, 4.3, 'cover_link_31', 1080),
('B032', 'Dawn\'s Reflection', 16.75, 33, 4.6, 'cover_link_32', 920),
('B033', 'Crescent Serenade', 21.25, 26, 4.8, 'cover_link_33', 1020),
('B034', 'Lustrous Nightfall', 19.99, 28, 4.4, 'cover_link_34', 950),
('B035', 'Mystical Radiance', 23.50, 23, 4.9, 'cover_link_35', 1120),
('B036', 'Twilight Harmony', 18.99, 27, 4.5, 'cover_link_36', 970),
('B037', 'Starlit Elegy', 20.75, 32, 4.7, 'cover_link_37', 990),
('B038', 'Orpheus\' Melody', 17.50, 30, 4.2, 'cover_link_38', 910),
('B039', 'Astral Nocturne', 22.25, 25, 4.6, 'cover_link_39', 1050),
('B040', 'Lunar Reverie', 19.50, 29, 4.8, 'cover_link_40', 1000),
('B041', 'Whispers of the Wind', 19.99, 26, 4.5, 'cover_link_41', 940),
('B042', 'Mystic Echoes', 22.50, 23, 4.7, 'cover_link_42', 1050),
('B043', 'Ephemeral Breeze', 18.25, 28, 4.4, 'cover_link_43', 920),
('B044', 'Celestial Zephyr', 21.75, 25, 4.8, 'cover_link_44', 990),
('B045', 'Soothing Gale', 20.50, 31, 4.3, 'cover_link_45', 980),
('B046', 'Astral Whirlwind', 17.99, 30, 4.6, 'cover_link_46', 910),
('B047', 'Gentle Zephyr', 23.25, 22, 4.9, 'cover_link_47', 1100),
('B048', 'Breeze of Dreams', 18.75, 27, 4.2, 'cover_link_48', 960),
('B049', 'Zephyr Serenade', 22.99, 24, 4.5, 'cover_link_49', 1030),
('B050', 'Enchanting Gust', 19.50, 29, 4.7, 'cover_link_50', 980),
('B051', 'Whimsical Zephyr', 24.99, 20, 4.3, 'cover_link_51', 1080),
('B052', 'Gale of Echoes', 16.75, 33, 4.6, 'cover_link_52', 920),
('B053', 'Zephyr Crescendo', 21.25, 26, 4.8, 'cover_link_53', 1020),
('B054', 'Lullaby of the Wind', 19.99, 28, 4.4, 'cover_link_54', 950),
('B055', 'Zephyr Sonata', 23.50, 23, 4.9, 'cover_link_55', 1120),
('B056', 'Aeolian Serenity', 18.99, 27, 4.5, 'cover_link_56', 970),
('B057', 'Zephyr Reverie', 20.75, 32, 4.7, 'cover_link_57', 990),
('B058', 'Serenity\'s Whispers', 17.50, 30, 4.2, 'cover_link_58', 910),
('B059', 'Zephyr Adagio', 22.25, 25, 4.6, 'cover_link_59', 1050),
('B060', 'Harmony in the Breeze', 19.50, 29, 4.8, 'cover_link_60', 1000),
('B061', 'Lost in Translation', 18.50, 28, 4.4, 'cover_link_61', 950),
('B062', 'Echoes of Eternity', 23.75, 22, 4.9, 'cover_link_62', 1080),
('B063', 'Whispers of Wisdom', 19.99, 27, 4.5, 'cover_link_63', 970),
('B064', 'Celestial Harmony', 21.25, 26, 4.8, 'cover_link_64', 1030),
('B065', 'Serenade of Dreams', 20.50, 31, 4.3, 'cover_link_65', 980),
('B066', 'Astral Lullaby', 17.99, 30, 4.6, 'cover_link_66', 920),
('B067', 'Gentle Whirlwind', 23.25, 21, 4.7, 'cover_link_67', 1090),
('B068', 'Breeze of Serenity', 18.75, 27, 4.2, 'cover_link_68', 960),
('B069', 'Zephyr Nocturne', 22.99, 24, 4.5, 'cover_link_69', 1020),
('B070', 'Enchanted Zephyr', 19.50, 29, 4.7, 'cover_link_70', 980),
('B071', 'Whimsical Gust', 24.99, 20, 4.3, 'cover_link_71', 1080),
('B072', 'Gale of Whispers', 16.75, 32, 4.6, 'cover_link_72', 920),
('B073', 'Zephyr Rhapsody', 21.25, 25, 4.8, 'cover_link_73', 1020),
('B074', 'Lullaby in the Breeze', 19.99, 28, 4.4, 'cover_link_74', 950),
('B075', 'Zephyr Minuet', 23.50, 23, 4.9, 'cover_link_75', 1120),
('B076', 'Aeolian Reverie', 18.99, 26, 4.5, 'cover_link_76', 970),
('B077', 'Zephyr Interlude', 20.75, 31, 4.7, 'cover_link_77', 990),
('B078', 'Serenity\'s Echo', 17.50, 30, 4.2, 'cover_link_78', 910),
('B079', 'Zephyr Overture', 22.25, 25, 4.6, 'cover_link_79', 1050),
('B080', 'Harmony in the Zephyr', 19.50, 29, 4.8, 'cover_link_80', 1000),
('B081', 'Ephemeral Odyssey', 22.99, 24, 4.5, 'cover_link_81', 1020),
('B082', 'Lunar Serenade', 19.75, 27, 4.8, 'cover_link_82', 970),
('B083', 'Stellar Ballad', 21.50, 26, 4.3, 'cover_link_83', 990),
('B084', 'Galactic Nocturne', 20.25, 31, 4.7, 'cover_link_84', 920),
('B085', 'Celestial Waltz', 18.99, 30, 4.2, 'cover_link_85', 950),
('B086', 'Orion\'s Lullaby', 23.25, 21, 4.6, 'cover_link_86', 1080),
('B087', 'Aurora Rhapsody', 17.50, 27, 4.9, 'cover_link_87', 960),
('B088', 'Nebula Minuet', 22.75, 24, 4.4, 'cover_link_88', 1030),
('B089', 'Cosmic Whispers', 19.50, 29, 4.7, 'cover_link_89', 980),
('B090', 'Eternal Zephyr', 24.99, 20, 4.5, 'cover_link_90', 1080),
('B091', 'Astral Serenity', 16.75, 32, 4.6, 'cover_link_91', 920),
('B092', 'Galactic Echo', 21.25, 25, 4.8, 'cover_link_92', 1020),
('B093', 'Stellar Sonata', 19.99, 28, 4.4, 'cover_link_93', 950),
('B094', 'Celestial Overture', 23.50, 23, 4.9, 'cover_link_94', 1120),
('B095', 'Aurora Minuet', 18.99, 26, 4.5, 'cover_link_95', 970),
('B096', 'Ethereal Waltz', 20.75, 31, 4.7, 'cover_link_96', 990),
('B097', 'Orion\'s Reverie', 17.50, 30, 4.2, 'cover_link_97', 910),
('B098', 'Nebula Interlude', 22.25, 25, 4.6, 'cover_link_98', 1050),
('B099', 'Lunar Lullaby', 19.50, 29, 4.8, 'cover_link_99', 1000),
('B100', 'Cosmic Harmony', 21.75, 28, 4.3, 'cover_link_100', 990);


-- Insert book-category associations
INSERT IGNORE INTO BookCategory (bookId, category) VALUES
-- Insert book-category associations
INSERT IGNORE INTO BookCategory (bookId, category) VALUES
('B001', 'Fiction'),
('B001', 'Classics'),
('B002', 'Classics'),
('B002', 'Mystery'),
('B003', 'Mystery'),
('B003', 'Romance'),
('B004', 'Romance'),
('B005', 'Fantasy'),
('B005', 'Fiction'),
('B006', 'Mystery'),
('B006', 'Romance'),
('B007', 'Fantasy'),
('B007', 'Fiction'),
('B008', 'Classics'),
('B008', 'Mystery'),
('B009', 'Romance'),
('B009', 'Fantasy'),
('B010', 'Fiction'),
('B010', 'Mystery'),
('B011', 'Fantasy'),
('B011', 'Fiction'),
('B012', 'Classics'),
('B012', 'Romance'),
('B013', 'Romance'),
('B013', 'Fantasy'),
('B014', 'Fiction'),
('B014', 'Mystery'),
('B015', 'Mystery'),
('B015', 'Romance'),
('B016', 'Fantasy'),
('B016', 'Fiction'),
('B017', 'Classics'),
('B017', 'Mystery'),
('B018', 'Romance'),
('B018', 'Fantasy'),
('B019', 'Fiction'),
('B019', 'Mystery'),
('B020', 'Fantasy'),
('B020', 'Fiction'),
('B021', 'Mystery'),
('B021', 'Romance'),
('B022', 'Fantasy'),
('B022', 'Fiction'),
('B023', 'Classics'),
('B023', 'Mystery'),
('B024', 'Romance'),
('B024', 'Fantasy'),
('B025', 'Fiction'),
('B025', 'Mystery'),
('B026', 'Mystery'),
('B026', 'Romance'),
('B027', 'Fantasy'),
('B027', 'Fiction'),
('B028', 'Classics'),
('B028', 'Mystery'),
('B029', 'Romance'),
('B029', 'Fantasy'),
('B030', 'Fiction'),
('B030', 'Mystery'),
('B031', 'Fantasy'),
('B031', 'Fiction'),
('B032', 'Classics'),
('B032', 'Romance'),
('B033', 'Romance'),
('B033', 'Fantasy'),
('B034', 'Fiction'),
('B034', 'Mystery'),
('B035', 'Mystery'),
('B035', 'Romance'),
('B036', 'Fantasy'),
('B036', 'Fiction'),
('B037', 'Classics'),
('B037', 'Mystery'),
('B038', 'Romance'),
('B038', 'Fantasy'),
('B039', 'Fiction'),
('B039', 'Mystery'),
('B040', 'Fantasy'),
('B040', 'Fiction'),
('B041', 'Mystery'),
('B041', 'Romance'),
('B042', 'Fantasy'),
('B042', 'Fiction'),
('B043', 'Classics'),
('B043', 'Mystery'),
('B044', 'Romance'),
('B044', 'Fantasy'),
('B045', 'Fiction'),
('B045', 'Mystery'),
('B046', 'Mystery'),
('B046', 'Romance'),
('B047', 'Fantasy'),
('B047', 'Fiction'),
('B048', 'Classics'),
('B048', 'Mystery'),
('B049', 'Romance'),
('B049', 'Fantasy'),
('B050', 'Fiction'),
('B050', 'Mystery'),
('B051', 'Fantasy'),
('B051', 'Fiction'),
('B052', 'Classics'),
('B052', 'Romance'),
('B053', 'Romance'),
('B053', 'Fantasy'),
('B054', 'Fiction'),
('B054', 'Mystery'),
('B055', 'Mystery'),
('B055', 'Romance'),
('B056', 'Fantasy'),
('B056', 'Fiction'),
('B057', 'Classics'),
('B057', 'Mystery'),
('B058', 'Romance'),
('B058', 'Fantasy'),
('B059', 'Fiction'),
('B059', 'Mystery'),
('B060', 'Fantasy'),
('B060', 'Fiction'),
('B061', 'Mystery'),
('B061', 'Romance'),
('B062', 'Fantasy'),
('B062', 'Fiction'),
('B063', 'Classics'),
('B063', 'Mystery'),
('B064', 'Romance'),
('B064', 'Fantasy'),
('B065', 'Fiction'),
('B065', 'Mystery'),
('B066', 'Mystery'),
('B066', 'Romance'),
('B067', 'Fantasy'),
('B067', 'Fiction'),
('B068', 'Classics'),
('B068', 'Mystery'),
('B069', 'Romance'),
('B069', 'Fantasy'),
('B070', 'Fiction'),
('B070', 'Mystery'),
('B071', 'Fantasy'),
('B071', 'Fiction'),
('B072', 'Classics'),
('B072', 'Romance'),
('B073', 'Romance'),
('B073', 'Fantasy'),
('B074', 'Fiction'),
('B074', 'Mystery'),
('B075', 'Mystery'),
('B075', 'Romance'),
('B076', 'Fantasy'),
('B076', 'Fiction'),
('B077', 'Classics'),
('B077', 'Mystery'),
('B078', 'Romance'),
('B078', 'Fantasy'),
('B079', 'Fiction'),
('B079', 'Mystery'),
('B080', 'Fantasy'),
('B080', 'Fiction'),
('B081', 'Fiction'),
('B083', 'Classics'),
('B083', 'Mystery'),
('B084', 'Romance'),
('B084', 'Fantasy'),
('B085', 'Fiction'),
('B085', 'Mystery'),
('B086', 'Mystery'),
('B086', 'Romance'),
('B087', 'Fantasy'),
('B087', 'Fiction'),
('B088', 'Classics'),
('B088', 'Mystery'),
('B089', 'Romance'),
('B089', 'Fantasy'),
('B090', 'Fiction'),
('B090', 'Mystery'),
('B091', 'Fantasy'),
('B091', 'Fiction'),
('B092', 'Classics'),
('B092', 'Romance'),
('B093', 'Romance'),
('B093', 'Fantasy'),
('B094', 'Fiction'),
('B094', 'Mystery'),
('B095', 'Mystery'),
('B095', 'Romance'),
('B096', 'Fantasy'),
('B096', 'Fiction'),
('B097', 'Classics'),
('B097', 'Mystery'),
('B098', 'Romance'),
('B098', 'Fantasy'),
('B099', 'Fiction'),
('B099', 'Mystery'),
('B0100', 'Fantasy'),
('B0100', 'Fiction'),


-- Insert users
INSERT IGNORE INTO User (userName, password, roleId, customerId) VALUES
('admin', 'admin123', 1, 1),
('user1', 'user123', 2, 2);

-- Insert rentals
INSERT IGNORE INTO Rental (customerId, bookId, couponCode, rentDate, returnDate) VALUES
(1, 'B001', 'COUPON1', '2023-01-01', '2023-01-15'),
(2, 'B002', 'COUPON2', '2023-02-01', '2023-02-10'),
(3, 'B003', NULL, '2023-03-01', '2023-03-25'),
(4, 'B004', NULL, '2023-04-01', '2023-04-10'),
(5, 'B005', 'COUPON1', '2023-05-01', '2023-05-18');


