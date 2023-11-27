

USE book_store;
DELIMITER $$
DROP PROCEDURE IF EXISTS pr_getRecentBooks;
CREATE PROCEDURE IF NOT EXISTS pr_getRecentBooks()
BEGIN

	SELECT bookname as name,coverLink as link,ratings as rate,price,people FROM Book
order by bookId desc
limit 5;
    
END$$
DELIMITER ;