-- Day 15: SQL Interview & Business Problems
-- Database: ecommerce_sales
-- Table: orders


-- 1. Find the top 5 customers based on total sales
SELECT
    Custormer_Name,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Custormer_Name
ORDER BY Total_Sales DESC
LIMIT 5;


-- 2. Find the top 5 products based on total profit
SELECT
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 5;


-- 3. Find the region with the highest total sales
SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC
LIMIT 1;


-- 4. Find the category with the highest total profit
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC
LIMIT 1;


-- 5. Find customers whose total sales are greater than
-- the average customer sales
WITH Customer_Sales AS (
    SELECT
        Custormer_Name,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Custormer_Name
)
SELECT
    Custormer_Name,
    Total_Sales
FROM Customer_Sales
WHERE Total_Sales > (
    SELECT AVG(Total_Sales)
    FROM Customer_Sales
)
ORDER BY Total_Sales DESC;


-- 6. Find the second-highest sales amount
SELECT MAX(Sales) AS Second_Highest_Sales
FROM orders
WHERE Sales < (
    SELECT MAX(Sales)
    FROM orders
);


-- 7. Find orders where Profit is greater than
-- the average Profit
SELECT
    Order_ID,
    Sales,
    Profit
FROM orders
WHERE Profit > (
    SELECT AVG(Profit)
    FROM orders
)
ORDER BY Profit DESC;


-- 8. Find the top 3 products within each category
WITH Product_Sales AS (
    SELECT
        Category,
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Category, Product_Name
),
Ranked_Products AS (
    SELECT
        Category,
        Product_Name,
        Total_Sales,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS Product_Rank
    FROM Product_Sales
)
SELECT
    Category,
    Product_Name,
    Total_Sales,
    Product_Rank
FROM Ranked_Products
WHERE Product_Rank <= 3
ORDER BY Category, Product_Rank;


-- 9. Find monthly sales and monthly profit
SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;


-- 10. Find the number of orders in each category
SELECT
    Category,
    COUNT(Order_ID) AS Total_Orders
FROM orders
GROUP BY Category
ORDER BY Total_Orders DESC;


-- 11. Find categories where total profit is negative
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
HAVING SUM(Profit) < 0;


-- 12. Find the most profitable customer
SELECT
    Custormer_Name,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Custormer_Name
ORDER BY Total_Profit DESC
LIMIT 1;


-- 13. Find the average sales for each region
SELECT
    Region,
    AVG(Sales) AS Average_Sales
FROM orders
GROUP BY Region
ORDER BY Average_Sales DESC;


-- 14. Find customers with more than 5 orders
SELECT
    Custormer_Name,
    COUNT(Order_ID) AS Total_Orders
FROM orders
GROUP BY Custormer_Name
HAVING COUNT(Order_ID) > 5
ORDER BY Total_Orders DESC;


-- 15. Find the percentage contribution of each category
-- to total sales
SELECT
    Category,
    SUM(Sales) AS Category_Sales,
    ROUND(
        SUM(Sales) * 100.0 /
        (SELECT SUM(Sales) FROM orders),
        2
    ) AS Sales_Percentage
FROM orders
GROUP BY Category
ORDER BY Sales_Percentage DESC;