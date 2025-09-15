CREATE DATABASE ONLINEBOOK;

USE ONLINEBOOK;

SELECT * FROM BOOKS;

SELECT * FROM Customers;

SELECT * FROM Orders;

-- 1. Retrieve all customer names and their cities. 
select Name,City from Customers;


-- 2. List all books with their title and price.
select Title, Price from Books;

-- 3. Show details of books in the 'Fantasy' genre.
select *  from Books 
where Genre='Fantasy';

-- count
select count(*)  from Books 
where Genre='Fantasy';

-- 4. Retrieve the total stock of books available:

SELECT SUM(stock) AS Total_Stock
From Books;

-- 5.Retrieve all orders placed after '2023-07-01'.
select * from Orders 
where Order_Date> '2023-07-01';

-- 6. Find all customers from 'Davidton'.

select * from Customers
where City='Davidton';

-- 7. Show the total number of customers.

SELECT COUNT(*) AS TotalCustomers 
FROM Customers;

-- 8.Find the most expensive book.

SELECT Title, Price 
FROM Books 
ORDER BY Price DESC 
LIMIT 1;

-- 9. Find books published after the year 1950:
SELECT * FROM Books 
WHERE Published_year>1950;

-- 10 List all customers from the Canada:
SELECT * FROM Customers 
WHERE country='Canada';


-- 11. Show orders placed in November 2023:

SELECT * FROM Orders 
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 12. Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders 
WHERE total_amount>20;



-- 13.List all genres available in the Books table:
SELECT DISTINCT genre FROM Books;


-- 14. Find the book with the lowest stock:
SELECT * FROM Books 
ORDER BY stock 
LIMIT 1;


-- 15. Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) As Revenue 
FROM Orders;



-- ADVANCED QUESTIONS
-- 1. Show the number of orders placed each month in 2025.

SELECT MONTH(Order_Date) AS Month, COUNT(*) AS OrdersCount
FROM Orders
WHERE YEAR(Order_Date) = 2023
GROUP BY MONTH(Order_Date)
ORDER BY Month;


-- 2.Find the best-selling book (highest total quantity ordered).

SELECT B.Title, SUM(O.Quantity) AS TotalSold
FROM Orders O
JOIN Books B ON O.Book_ID = B.Book_ID
GROUP BY B.Title
ORDER BY TotalSold DESC
LIMIT 1;