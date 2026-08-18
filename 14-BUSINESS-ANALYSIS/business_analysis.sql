-- Day 14: Business Analysis Queries
-- Database: ecommerce_sales
-- Table: orders


-- 1. Find total sales
SELECT
    SUM(Sales) AS Total_Sales
FROM orders;


-- 2. Find total profit
SELECT
    SUM(Profit) AS Total_Profit
FROM orders;


-- 3. Find total number of orders
SELECT
    COUNT(Order_ID) AS Total_Orders
FROM orders;


-- 4. Find average order value
SELECT
    AVG(Sales) AS Average_Order_Value
FROM orders;


-- 5. Find the highest sales amount
SELECT
    MAX(Sales) AS Highest_Sale
FROM orders;


-- 6. Find the lowest sales amount
SELECT
    MIN(Sales) AS Lowest_Sale
FROM orders;


-- 7. Find total sales by region
SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 8. Find total profit by category
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;


-- 9. Find total sales by customer segment
SELECT
    Customer_Segment,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Customer_Segment
ORDER BY Total_Sales DESC;


-- 10. Find the top 10 customers based on total sales
SELECT
    Custormer_Name,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Custormer_Name
ORDER BY Total_Sales DESC
LIMIT 10;


-- 11. Find the top 10 products based on total sales
SELECT
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;


-- 12. Find the top 10 products based on total profit
SELECT
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;


-- 13. Find total sales and profit by region
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 14. Find categories with total sales greater than 10000
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Category
HAVING SUM(Sales) > 10000
ORDER BY Total_Sales DESC;


-- 15. Find customer segments with more than 100 orders
SELECT
    Customer_Segment,
    COUNT(Order_ID) AS Total_Orders
FROM orders
GROUP BY Customer_Segment
HAVING COUNT(Order_ID) > 100
ORDER BY Total_Orders DESC;


-- 16. Find the most profitable region
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Profit DESC
LIMIT 1;


-- 17. Find the most profitable category
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC
LIMIT 1;


-- 18. Find monthly sales
SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;


-- 19. Find monthly profit
SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;


-- 20. Compare sales and profit by category
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Profit) AS Average_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;