-- Day 7: CASE Statements Practice
-- Database: ecommerce_sales
-- Table: orders

-- 1. Categorize orders based on Sales amount
SELECT Order_ID, Sales,
       CASE
           WHEN Sales >= 5000 THEN 'High Sales'
           WHEN Sales >= 2000 THEN 'Medium Sales'
           ELSE 'Low Sales'
       END AS Sales_Category
FROM orders;


-- 2. Categorize orders based on Profit
SELECT Order_ID, Profit,
       CASE
           WHEN Profit > 1000 THEN 'High Profit'
           WHEN Profit > 0 THEN 'Positive Profit'
           WHEN Profit = 0 THEN 'No Profit'
           ELSE 'Loss'
       END AS Profit_Category
FROM orders;


-- 3. Categorize customers based on Customer Rating
SELECT Order_ID, Custormer_Name, Customer_Rating,
       CASE
           WHEN Customer_Rating >= 4 THEN 'Excellent'
           WHEN Customer_Rating >= 3 THEN 'Good'
           WHEN Customer_Rating >= 2 THEN 'Average'
           ELSE 'Poor'
       END AS Rating_Category
FROM orders;


-- 4. Categorize orders based on Quantity
SELECT Order_ID, Quantity,
       CASE
           WHEN Quantity >= 10 THEN 'Large Order'
           WHEN Quantity >= 5 THEN 'Medium Order'
           ELSE 'Small Order'
       END AS Order_Size
FROM orders;


-- 5. Categorize orders based on Discount
SELECT Order_ID, Discount,
       CASE
           WHEN Discount >= 0.20 THEN 'High Discount'
           WHEN Discount >= 0.10 THEN 'Medium Discount'
           ELSE 'Low Discount'
       END AS Discount_Category
FROM orders;


-- 6. Categorize products based on Category
SELECT Order_ID, Product_Name, Category,
       CASE
           WHEN Category = 'Technology' THEN 'Tech Product'
           WHEN Category = 'Furniture' THEN 'Furniture Product'
           WHEN Category = 'Office Supplies' THEN 'Office Product'
           ELSE 'Other Product'
       END AS Product_Type
FROM orders;


-- 7. Categorize orders based on Order Status
SELECT Order_ID, Order_Status,
       CASE
           WHEN Order_Status = 'Completed' THEN 'Successful'
           WHEN Order_Status = 'Cancelled' THEN 'Unsuccessful'
           ELSE 'In Progress'
       END AS Status_Category
FROM orders;


-- 8. Identify profitable and loss-making orders
SELECT Order_ID, Sales, Profit,
       CASE
           WHEN Profit > 0 THEN 'Profitable'
           WHEN Profit < 0 THEN 'Loss'
           ELSE 'Break Even'
       END AS Profit_Status
FROM orders;


-- 9. Categorize customers based on Customer Segment
SELECT Order_ID, Custormer_Name, Customer_Segment,
       CASE
           WHEN Customer_Segment = 'Consumer' THEN 'Individual Customer'
           WHEN Customer_Segment = 'Corporate' THEN 'Business Customer'
           WHEN Customer_Segment = 'Home Office' THEN 'Home Business Customer'
           ELSE 'Other'
       END AS Customer_Type
FROM orders;


-- 10. Categorize sales performance by Region
SELECT Order_ID, Region, Sales,
       CASE
           WHEN Sales >= 5000 THEN 'Top Performing Order'
           WHEN Sales >= 2000 THEN 'Average Performing Order'
           ELSE 'Low Performing Order'
       END AS Sales_Performance
FROM orders;