-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.
SELECT *
FROM employees
JOIN sales
	ON employees.EmployeeID = sales.SalesPersonID
JOIN products
	ON products.ProductID = sales.ProductID;
-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- NOTE: You'll want to remove any duplicate columns to clean up your view!

-- 2b. Test your View by selecting all rows and columns from the View

SELECT DISTINCT * FROM all_sales;
-- Problem 3
-- Find the average sale amount for each sales person
SELECT DISTINCT employeeID, FORMAT((AVG(SaleAmount)), 2) AS 'Average Sale Amount' FROM all_sales GROUP BY employeeID;
-- Problem 4
-- Find the top three sales persons by total sales
SELECT DISTINCT EMPLOYEEid, FORMAT(sum(SaleAmount), 2) AS 'Total Sales' FROM all_sales GROUP BY employeeid ORDER BY sum(quantity*price) desc LIMIT 3;
-- Problem 5
-- Find the product that has the highest price
SELECT * FROM products ORDER BY price DESC;
-- Problem 6
-- Find the product that was sold the most times
SELECT   name AS 'Product Name', productid, count(productID) AS "# Of product sales", FORMAT(sum(quantity),'N','en-us') AS "Total Quantity sold" FROM all_sales group by productid, name order by sum(quantity) DESC;
-- Result shows most number of sales and highest quantity sold
-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products
SELECT DISTINCT name, productid, price FROM all_sales WHERE price > (SELECT avg(price) FROM all_sales) ORDER BY productID;
-- Problem 8
-- Find the customer who spent the most money in purchased products
SELECT DISTINCT customerID, FORMAT(sum(SaleAmount), 2) AS 'Total Spent' FROM all_sales GROUP BY customerID ORDER BY sum(SaleAmount) DESC LIMIT 1;
-- Problem 9
-- Find the total number of sales for each sales person
SELECT DISTINCT employeeID, count(salesID) AS 'Number of Sales' FROM all_sales GROUP BY employeeID ORDER BY count(salesID) DESC;
-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8
SELECT employeeID, CustomerID, count(salesID) AS 'Number of Sales to Customer' FROM all_sales WHERE CustomerID = 18723 GROUP BY employeeID ORDER BY count(salesID);