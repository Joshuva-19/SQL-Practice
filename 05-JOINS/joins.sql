-- Day 5: JOINS Practice
-- Database: ecommerce_sales

-- ==========================================
-- INNER JOIN
-- Display customer name along with order details
-- ==========================================

SELECT o.Order_ID,
       c.Customer_Name,
       o.Order_Date,
       o.Sales
FROM Orders o
INNER JOIN Customers c
ON o.Customer_ID = c.Customer_ID;

-- ==========================================
-- LEFT JOIN
-- Display all customers with their orders
-- ==========================================

SELECT c.Customer_Name,
       o.Order_ID,
       o.Sales
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

-- ==========================================
-- RIGHT JOIN
-- Display all orders even if customer details are missing
-- ==========================================

SELECT c.Customer_Name,
       o.Order_ID,
       o.Sales
FROM Customers c
RIGHT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

-- ==========================================
-- FULL OUTER JOIN
-- (Supported in some databases. MySQL requires UNION)
-- ==========================================

SELECT c.Customer_Name,
       o.Order_ID,
       o.Sales
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID

UNION

SELECT c.Customer_Name,
       o.Order_ID,
       o.Sales
FROM Customers c
RIGHT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

-- ==========================================
-- INNER JOIN with Product Table
-- ==========================================

SELECT o.Order_ID,
       p.Product_Name,
       o.Quantity,
       o.Sales
FROM Orders o
INNER JOIN Products p
ON o.Product_ID = p.Product_ID;

-- ==========================================
-- INNER JOIN with Sales Representative Table
-- ==========================================

SELECT o.Order_ID,
       s.Sales_Rep_Name,
       o.Sales
FROM Orders o
INNER JOIN Sales_Representatives s
ON o.Sales_Rep = s.Sales_Rep_ID;