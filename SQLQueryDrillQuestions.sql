--How many copies of the book titled the Lost Tribe are owned by the library branch whose name is "Sharpstown"?

SELECT bo.BookID, bo.No_Of_Copies, li.BranchID, li.BranchName
FROM Book_Copies as bo
INNER JOIN Library_Branch as li
ON bo.BranchID = li.BranchID
WHERE li.BranchID = 1 AND bo.BookID = 1


--How many copies of The Lost Tribe does each branch have?

SELECT Book.Title, LB.BranchName, BC.No_Of_Copies
FROM Book_Copies BC 
JOIN Book ON BC.BookID=Book.BookID
JOIN Library_Branch LB ON BC.BranchID=LB.BranchID
WHERE BOOK.Title = 'The Lost Tribe';


--Retrieve the names of all borrowers who do not have any books checked out.

SELECT B.Name 
FROM Borrower B
LEFT JOIN Book_Loans BL ON B.CardNo=BL.CardNo
WHERE BL.CardNo IS NULL;


--For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
--retrieve the book title, the borrower's name, and the borrower's address.

SELECT bo.BookID, bo.Title, bor.Name, bor.Address, lb.BranchName
FROM Book as bo
INNER JOIN Book_Loans as bl
ON bo.BookID = bl.BookID
INNER JOIN Borrower as bor
ON bl.CardNo = bor.CardNo
INNER JOIN Library_Branch as lb
ON bl.BranchID = lb.BranchID
WHERE lb.BranchID = 4 AND bl.DueDate = '2017-02-13'


--For each library branch, retrieve the branch name and the total number of books loaned out from
--that branch.

SELECT LB.BranchName, COUNT(BL.BookID) AS 'BooksOut'
FROM Library_Branch LB
JOIN Book_Loans BL ON LB.BranchID=BL.BranchID
GROUP BY LB.BranchName;

--Retrieve the names, addresses, and number of books checked out for all borrowers who have more
--than five books checked out.

SELECT B.Name, B.[Address], COUNT(BL.BookID) AS 'BooksOut'
FROM Borrower B
JOIN Book_Loans BL ON B.CardNo=BL.CardNo
GROUP BY B.Name, B.[Address]
HAVING COUNT(BL.BookID) > 5;

--For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of
--copies owned by the library branch whose name is "Central"

SELECT Book.Title, BC.No_Of_Copies
FROM Book
JOIN Book_Copies BC ON BOOK.BookID=BC.BookID
JOIN Book_Authors BA ON BOOK.BookID=BA.BookID
WHERE BA.AuthorName = 'Stephen King'
AND BC.BranchID = 4;
