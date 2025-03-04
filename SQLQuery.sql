--1.Select all columns from the Books table.

select authors.FirstName,authors.LastName, Books.title
from authors join Books 
on authors.AuthorId=Books.AuthorID;

--List all books published after the year 2015.
select title from Books where YearPublished>2015;

--Retrieve all users with email addresses that end in '@gmail.com'.
select FirstName, LastName from users where Email like'ja%';

--List all users who have checked out a book titled "Python for Beginners".
select users.firstname, users.lastname from users 
join checkouts 
on users.UserId=checkouts.userId 
join  books on Books.BookId= checkouts.bookId
where books.Title like  'Brave New World';

--Find the number of books checked out by each user.
SELECT UserID, COUNT(BookID) AS BooksCheckedOut
FROM Checkouts
GROUP BY UserID;

--Get the total late fee (based on days overdue) for overdue books.

select sum(latefee) as totallatefee  from checkouts where ReturnDate > DueDate;

--Calculate the average number of days a book is checked out before being returned.

SELECT 
    AVG(DATEDIFF(DAY, checkouts.CheckoutDate, checkouts.ReturnDate)) AS AverageDaysCheckedOut
FROM 
    Checkouts 
WHERE 
    checkouts.ReturnDate IS NOT NULL;


--Update the contact details (email and phone number) for a specific user.

update users
set
phoneNumber='555-0006',
email = 'safiya@yahoo.com'
where USERID=6;
select * from users where UserId=6;


SELECT 
    COUNT(*) AS TotalBooksBorrowed
FROM 
    Checkouts 
WHERE 
    checkouts.CheckoutDate >= DATEADD(MONTH, -1, GETDATE());



