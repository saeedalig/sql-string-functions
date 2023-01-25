CREATE DATABASE string_function;
USE string_function;


CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from books;


/* CONCAT() combines two or more strings into one*/

SELECT CONCAT(author_fname,' ', author_lname) as full_name from books; # Full name of author
    
    
/*LENGTH() - returns the length of a string*/
select title ,length(title) as char_len from books;

# CHAR_LENGHT() == LENGHT()
select TITLE, char_length(TITLE) as char_len FROM BOOKS;

/*SUBSTRING() - extracts a portion of a string.  title --String, 3-- position, 5-- elements to be extracted*/
SELECT title,  SUBSTRING(title, 3, 5) as substring FROM books;

SELECT title,  SUBSTRING(title, 3) as substring FROM books;  # RETURNS STRING FROM 3 POSITION ONWORD

SELECT title,  SUBSTRING(title, -3) as substring FROM books;  # RETURNS FROM RIGHT HAND SIDE -VE indexing 

/*SUBSTRING = SUBSTR*/
SELECT CONCAT(SUBSTR(title,1,10),'...') FROM books; # shorten book's title 

/*UPPER()  - converts a string to uppercase 
First concatenating and then converting into uppercase*/
select author_fname, author_lname ,  UPPER(CONCAT(author_fname,' ', author_lname)) as full_name_upr from books;


/*LOWER()  - converts a string to lowercase 
First concatenating and then converting into lowercase*/
select author_fname, author_lname ,  LOWER(CONCAT(author_fname,' ', author_lname)) as full_name_upr from books;


# TRIM() - removes leading and trailing spaces from a string
select trim("   MySql   ");

# LTRIM() / RTRIM() - removes leading or trailing spaces from a string
select ltrim("   MySql   ");
select rtrim("   MySql   ");

# REPLACE() - replaces all occurrences of a substring with another string
SELECT REPLACE('Hello, World!', 'World', 'Universe') AS replaced_string;  # replace(str, oldstr, newstr)

# Adding a dummy culomn
ALTER TABLE books 
ADD COLUMN sir_name varchar(40)
AFTER author_lname;

# Updating/ inserting data into column using 'IN Operator'
UPDATE books
SET sir_name = "MADAM"
WHERE book_id IN (1,2,3,4,5,6,7,8,9);

UPDATE books
SET sir_name= "My Dear Mr"
WHERE book_id >= 10;

# Replaceing My Dear Mr with Mr
UPDATE books SET sir_name = REPLACE(sir_name, 'My Dear Mr', 'Mr');

# Replaceing MADAM with Mrs
UPDATE books SET sir_name = REPLACE(sir_name, 'MADAM', 'Mrs');


   
# LPAD() / RPAD() - pads a string with specified characters
	SELECT RPAD('Hello', 10, '*') AS padded_string;  ## Add 5 * to right of Hello
    SELECT LPAD('Hello', 10, '*') AS padded_string;  ## Add 5 * to left of Hello
    
    
# CONCAT_WS() - concatenates two or more strings with a separator
	SELECT author_fname, author_lname, CONCAT_WS(' - ',author_fname,author_lname) as full_name FROM books;
    
    SELECT author_fname, author_lname, CONCAT_WS(', ', author_fname, author_lname) FROM books WHERE author_fname IS NOT NULL;
    

# INSTR() - returns the position of the first occurrence of a substring in a string
	SELECT INSTR('Hello, World!', 'World') AS position;

# INSTR() == LOCATE()
# LOCATE() - returns the position of the first occurrence of a substring in a string (similar to INSTR)
    SELECT LOCATE('World', 'Hello, World!') AS position;
    
    
    
# LEFT() / RIGHT() - returns a specified number of characters from the left or right of a string
	 SELECT title , LEFT(title, 3) as left_str from books;
     
     SELECT title , RIGHT(title, 3) AS right_str from books;


# MID() - returns a specified number of characters from a string, starting from a given position
	SELECT MID('Hello, World!', 8, 6) AS substring;  # start_pos--8th, tot_str--6

    

# REVERSE() - reverses the order of characters in a string
	SELECT REVERSE('Hello, World!') AS reversed_string;
    
	SELECT title, REVERSE(title) AS reversed_string from books;
    
    SELECT * FROM books WHERE REVERSE(title) = 'ekasemaN ehT'; # find the reversed srting 


# FORMAT() - formats a number with a specified number of decimal places( ROUNDING ) 
	    select format(12345.6789, 3) as formatted;  
        select format(12345.6789, 1) as formatted; 
        select format(12345.6789, 6) as formatted; 
 
# INSERT() - inserts a string into another string at a specified position
		Select insert('DATA SCIENCE',5, 1,'ds') as my_str; # str, pos, len, new_str
		Select insert('MySql-Function',6,1,'String') as my_str;  
            
   
# REPEAT() - repeats a string a specified number of times
	SELECT REPEAT('Hello,', 3)AS repeated; 
    SELECT REPEAT('*', 5) AS repeated;


SELECT CONCAT(SUBSTR(title,1,10),'...') AS 'short title',
	CONCAT(author_lname,',',author_fname) AS author,
	CONCAT(stock_quantity,' in stock') AS quantity
FROM books
ORDER BY 1;
   
