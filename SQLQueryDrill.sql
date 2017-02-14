USE MASTER
GO

IF EXISTS(SELECT * from sys.databases WHERE name='Library')
BEGIN
	DROP DATABASE Library;
END

CREATE DATABASE Library;
GO


USE Library
GO


CREATE TABLE Book
	(BookID int PRIMARY KEY NOT NULL,
	 Title varchar(50) NOT NULL,
	 PublisherName varchar(50) NOT NULL)
GO


CREATE TABLE Book_Authors
	(BookID int NOT NULL,
	 AuthorName varchar(50) NOT NULL)
GO


CREATE TABLE Publisher
	(Name varchar(50) PRIMARY KEY NOT NULL,
	 Address nvarchar(80) NULL,
	 Phone varchar(15) NULL)
GO


CREATE TABLE Book_Copies
	(BookID int NOT NULL,
	 BranchID int NOT NULL,
	 No_Of_Copies int NULL)
GO


CREATE TABLE Book_Loans
	(BookID int NOT NULL,
	 BranchID int NOT NULL,
	 CardNo bigint NOT NULL,
	 DateOut varchar(50) NOT NULL,
	 DueDate varchar(50) NOT NULL)
GO


CREATE TABLE Library_Branch
	(BranchID int PRIMARY KEY NOT NULL,
	 BranchName varchar(50) NULL,
	 Address nvarchar(80) NULL)
GO


CREATE TABLE Borrower
	(CardNo bigint PRIMARY KEY NOT NULL,
	 Name varchar(50) NULL,
	 Address nvarchar(80) NULL,
	 Phone varchar(15) NULL,
	 NumberOfBooks int NULL,
	 CheckedOutBooks binary NOT NULL)
GO


INSERT dbo.Book (BookID, Title, PublisherName)
	VALUES (1, 'Don Quixote', 'Francisco de Robles'),
		(2, 'Alice in Wonderland', 'Macmillan Publishers'),
		(3, 'Huckleberry Finn', 'Chatto & Windus'),
		(4, 'The Lost Tribe', 'Bantam'),
		(5, 'The Sound and the Fury', 'Jonathan Cape'),
		(6, 'The Scarlet Letter', 'Ticknor and Fields'),
		(7, 'The Shining', 'Doubleday'),
		(8, 'A Game of Thrones', 'Bantam'),
		(9, 'The Stand', 'Anchor'),
		(10, 'The Talbot Odyssey', 'Delacorte Press'),
		(11, 'Barkskins', 'Scribner'),
		(12, 'What Belongs to You', 'Straus and Giroux'),
		(13, 'The Underground Railroad', 'Doubleday'),
		(14, 'The Vegetarian', 'Hogath'),
		(15, 'Blood of the Oak', 'Counterpoint'),
		(16, 'Do not Turn the Lights', 'Minotaur'),
		(17, 'After Atlas', 'Roc'),
		(18, 'All Good Children', 'Lethe'),
		(19, 'A Green and Ancient Light', 'Saga'),
		(20, 'Kingfisher', 'Ace')
	GO


	INSERT dbo.Book_Authors (BookID, AuthorName)
		VALUES (1, 'Miguel de Cervantes'),
			(2, 'Lewis Carroll'),
			(3, 'Mark Twain'),
			(4, 'Louise Foley'),
			(5, 'William Faulkner'),
			(6, 'Nathaniel Hawthorne'),
			(7, 'Stephen King'),
			(8, 'George Martin'),
			(9, 'Steven Kig'),
			(10, 'Nelson DeMille'),
			(11, 'Annie Proulx'),
			(12, 'Garth Greenwell'),
			(13, 'Colson Whitehead'),
			(14, 'Han Kang'),
			(15, 'Eliot Pattison'),
			(16, 'Bernard Minier'),
			(17, 'Emma Newman'),
			(18, 'Catherine Austin'),
			(19, 'Frederic Durbin'),
			(20, 'Patricia McKillip')
		GO


		INSERT dbo.Publisher (Name, Address, Phone)
			VALUES ('Francisco de Robles', 'Ecuador', 1593750387),
				('Macmillan Publishers', 'London', 1777854356),
				('Chatto & Windus', 'London', 1993749869),
				('Bantam', 'New York City', 1004729478),
				('Jonathan Cape', 'London', 1448509370),
				('Ticknor and Fields', 'London', 1669403948),
				('Doubleday', 'New York City', 1222849380),
				('Anchor', 'London', 1113784907),
				('Delacorte Press', 'London', 1223344789),
				('Scribner', 'London', 1889900478),
				('Straus and Giroux', 'London', 1556677889),
				('Hogath', 'New York City', 1447780993),
				('Counterpoint', 'London', 1440333890),
				('Minotaur', 'London', 1003328947),
				('Roc', 'New York City', 1222333789),
				('Lethe', 'London', 1448999407),
				('Saga', 'New York City', 1438999376),
				('Ace', 'New York City', 1555930478)
		GO


		INSERT dbo.Book_Copies (BookID, BranchID, No_Of_Copies)
			VALUES (1, 1, 2),
				(1, 2, 2),
				(1, 3, 2),
				(1, 4, 2),
				(2, 1, 3),
				(2, 2, 0),
				(2, 3, 2),
				(2, 4, 3),
				(3, 1, 2),
				(3, 2, 2),
				(3, 3, 2),
				(3, 4, 2),
				(4, 1, 2),
				(4, 2, 2),
				(4, 3, 2),
				(4, 4, 3),
				(5, 1, 0),
				(5, 2, 2),
				(5, 3, 3),
				(5, 4, 0),
				(6, 1, 2),
				(6, 2, 2),
				(6, 3, 2),
				(6, 4, 2),
				(7, 1, 0),
				(7, 2, 1),
				(7, 3, 4),
				(7, 4, 2),
				(8, 1, 2),
				(8, 2, 2),
				(8, 3, 2),
				(8, 4, 3),
				(9, 1, 0),
				(9, 2, 2),
				(9, 3, 3),
				(9, 4, 0),
				(10, 1, 2),
				(10, 2, 2),
				(10, 3, 2),
				(10, 4, 2),
				(11, 1, 2),
				(11, 2, 2),
				(11, 3, 2),
				(11, 4, 3),
				(12, 1, 0),
				(12, 2, 2),
				(12, 3, 3),
				(12, 4, 0),
				(13, 1, 2),
				(13, 2, 2),
				(13, 3, 2),
				(13, 4, 2),
				(14, 1, 2),
				(14, 2, 2),
				(14, 3, 2),
				(14, 4, 3),
				(15, 1, 1),
				(15, 2, 2),
				(15, 3, 3),
				(15, 4, 5),
				(16, 1, 0),
				(16, 2, 2),
				(16, 3, 2),
				(16, 4, 2),
				(17, 1, 2),
				(17, 2, 1),
				(17, 3, 1),
				(17, 4, 4),
				(18, 1, 2),
				(18, 2, 2),
				(18, 3, 2),
				(18, 4, 2),
				(19, 1, 3),
				(19, 2, 3),
				(19, 3, 2),
				(19, 4, 3),
				(20, 1, 3),
				(20, 2, 0),
				(20, 3, 2),
				(20, 4, 3)
		GO


				INSERT dbo.Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate)
			VALUES (1, 1, 111, '2016-05-03', '2016-06-03'),
				(2, 2, 444, '2016-05-10', '2016-06-10'),
				(3, 3, 333, '2016-05-11', '2016-06-11'),
				(4, 4, 222, '2016-05-22', '2016-06-22'),
				(3, 1, 333, '2016-11-14', '2016-12-14'),
				(4, 2, 999, '2016-05-21', '2016-06-21'),
				(7, 3, 888, '2016-05-04', '2016-06-04'),
				(5, 4, 222, '2016-05-22', '2016-06-22'),
				(9, 1, 888, '2016-05-04', '2016-06-04'),
				(10, 2, 777, '2016-05-04', '2016-06-04'),
				(1, 3, 777, '2016-05-14', '2016-06-14'),
				(12, 3, 444, '2016-05-14', '2016-06-14'),
				(1, 2, 444, '2016-05-14', '2016-06-14'),
				(14, 3, 555, '2016-05-03', '2016-06-03'),
				(3, 4, 222, '2016-05-22', '2016-06-22'),
				(16, 1, 444, '2016-05-10', '2016-06-10'),
				(17, 1, 444, '2016-05-10', '2016-06-10'),
				(18, 3, 444, '2016-05-10', '2016-06-10'),
				(2, 2, 555, '2016-05-03', '2016-06-03'),
				(20, 2, 555, '2016-05-03', '2016-06-03'),
				(21, 3, 999, '2016-05-21', '2016-06-21'),
				(2, 4, 222, '2016-05-22', '2016-06-22'),
				(2, 2, 111, '2016-05-03', '2016-06-03'),
				(19, 1, 333, '2016-05-11', '2016-06-11'),
				(18, 2, 555, '2016-05-03', '2016-06-03'),
				(2, 3, 999, '2016-05-21', '2016-06-21'),
				(7, 4, 222, '2016-05-22', '2016-06-22'),
				(14, 2, 555, '2016-05-14', '2016-06-14'),
				(15, 1, 444, '2016-05-14', '2016-06-14'),
				(3, 2, 111, '2016-05-03', '2016-06-03'),
				(3, 3, 555, '2016-05-03', '2016-06-03'),
				(2, 4, 222, '2016-05-22', '2016-06-22'),
				(3, 1, 333, '2016-05-11', '2016-06-11'),
				(18, 2, 111, '2016-05-03', '2016-06-03'),
				(3, 3, 222, '2016-05-22', '2016-06-22'),
				(6, 4, 111, '2016-05-03', '2016-06-03'),
				(7, 1, 333, '2016-05-11', '2016-06-11'),
				(8, 1, 333, '2016-05-11', '2016-06-11'),
				(9, 2, 888, '2016-05-04', '2016-06-04'),
				(10, 2, 888, '2016-05-04', '2016-06-04'),
				(11, 2, 888, '2016-05-04', '2016-06-04'),
				(12, 3, 777, '2016-05-04', '2016-06-04'),
				(13, 4, 777, '2016-05-04', '2016-06-04'),
				(14, 4, 111, '2016-05-03', '2016-06-03'),
				(15, 2, 888, '2016-05-04', '2016-06-04'),
				(16, 1, 888, '2016-05-14', '2016-06-14'),
				(7, 2, 555, '2016-05-22', '2016-06-22'),
				(8, 1, 555, '2016-05-14', '2016-06-14'),
				(9, 2, 999, '2016-05-21', '2016-06-21'),
				(20, 1, 999, '2016-05-21', '2016-06-21')
		GO


		INSERT dbo.Library_Branch (BranchID, BranchName, Address)
			VALUES (1, 'Sharpstown', '246 whitewalker Rd'),
				(2, 'Highland', '122 Cheesepeak Ave'),
				(3, 'Grant', '378 Haven Rd'),
				(4, 'Central', '490 Hubert St')
		GO


		INSERT dbo.Borrower (CardNo, Name, Address, Phone)
			VALUES (111, 'Justin', NULL, '1849587384'),
				(222, 'Ryan', NULL, '1883029470'),
				(333, 'Haley', NULL, '1778049370'),
				(444, 'Zach', NULL, '1374938740'),
				(555, 'Bob', NULL, '1409857648'),
				(666, 'Joe', NULL, '1387483950'),
				(777, 'Jenny', NULL, '1284763547'),
				(888, 'Nicole', NULL, '1589037898'),
				(999, 'Kayla', NULL, '1583759306')
		GO
