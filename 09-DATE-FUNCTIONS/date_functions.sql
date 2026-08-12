-- Day 9: Date Functions Practice
-- Database: ecommerce_sales
-- Table: orders

-- 1. Display the order date for each order
SELECT Order_ID, Order_Date
FROM orders;


-- 2. Extract the year from Order_Date
SELECT Order_ID, Order_Date,
       YEAR(Order_Date) AS Order_Year
FROM orders;


-- 3. Extract the month from Order_Date
SELECT Order_ID, Order_Date,
       MONTH(Order_Date) AS Order_Month
FROM orders;


-- 4. Extract the day from Order_Date
SELECT Order_ID, Order_Date,
       DAY(Order_Date) AS Order_Day
FROM orders;


-- 5. Display orders placed in the year 2023
SELECT Order_ID, Order_Date, Sales
FROM orders
WHERE YEAR(Order_Date) = 2023;


-- 6. Display orders placed in January
SELECT Order_ID, Order_Date, Sales
FROM orders
WHERE MONTH(Order_Date) = 1;


-- 7. Calculate the number of days between Order_Date and Ship_Date
SELECT Order_ID,
       Order_Date,
       Ship_Date,
       DATEDIFF(Ship_Date, Order_Date) AS Shipping_Days
FROM orders;


-- 8. Display orders that were shipped within 3 days
SELECT Order_ID,
       Order_Date,
       Ship_Date,
       DATEDIFF(Ship_Date, Order_Date) AS Shipping_Days
FROM orders
WHERE DATEDIFF(Ship_Date, Order_Date) <= 3;


-- 9. Display orders that took more than 5 days to ship
SELECT Order_ID,
       Order_Date,
       Ship_Date,
       DATEDIFF(Ship_Date, Order_Date) AS Shipping_Days
FROM orders
WHERE DATEDIFF(Ship_Date, Order_Date) > 5;


-- 10. Display orders placed between two dates
SELECT Order_ID, Order_Date, Sales
FROM orders
WHERE Order_Date BETWEEN '2023-01-01' AND '2023-12-31';


-- 11. Display orders with their order year and month
SELECT Order_ID,
       Order_Date,
       YEAR(Order_Date) AS Order_Year,
       MONTH(Order_Date) AS Order_Month
FROM orders;


-- 12. Find the earliest order date
SELECT MIN(Order_Date) AS Earliest_Order_Date
FROM orders;


-- 13. Find the latest order date
SELECT MAX(Order_Date) AS Latest_Order_Date
FROM orders;


-- 14. Count the number of orders placed in each year
SELECT YEAR(Order_Date) AS Order_Year,
       COUNT(Order_ID) AS Total_Orders
FROM orders
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;


-- 15. Calculate total sales for each year
SELECT YEAR(Order_Date) AS Order_Year,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;