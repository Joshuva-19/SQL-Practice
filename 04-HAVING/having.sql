-- Day 4: HAVING Clause Practice
-- Database: ecommerce_sales
-- Table: orders

-- 1. Display regions having total sales greater than 50000
SELECT Region, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region
HAVING SUM(Sales) > 50000;

-- 2. Display categories having an average sales greater than 1000
SELECT Category, AVG(Sales) AS Average_Sales
FROM orders
GROUP BY Category
HAVING AVG(Sales) > 1000;

-- 3. Display customer segments having more than 100 orders
SELECT Customer_Segment, COUNT(Order_ID) AS Total_Orders
FROM orders
GROUP BY Customer_Segment
HAVING COUNT(Order_ID) > 100;

-- 4. Display states having total profit greater than 10000
SELECT State, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY State
HAVING SUM(Profit) > 10000;

-- 5. Display payment methods having more than 200 orders
SELECT Payment_Method, COUNT(Order_ID) AS Total_Orders
FROM orders
GROUP BY Payment_Method
HAVING COUNT(Order_ID) > 200;

-- 6. Display shipping modes having average shipping cost greater than 100
SELECT Shipping_Mode, AVG(Shipping_Cost) AS Average_Shipping_Cost
FROM orders
GROUP BY Shipping_Mode
HAVING AVG(Shipping_Cost) > 100;

-- 7. Display sales representatives having total sales greater than 100000
SELECT Sales_Rep, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Sales_Rep
HAVING SUM(Sales) > 100000;

-- 8. Display sub-categories having average profit greater than 500
SELECT Sub_Category, AVG(Profit) AS Average_Profit
FROM orders
GROUP BY Sub_Category
HAVING AVG(Profit) > 500;

-- 9. Display regions having more than 500 orders
SELECT Region, COUNT(Order_ID) AS Total_Orders
FROM orders
GROUP BY Region
HAVING COUNT(Order_ID) > 500;

-- 10. Display product categories having total quantity sold greater than 1000
SELECT Category, SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY Category
HAVING SUM(Quantity) > 1000;