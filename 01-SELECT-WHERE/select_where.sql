-- Day 1: SELECT & WHERE Practice
-- Database: ecommerce_sales
-- Table: orders

-- 1. Retrieve all records from the orders table
SELECT *
FROM orders;

-- 2. Retrieve specific columns
SELECT Order_ID, Custormer_Name, Sales
FROM orders;

-- 3. Display unique customer segments
SELECT DISTINCT Customer_Segment
FROM orders;

-- 4. Display orders from the South region
SELECT *
FROM orders
WHERE Region = 'South';

-- 5. Display orders with sales greater than 5000
SELECT *
FROM orders
WHERE Sales > 5000;

-- 6. Display orders belonging to the Technology category
SELECT *
FROM orders
WHERE Category = 'Technology';

-- 7. Display orders with a discount greater than 10%
SELECT *
FROM orders
WHERE Discount > 0.10;

-- 8. Display customers from Tamil Nadu
SELECT *
FROM orders
WHERE State = 'Tamil Nadu';

-- 9. Display orders with quantity between 5 and 10
SELECT *
FROM orders
WHERE Quantity BETWEEN 5 AND 10;

-- 10. Display orders from the South or West region
SELECT *
FROM orders
WHERE Region IN ('South', 'West');

-- 11. Display customers whose names start with the letter 'A'
SELECT *
FROM orders
WHERE Custormer_Name LIKE 'A%';

-- 12. Display completed orders
SELECT *
FROM orders
WHERE Order_Status = 'Completed';

-- 13. Display all orders sorted by Sales in descending order
SELECT *
FROM orders
ORDER BY Sales DESC;

-- 14. Display the top 10 highest sales records
SELECT *
FROM orders
ORDER BY Sales DESC
LIMIT 10;