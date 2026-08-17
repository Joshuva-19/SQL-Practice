-- Day 13: Advanced JOIN & Multi-Table Analysis
-- Database: ecommerce_sales
-- Main Table: orders


-- ============================================================
-- 1. Create a small Customer Master table
-- ============================================================

CREATE TABLE customer_master (
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Customer_Segment VARCHAR(50),
    Region VARCHAR(50)
);


-- ============================================================
-- 2. Insert sample customer records
-- ============================================================

INSERT INTO customer_master
(Customer_ID, Customer_Name, Customer_Segment, Region)
VALUES
('C001', 'Customer A', 'Consumer', 'South'),
('C002', 'Customer B', 'Corporate', 'West'),
('C003', 'Customer C', 'Home Office', 'East'),
('C004', 'Customer D', 'Consumer', 'North'),
('C005', 'Customer E', 'Corporate', 'South');


-- ============================================================
-- 3. INNER JOIN - Match orders with customer information
-- ============================================================

SELECT
    o.Order_ID,
    o.Customer_ID,
    o.Sales,
    c.Customer_Name,
    c.Customer_Segment
FROM orders o
INNER JOIN customer_master c
    ON o.Customer_ID = c.Customer_ID;


-- ============================================================
-- 4. LEFT JOIN - Display all orders with customer details
-- ============================================================

SELECT
    o.Order_ID,
    o.Customer_ID,
    o.Sales,
    c.Customer_Name,
    c.Customer_Segment
FROM orders o
LEFT JOIN customer_master c
    ON o.Customer_ID = c.Customer_ID;


-- ============================================================
-- 5. Find orders without matching customer information
-- ============================================================

SELECT
    o.Order_ID,
    o.Customer_ID,
    o.Sales
FROM orders o
LEFT JOIN customer_master c
    ON o.Customer_ID = c.Customer_ID
WHERE c.Customer_ID IS NULL;


-- ============================================================
-- 6. Calculate total sales by customer segment
-- ============================================================

SELECT
    c.Customer_Segment,
    SUM(o.Sales) AS Total_Sales
FROM orders o
INNER JOIN customer_master c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Total_Sales DESC;


-- ============================================================
-- 7. Calculate total profit by customer segment
-- ============================================================

SELECT
    c.Customer_Segment,
    SUM(o.Profit) AS Total_Profit
FROM orders o
INNER JOIN customer_master c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Total_Profit DESC;


-- ============================================================
-- 8. Find customers with total sales greater than 5000
-- ============================================================

SELECT
    c.Customer_Name,
    SUM(o.Sales) AS Total_Sales
FROM orders o
INNER JOIN customer_master c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
HAVING SUM(o.Sales) > 5000
ORDER BY Total_Sales DESC;


-- ============================================================
-- 9. Join and calculate average order value by segment
-- ============================================================

SELECT
    c.Customer_Segment,
    AVG(o.Sales) AS Average_Order_Value
FROM orders o
INNER JOIN customer_master c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Average_Order_Value DESC;


-- ============================================================
-- 10. Count orders by customer segment
-- ============================================================

SELECT
    c.Customer_Segment,
    COUNT(o.Order_ID) AS Total_Orders
FROM orders o
INNER JOIN customer_master c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Total_Orders DESC;