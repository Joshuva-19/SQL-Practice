-- Day 10: CTE Practice
-- Database: ecommerce_sales
-- Table: orders


-- 1. Calculate total sales by region using a CTE
WITH Region_Sales AS (
    SELECT Region,
           SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Region
)
SELECT *
FROM Region_Sales;


-- 2. Find regions with total sales greater than 50000
WITH Region_Sales AS (
    SELECT Region,
           SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Region
)
SELECT Region, Total_Sales
FROM Region_Sales
WHERE Total_Sales > 50000;


-- 3. Calculate total profit by category
WITH Category_Profit AS (
    SELECT Category,
           SUM(Profit) AS Total_Profit
    FROM orders
    GROUP BY Category
)
SELECT *
FROM Category_Profit
ORDER BY Total_Profit DESC;


-- 4. Find categories with total profit greater than 10000
WITH Category_Profit AS (
    SELECT Category,
           SUM(Profit) AS Total_Profit
    FROM orders
    GROUP BY Category
)
SELECT Category, Total_Profit
FROM Category_Profit
WHERE Total_Profit > 10000;


-- 5. Calculate average sales by customer segment
WITH Segment_Sales AS (
    SELECT Customer_Segment,
           AVG(Sales) AS Average_Sales
    FROM orders
    GROUP BY Customer_Segment
)
SELECT *
FROM Segment_Sales
ORDER BY Average_Sales DESC;


-- 6. Find products with total quantity sold greater than 100
WITH Product_Quantity AS (
    SELECT Product_Name,
           SUM(Quantity) AS Total_Quantity
    FROM orders
    GROUP BY Product_Name
)
SELECT Product_Name, Total_Quantity
FROM Product_Quantity
WHERE Total_Quantity > 100
ORDER BY Total_Quantity DESC;


-- 7. Find profitable orders
WITH Profit_Data AS (
    SELECT Order_ID,
           Sales,
           Profit
    FROM orders
)
SELECT Order_ID,
       Sales,
       Profit
FROM Profit_Data
WHERE Profit > 0;


-- 8. Calculate yearly sales
WITH Yearly_Sales AS (
    SELECT YEAR(Order_Date) AS Order_Year,
           SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY YEAR(Order_Date)
)
SELECT *
FROM Yearly_Sales
ORDER BY Order_Year;


-- 9. Find the top 10 customers based on total sales
WITH Customer_Sales AS (
    SELECT Custormer_Name,
           SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Custormer_Name
)
SELECT Custormer_Name,
       Total_Sales
FROM Customer_Sales
ORDER BY Total_Sales DESC
LIMIT 10;


-- 10. Calculate total sales and profit by region
WITH Regional_Performance AS (
    SELECT Region,
           SUM(Sales) AS Total_Sales,
           SUM(Profit) AS Total_Profit
    FROM orders
    GROUP BY Region
)
SELECT Region,
       Total_Sales,
       Total_Profit
FROM Regional_Performance
ORDER BY Total_Sales DESC;