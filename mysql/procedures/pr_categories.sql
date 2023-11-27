USE book_store;
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS pr_categories()
BEGIN
	select category as name, coverLink as url 
    from category;
END$$
DELIMITER ;