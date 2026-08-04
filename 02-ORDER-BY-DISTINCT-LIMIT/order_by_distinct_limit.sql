-- Day 2: ORDER BY, DISTINCT & LIMIT Practice
-- Database: ecommerce_sales
-- Table: orders

-- 1. Display all records sorted by Sales in ascending order
SELECT *
FROM orders
ORDER BY Sales ASC;

-- 2. Display all records sorted by Sales in descending order
SELECT *
FROM orders
ORDER BY Sales DESC;

-- 3. Display customer names sorted alphabetically
SELECT Custormer_Name
FROM orders
ORDER BY Custormer_Name ASC;

-- 4. Display products sorted by Unit Price (Highest to Lowest)
SELECT Product_Name, Unit_Price
FROM orders
ORDER BY Unit_Price DESC;

-- 5. Display the top 10 highest sales records
SELECT *
FROM orders
ORDER BY Sales DESC
LIMIT 10;

-- 6. Display the first 20 records
SELECT *
FROM orders
LIMIT 20;

-- 7. Display unique customer segments
SELECT DISTINCT Customer_Segment
FROM orders;

-- 8. Display unique product categories
SELECT DISTINCT Category
FROM orders;

-- 9. Display unique payment methods
SELECT DISTINCT Payment_Method
FROM orders;

-- 10. Display unique shipping modes
SELECT DISTINCT Shipping_Mode
FROM orders;

-- 11. Display the top 5 products with the highest unit price
SELECT Product_Name, Unit_Price
FROM orders
ORDER BY Unit_Price DESC
LIMIT 5;

-- 12. Display orders sorted by Region and Sales
SELECT Order_ID, Region, Sales
FROM orders
ORDER BY Region ASC, Sales DESC;