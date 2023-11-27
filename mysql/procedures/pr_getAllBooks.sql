USE book_store;
DELIMITER $$
DROP PROCEDURE IF EXISTS pr_getAllBooks;
CREATE PROCEDURE IF NOT EXISTS pr_getAllBooks()
BEGIN

	SELECT bookname as name,coverLink as link,ratings as rate,price,people FROM Book;
    
END$$
DELIMITER ;