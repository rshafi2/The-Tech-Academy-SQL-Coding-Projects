CREATE DATABASE LibraryManagementSystem; 

USE LibraryManagementSystem;



CREATE TABLE LIBRARY_BRANCH (

	BranchID INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	BranchName VARCHAR(120) NOT NULL, 
	Address VARCHAR(120) NOT NULL
); 



CREATE TABLE PUBLISHER (

	PublisherName VARCHAR(120) NOT NULL PRIMARY KEY, 
	Address VARCHAR(120) NOT NULL, 
	Phone VARCHAR (15) NOT NULL
); 



CREATE TABLE BOOKS (

	BookID INT PRIMARY KEY NOT NULL IDENTITY(200,1), 
	Title VARCHAR(120) NOT NULL,   
	PublisherName VARCHAR(120) NOT NULL CONSTRAINT FK_BOOKS_PUBLISHER FOREIGN KEY (PublisherName) REFERENCES PUBLISHER (PublisherName)ON UPDATE CASCADE ON DELETE CASCADE 
	
	);



CREATE TABLE BOOK_COPIES (
	
	BookID INT NOT NULL  CONSTRAINT FK_BOOKCOPIES_BOOKS FOREIGN KEY (BookID) REFERENCES BOOKS (BookID)ON UPDATE CASCADE ON DELETE CASCADE, 
	BranchID INT NOT NULL  CONSTRAINT FK_BOOKCOPIES_LIBRARYBRANCH FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH (BranchID)ON UPDATE CASCADE ON DELETE CASCADE, 
	Number_of_Copies INT NOT NULL 
);


 

CREATE TABLE BORROWER (
	
	CardNo INT NOT NULL PRIMARY KEY IDENTITY(500,1), 
	Name VARCHAR(120) NOT NULL, 
	Address VARCHAR(120) NOT NULL, 
	Phone VARCHAR(15) NOT NULL 
);


CREATE TABLE BOOK_LOANS ( 
	
	BookID INT NOT NULL 
	CONSTRAINT FK_BOOKLOANS_BOOKS FOREIGN KEY (BookID) REFERENCES BOOKS (BookID)ON UPDATE CASCADE ON DELETE CASCADE, 
	BranchID INT NOT NULL  CONSTRAINT FK_BOOKLOANS_LIBRARYBRANCH FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH (BranchID) ON UPDATE CASCADE ON DELETE CASCADE, 
	CardNo INT NOT NULL  CONSTRAINT FK_BOOKLOANS_BORROWER FOREIGN KEY (CardNo) REFERENCES BORROWER (CardNo) ON UPDATE CASCADE ON DELETE CASCADE, 
	DateOut DATE NOT NULL, 
	DateDue DATE NOT NULL 
);




CREATE TABLE BOOK_AUTHORS (
	
	BookID INT NOT NULL 
	CONSTRAINT FK_BOOKAUTHORS_BOOKS FOREIGN KEY (BookID) REFERENCES BOOKS (BookID)ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(120) NOT NULL

); 

INSERT INTO LIBRARY_BRANCH (BranchName, Address) 
		
	VALUES 
	('Sharpstown', 'Houston, Texas'), 
	('Central', 'Los Angeles, California'),
	('Baisley Park', 'Jamaica, NY'), 
	('Bayside', 'Bayside, NY'), 
	('Broadway', 'Long Island City, NY')

	;

	Select * from LIBRARY_BRANCH;


	INSERT INTO PUBLISHER (PublisherName, Address, Phone) 
		
	VALUES 
	('Penguin Random House', 'New York, NY', '254-655-1524'), 
	('Hachette Livre', 'Paris,France', '452-693-8756'),
	('Springer Nature', 'Berlin, Germany', '321-655-7890'), 
	('Scholastica', 'Chicago, Illinois', '521-855-7530'), 
	('Wiley', 'Hoboken, NJ', '258-753-1236'),
	('McGraw-Hill Education', 'New York, NY', '123-654-7896'), 
	('Harper Collins', 'New York,NY', '123-534-6987'),
	('Cengage', 'Boston, MA', '852-791-3694'), 
	('Houghton Mifflin Harcourt', 'Boston, MA', '254-963-9547'), 
	('Macmillan Publishers', 'London, United Kingdom', '741-258-9517'),
	('Scribner', 'New York, NY', '248-365-9517'),
	('Crown/Archetype', 'New York, NY', '258-369-3578'),
	('Random House Publishing Group', 'New York, NY', '123-456-4567'), 
	('Crown Publishing Group', 'New York, NY', '258-369-1478'), 
	('HarperCollins Publishers', 'New York, NY', '147-852-9631'), 
	('Penguin Publishing Group', 'East Rutherford, NJ', '852-741-9632'), 
	('Penguin Young Readers Group', 'New York, NY', '145-365-7896'), 
	('Knopf Doubleday Publishing Group', 'New York, NY', '258-963-7416'), 
	('Gallery Books', 'New York, NY', '258-789-3576'),
	('Simon & Schuster', 'New York, NY', '159-357-8526'),
	('Scholastic, Inc.', 'New York, NY', '125-953-2587'),
	('CreateSpace Publishing', '', '259-793-9573')
	
	UPDATE PUBLISHER
	SET Address = 'Scotts Valley, CA'
	WHERE PublisherName = 'CreateSpace Publishing';

	Select * from PUBLISHER;


	INSERT INTO BOOKS(Title, PublisherName) 
		
	VALUES 
	('The Nickel Boys','Penguin Random House'), 
	('Give Me Your Hand','Hachette Livre' ),
	('Blockchain Basics','Springer Nature'), 
	('To Kill A Mockingbird','Scholastica'), 
	('Lithospheric Discontinues','Wiley' ),
	('The Art of Computer Game Design','McGraw-Hill Education' ), 
	('How to Not Always Be Working','Harper Collins' ),
	('Christine','Cengage'), 
	('Maybe You Should Talk To Someone','Houghton Mifflin Harcourt'), 
	('Amity and Prosperity','Macmillan Publishers'),
	('The Lost Tribe','CreateSpace Publishing'),
	('It', 'Scribner'), 
	('The Institute', 'Scribner'),
	('Educated','Random House Publishing Group'),
	('Becoming','Crown Publishing Group'),
	('The Immortal Life of Henrietta Lacks','Crown/Archetype'),
	('The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life','HarperCollins Publishers'),
	('Burn After Writing','Penguin Publishing Group'),
	('Crossed','Penguin Young Readers Group'),
	('Hiroshima','knopf Doubleday Publishing Group'),
	('How to Win Friends and Influence People', 'Gallery Books'),
	('The 7 Habits of Highly Effective People','Simon & Schuster'),
	('Harry Potter and the Sorcerer''s Stone', 'Scholastic, Inc.'), 
	('Harry Potter and the Chamber of Secrets', 'Scholastic, Inc.'), 
	('Harry Potter and the Prisoner of Azkaban', 'Scholastic, Inc.'), 
	('Harry Potter and the Goblet of Fire', 'Scholastic, Inc.'), 
	('Harry Potter and the Order of the Phoenix', 'Scholastic, Inc.'), 
	('Harry Potter and the Half-Blood Prince', 'Scholastic, Inc.'), 
	('Harry Potter and the Deathly Hallows', 'Scholastic, Inc.');

	Select * from BOOKS;


	/*SET IDENTITY_INSERT BOOKS Off  -- Statement Allows explicit values to be inserted into 
                                -- the identity column of a table.
    GO*/

	INSERT INTO BOOK_COPIES(BookID, BranchID, Number_of_Copies)

	VALUES 
	(200, 1,10), 
	(201, 1,10),
	(202, 1,10),
	(203, 1,10),
	(204, 1,10),
	(201, 2,10), 
	(202, 2,10),
	(203, 2,10),
	(221, 2,10),
	(220, 2,10),
	(218, 2,10),
	(225, 2,10),
	(202, 3,10), 
	(208, 3,10),
	(211, 3,10),
	(215, 3,10),
	(219, 3,10),
	(217, 3,10),
	(203, 4,10), 
	(202, 4,10),
	(207, 4,10),
	(211, 4,10),
	(219, 4,10),
	(221, 4,10),
	(223, 4,10),
	(201, 5,10), 
	(201, 5,10), 
	(207, 5,10), 
	(204, 5,10), 
	(204, 5,10), 
	(210, 5,10), 
	(211, 5,10), 
	(205, 1,10), 
	(206, 2,10), 
	(207, 3,10), 
	(208, 4,10), 
	(209, 5,10), 
	(210, 1,10), 
	(211, 2,10), 
	(212, 3,10), 
	(213, 4,10),
	(214, 5,10), 
	(215, 1,10), 
	(216, 2,10), 
	(217, 3,10), 
	(218, 4,10), 
	(219, 5,10), 
	(220, 1,10), 
	(221, 2,10), 
	(222, 3,10),
	(223, 4,10), 
	(224, 5,10), 
	(225, 1,10), 
	(226, 2,10), 
	(227, 3, 10),
	(228, 4, 10), 
	(212, 2, 10)
;

SELECT * from BOOK_LOANS; 

INSERT INTO BORROWER(Name, Address, Phone) 

VALUES 
	('Aniel Hernandez', 'Bayside, NY', '258-942-3691'), 
	('Samira Hekmaty', 'Long Island City, NY', '756-984-1245'), 
	('Aklima Khatun', 'Jamaica, NY', '159-753-1563'), 
	('Jamil Zaman', 'Jamaica, NY', '718-145-7536'), 
	('Sharika Khatun', 'Jamaica, NY', '126-589-1472'), 
	('Ishak Khan', 'Bayside, NY', '159-753-3975'), 
	('Bablu Sheikh', 'Long Island City, NY', '147-967-4561'), 
	('Faruq Khan', 'Houston, Texas', '123-789-1593'), 
	('Wilber Hernandez', 'Los Angeles, CA', '753-912-3691'), 
	('Jane Smith', 'Los Angeles, CA', '496-975-3451'), 
	('Leo Smith', 'Bayside, NY', '719-212-1291'), 
	('Abdul Malek', 'Houston, Texas', '128-931-1456'), 
	('Zafrin Hussain', 'Long Island City, NY', '128-456-1456'), 
	('Kobe Bryant', 'Los Angeles, CA', '147-6945-1291'), 
	('Russell Westbrook', 'Houston, Texas', '252-147-3581');

	SELECT * FROM BORROWER,BOOK_LOANS;	
	SELECT * FROM BORROWER; 
	SELECT * FROM BOOK_LOANS;

INSERT INTO BOOK_LOANS(BookID, BranchID, CardNo, DateOut, DateDue)

VALUES 
(200, 1, 514, '2019-01-01', '2019-02-01'), 
(201, 1, 514, '2019-01-01', '2019-02-01'),
(202, 1, 514, '2019-01-01', '2019-02-01'),
(203, 1, 514, '2019-01-01', '2019-02-01'),
(204, 1, 514, '2019-01-01', '2019-02-01'),
(205, 1, 514, '2019-01-01', '2019-02-01'),
(206, 2, 513, '2019-01-01', '2019-02-01'),
(207, 2, 513, '2019-01-01', '2019-02-01'),
(208, 2, 513, '2019-01-01', '2019-02-01'),
(209, 2, 513, '2019-01-01', '2019-02-01'),
(210, 2, 513, '2019-01-01', '2019-02-01'), 
(211, 2, 513, '2019-01-01', '2019-02-01'),
(212, 2, 513, '2019-01-01', '2019-02-01'),
(213, 3, 503, '2019-01-01', '2019-02-01'),
(214, 3, 503, '2019-01-01', '2019-02-01'),
(215, 3, 503, '2019-01-01', '2019-02-01'),
(216, 3, 503, '2019-01-01', '2019-02-01'),
(217, 3, 503, '2019-01-01', '2019-02-01'),
(218, 3, 503, '2019-01-01', '2019-02-01'),
(219, 3, 503, '2019-01-01', '2019-02-01'),
(220, 3, 503, '2019-01-01', '2019-02-01'), 
(221, 4, 504, '2019-01-01', '2019-02-01'),
(222, 4, 504, '2019-01-01', '2019-02-01'),
(223, 4, 504, '2019-01-01', '2019-02-01'),
(224, 4, 504, '2019-01-01', '2019-02-01'),
(225, 4, 504, '2019-01-01', '2019-02-01'),
(226, 5, 501, '2019-01-01', '2019-02-01'),
(227, 5, 501, '2019-01-01', '2019-02-01'),
(228, 5, 501, '2019-01-01', '2019-02-01'), 
(200, 3, 502, '2019-01-01', '2019-02-01'), 
(201, 3, 502, '2019-01-01', '2019-02-01'),
(202, 3, 502, '2019-01-01', '2019-02-01'),
(203, 4, 505, '2019-01-01', '2019-02-01'),
(204, 4, 505, '2019-01-01', '2019-02-01'),
(205, 4, 505, '2019-01-01', '2019-02-01'),
(206, 5, 506, '2019-01-01', '2019-02-01'),
(207, 5, 506, '2019-01-01', '2019-02-01'),
(208, 5, 506, '2019-01-01', '2019-02-01'),
(209, 1, 507, '2019-01-01', '2019-02-01'),
(210, 1, 507, '2019-01-01', '2019-02-01'), 
(211, 1, 507, '2019-01-01', '2019-02-01'),
(212, 2, 508, '2019-01-01', '2019-02-01'),
(213, 2, 508, '2019-01-01', '2019-02-01'),
(214, 2, 508, '2019-01-01', '2019-02-01'),
(215, 2, 509, '2019-01-01', '2019-02-01'),
(216, 2, 509, '2019-01-01', '2019-02-01'),
(217, 2, 509, '2019-01-01', '2019-02-01'),
(218, 4, 510, '2019-01-01', '2019-02-01'),
(219, 4, 510, '2019-01-01', '2019-02-01'),
(220, 4, 510, '2019-01-01', '2019-02-01'), 
(221, 1, 511, '2019-01-01', '2019-02-01'),
(222, 1, 511, '2019-01-01', '2019-02-01'),
(223, 1, 511, '2019-01-01', '2019-02-01'),
(224, 1, 511, '2019-01-01', '2019-02-01'),
(225, 1, 511, '2019-01-01', '2019-02-01'),
(226, 5, 501, '2019-01-01', '2019-02-01'),
(227, 5, 501, '2019-01-01', '2019-02-01'),
(228, 5, 501, '2019-01-01', '2019-02-01');


Select * from BOOKS, BOOK_COPIES, LIBRARY_BRANCH;

INSERT INTO BOOK_AUTHORS(BookID, AuthorName) 

VALUES 
(200, 'Colson Whitehead'), 
(201, 'Megan Abbott'), 
(202, 'Daniel Drescher'), 
(203, 'Harper Lee'), 
(204, 'Huaiyu Yuan'), 
(205, 'Chris Crawford'), 
(206, 'Marlee Grace'), 
(207, 'Stephen King'), 
(208, 'Lori Gottlieb'), 
(209, 'Eliza Griswold'), 
(210, 'Matthew Caldwell'), 
(211, 'Stephen King'), 
(212, 'Stephen King'),  
(213, 'Tara Westover'), 
(214, 'Michelle Obama'), 
(215, 'Rebecca Skloot'), 
(216, 'Mark Manson'), 
(217, 'Sharon Jones'), 
(218, 'Ally Condie'), 
(219, 'John Hersey'), 
(220, 'Dale Carnegie'), 
(221, 'Stephen Covey'), 
(222, 'J.K. Rowling'), 
(223, 'J.K. Rowling'),
(224, 'J.K. Rowling'),
(225, 'J.K. Rowling'),
(226, 'J.K. Rowling'),
(227, 'J.K. Rowling'),
(228, 'J.K. Rowling');

SELECT * FROM BORROWER, BOOK_LOANS; 


/*Questions # 1 */
GO
CREATE PROC spGetCopies
AS
Select Number_of_Copies 
FROM ((BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID)
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID)
WHERE BranchName = 'Sharpstown' AND Title = 'The Lost Tribe'
GO

EXEC spGetCopies



/*Questions # 2 */
GO
CREATE PROC spGetCopiesAllBranches
AS
Select Number_of_Copies 
FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
WHERE Title = 'The Lost Tribe'
GO

EXECUTE spGetCopiesAllBranches





/*Questions # 3 */
GO
CREATE PROC spBorrowerName
AS
Select [Name]
FROM BORROWER WHERE BORROWER.CardNo NOT IN ( SELECT DISTINCT BOOK_LOANS.CardNo FROM BOOK_LOANS)
GO

EXEC spBorrowerName



/*Questions # 4 */

GO
CREATE PROC spBranchOne 
AS
SELECT BOOKS.Title, BORROWER.Name, BORROWER.Address
FROM BORROWER 
INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
INNER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID
WHERE DateDue = '2019-02-01' AND BranchID = 1; 
GO

EXEC spBranchOne






/*Questions # 5 */
GO
ALTER PROC spBranchBooks
AS
SELECT BranchName, COUNT(*) AS NumberOfBooks
FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
GROUP BY BranchName;
GO

EXEC spBranchBooks

/*Questions # 6 */
GO 
ALTER PROC spMoreThanFive
AS
SELECT BORROWER.Name, BORROWER.Address, BORROWER.CardNo
FROM BOOK_LOANS
INNER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo
GROUP BY BORROWER.Name, BORROWER.Address, BORROWER.CardNo
HAVING COUNT(*)>5;	
GO

Exec spMoreThanFive

/*Questions #7  */
GO
CREATE PROC spStephenKing
AS
SELECT BOOKS.Title, BOOK_COPIES.Number_of_Copies 
FROM BOOK_COPIES
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
INNER JOIN BOOK_AUTHORS ON BOOKS.BookID = BOOK_AUTHORS.BookID
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central';	
GO 

exec spStephenKing