-- Day 11: Window Functions Practice
-- Database: ecommerce_sales
-- Table: orders


-- 1. Assign a row number to each order based on Sales
SELECT Order_ID,
       Custormer_Name,
       Sales,
       ROW_NUMBER() OVER (ORDER BY Sales DESC) AS Row_Number
FROM orders;


-- 2. Rank orders based on Sales
SELECT Order_ID,
       Custormer_Name,
       Sales,
       RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM orders;


-- 3. Rank orders using DENSE_RANK
SELECT Order_ID,
       Custormer_Name,
       Sales,
       DENSE_RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM orders;


-- 4. Rank orders within each Region
SELECT Order_ID,
       Region,
       Sales,
       RANK() OVER (
           PARTITION BY Region
           ORDER BY Sales DESC
       ) AS Regional_Rank
FROM orders;


-- 5. Assign row numbers within each Category
SELECT Order_ID,
       Category,
       Product_Name,
       Sales,
       ROW_NUMBER() OVER (
           PARTITION BY Category
           ORDER BY Sales DESC
       ) AS Category_Row_Number
FROM orders;


-- 6. Rank products within each Category based on Profit
SELECT Order_ID,
       Category,
       Product_Name,
       Profit,
       RANK() OVER (
           PARTITION BY Category
           ORDER BY Profit DESC
       ) AS Profit_Rank
FROM orders;


-- 7. Calculate running total of Sales
SELECT Order_ID,
       Order_Date,
       Sales,
       SUM(Sales) OVER (
           ORDER BY Order_Date
       ) AS Running_Total_Sales
FROM orders;


-- 8. Calculate running total of Profit
SELECT Order_ID,
       Order_Date,
       Profit,
       SUM(Profit) OVER (
           ORDER BY Order_Date
       ) AS Running_Total_Profit
FROM orders;


-- 9. Calculate average Sales across all orders
SELECT Order_ID,
       Sales,
       AVG(Sales) OVER () AS Overall_Average_Sales
FROM orders;


-- 10. Calculate average Sales within each Region
SELECT Order_ID,
       Region,
       Sales,
       AVG(Sales) OVER (
           PARTITION BY Region
       ) AS Regional_Average_Sales
FROM orders;


-- 11. Compare each order's Sales with the regional average
SELECT Order_ID,
       Region,
       Sales,
       AVG(Sales) OVER (
           PARTITION BY Region
       ) AS Regional_Average_Sales,
       Sales -
       AVG(Sales) OVER (
           PARTITION BY Region
       ) AS Difference_From_Average
FROM orders;


-- 12. Find the previous order's Sales using LAG
SELECT Order_ID,
       Order_Date,
       Sales,
       LAG(Sales) OVER (
           ORDER BY Order_Date
       ) AS Previous_Sales
FROM orders;


-- 13. Find the next order's Sales using LEAD
SELECT Order_ID,
       Order_Date,
       Sales,
       LEAD(Sales) OVER (
           ORDER BY Order_Date
       ) AS Next_Sales
FROM orders;


-- 14. Compare current Sales with previous Sales
SELECT Order_ID,
       Order_Date,
       Sales,
       LAG(Sales) OVER (
           ORDER BY Order_Date
       ) AS Previous_Sales,
       Sales -
       LAG(Sales) OVER (
           ORDER BY Order_Date
       ) AS Sales_Difference
FROM orders;


-- 15. Rank customers based on their total Sales
WITH Customer_Sales AS (
    SELECT Custormer_Name,
           SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Custormer_Name
)
SELECT Custormer_Name,
       Total_Sales,
       RANK() OVER (
           ORDER BY Total_Sales DESC
       ) AS Customer_Rank
FROM Customer_Sales;