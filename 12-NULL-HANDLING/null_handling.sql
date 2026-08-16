-- Day 12: NULL Handling & Conditional Functions
-- Database: ecommerce_sales
-- Table: orders


-- 1. Find records where Customer_Rating is NULL
SELECT Order_ID,
       Custormer_Name,
       Customer_Rating
FROM orders
WHERE Customer_Rating IS NULL;


-- 2. Find records where Customer_Rating is NOT NULL
SELECT Order_ID,
       Custormer_Name,
       Customer_Rating
FROM orders
WHERE Customer_Rating IS NOT NULL;


-- 3. Display customer rating and replace NULL with 0
SELECT Order_ID,
       Custormer_Name,
       COALESCE(Customer_Rating, 0) AS Customer_Rating
FROM orders;


-- 4. Replace NULL Customer_Rating with 'Not Rated'
SELECT Order_ID,
       Custormer_Name,
       COALESCE(CAST(Customer_Rating AS CHAR), 'Not Rated') AS Rating
FROM orders;


-- 5. Display Profit and replace NULL values with 0
SELECT Order_ID,
       Sales,
       COALESCE(Profit, 0) AS Profit
FROM orders;


-- 6. Calculate Sales minus Profit while handling NULL Profit
SELECT Order_ID,
       Sales,
       COALESCE(Profit, 0) AS Profit,
       Sales - COALESCE(Profit, 0) AS Cost_Amount
FROM orders;


-- 7. Count records with and without Customer_Rating
SELECT
    COUNT(*) AS Total_Records,
    COUNT(Customer_Rating) AS Records_With_Rating
FROM orders;


-- 8. Identify records with missing Order_Status
SELECT Order_ID,
       Order_Status
FROM orders
WHERE Order_Status IS NULL;


-- 9. Use IF to identify profitable orders
SELECT Order_ID,
       Sales,
       Profit,
       IF(Profit > 0, 'Profitable', 'Loss/No Profit') AS Profit_Status
FROM orders;


-- 10. Use IF to identify high-value orders
SELECT Order_ID,
       Sales,
       IF(Sales >= 5000, 'High Value', 'Regular Value') AS Order_Value
FROM orders;


-- 11. Use NULLIF to avoid division by zero
SELECT Order_ID,
       Sales,
       Quantity,
       Sales / NULLIF(Quantity, 0) AS Sales_Per_Unit
FROM orders;


-- 12. Calculate average Customer_Rating
-- NULL values are automatically ignored by AVG()
SELECT AVG(Customer_Rating) AS Average_Rating
FROM orders;


-- 13. Count NULL Customer_Rating values
SELECT COUNT(*) - COUNT(Customer_Rating) AS Missing_Ratings
FROM orders;


-- 14. Group records based on whether Customer_Rating is available
SELECT
    CASE
        WHEN Customer_Rating IS NULL THEN 'Missing Rating'
        ELSE 'Rating Available'
    END AS Rating_Status,
    COUNT(*) AS Total_Records
FROM orders
GROUP BY
    CASE
        WHEN Customer_Rating IS NULL THEN 'Missing Rating'
        ELSE 'Rating Available'
    END;