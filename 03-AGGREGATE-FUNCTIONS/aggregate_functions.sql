-- Day 3: Aggregate Functions Practice
-- Database: ecommerce_sales
-- Table: orders

-- 1. Count the total number of orders
SELECT COUNT(Order_ID) AS Total_Orders
FROM orders;


-- 2. Count the total number of customers
SELECT COUNT(Customer_ID) AS Total_Customers
FROM orders;


-- 3. Find the total sales amount
SELECT SUM(Sales) AS Total_Sales
FROM orders;


-- 4. Find the total profit generated
SELECT SUM(Profit) AS Total_Profit
FROM orders;


-- 5. Find the average sales value per order
SELECT AVG(Sales) AS Average_Sales
FROM orders;


-- 6. Find the average profit per order
SELECT AVG(Profit) AS Average_Profit
FROM orders;


-- 7. Find the highest sales value
SELECT MAX(Sales) AS Highest_Sales
FROM orders;


-- 8. Find the lowest sales value
SELECT MIN(Sales) AS Lowest_Sales
FROM orders;


-- 9. Find the highest profit value
SELECT MAX(Profit) AS Highest_Profit
FROM orders;


-- 10. Find the lowest profit value
SELECT MIN(Profit) AS Lowest_Profit
FROM orders;


-- 11. Find the average unit price of products
SELECT AVG(Unit_Price) AS Average_Unit_Price
FROM orders;


-- 12. Find the total quantity sold
SELECT SUM(Quantity) AS Total_Quantity_Sold
FROM orders;


-- 13. Find total sales from South region
SELECT SUM(Sales) AS South_Region_Sales
FROM orders
WHERE Region = 'South';


-- 14. Find total sales by customer segment
SELECT Customer_Segment,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Customer_Segment;


-- 15. Find total profit by region
SELECT Region,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region;


-- 16. Find average customer rating
SELECT AVG(Customer_Rating) AS Average_Customer_Rating
FROM orders;


-- 17. Find total sales by category
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Category;


-- 18. Find highest sales value in each category
SELECT Category,
       MAX(Sales) AS Highest_Sales
FROM orders
GROUP BY Category;


-- 19. Find minimum unit price for each category
SELECT Category,
       MIN(Unit_Price) AS Lowest_Unit_Price
FROM orders
GROUP BY Category;


-- 20. Count number of orders by shipping mode
SELECT Shipping_Mode,
       COUNT(Order_ID) AS Total_Orders
FROM orders
GROUP BY Shipping_Mode;