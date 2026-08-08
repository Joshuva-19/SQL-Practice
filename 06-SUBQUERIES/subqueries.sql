```sql
-- Day 6: Subqueries Practice
-- Database: ecommerce_sales
-- Table: orders


-- 1. Display orders where Sales is greater than the average sales
SELECT Order_ID, Custormer_Name, Sales
FROM orders
WHERE Sales > (
    SELECT AVG(Sales)
    FROM orders
);


-- 2. Display orders where Profit is greater than the average profit
SELECT Order_ID, Custormer_Name, Profit
FROM orders
WHERE Profit > (
    SELECT AVG(Profit)
    FROM orders
);


-- 3. Display the order with the highest Sales
SELECT Order_ID, Custormer_Name, Sales
FROM orders
WHERE Sales = (
    SELECT MAX(Sales)
    FROM orders
);


-- 4. Display the order with the lowest Sales
SELECT Order_ID, Custormer_Name, Sales
FROM orders
WHERE Sales = (
    SELECT MIN(Sales)
    FROM orders
);


-- 5. Display products with Unit Price greater than the average Unit Price
SELECT Product_Name, Unit_Price
FROM orders
WHERE Unit_Price > (
    SELECT AVG(Unit_Price)
    FROM orders
);


-- 6. Display orders with Profit greater than the highest Profit from the South region
SELECT Order_ID, Custormer_Name, Region, Profit
FROM orders
WHERE Profit > (
    SELECT MAX(Profit)
    FROM orders
    WHERE Region = 'South'
);


-- 7. Display all orders belonging to the same category as the product 'Laptop'
SELECT Order_ID, Product_Name, Category, Sales
FROM orders
WHERE Category = (
    SELECT Category
    FROM orders
    WHERE Product_Name = 'Laptop'
    LIMIT 1
);


-- 8. Display all orders from the region having the highest total sales
SELECT Order_ID, Custormer_Name, Region, Sales
FROM orders
WHERE Region = (
    SELECT Region
    FROM orders
    GROUP BY Region
    ORDER BY SUM(Sales) DESC
    LIMIT 1
);


-- 9. Display all orders from the category having the highest total sales
SELECT Order_ID, Product_Name, Category, Sales
FROM orders
WHERE Category = (
    SELECT Category
    FROM orders
    GROUP BY Category
    ORDER BY SUM(Sales) DESC
    LIMIT 1
);


-- 10. Display customers who have placed orders with Sales greater than the average Sales
SELECT DISTINCT Custormer_Name
FROM orders
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM orders
    WHERE Sales > (
        SELECT AVG(Sales)
        FROM orders
    )
);


-- 11. Display products whose Unit Price is greater than the average Unit Price of their category
SELECT Product_Name, Category, Unit_Price
FROM orders o1
WHERE Unit_Price > (
    SELECT AVG(Unit_Price)
    FROM orders o2
    WHERE o2.Category = o1.Category
);


-- 12. Display orders whose Sales is greater than the average Sales of their region
SELECT Order_ID, Custormer_Name, Region, Sales
FROM orders o1
WHERE Sales > (
    SELECT AVG(Sales)
    FROM orders o2
    WHERE o2.Region = o1.Region
);


-- 13. Display orders whose Profit is greater than the average Profit of their category
SELECT Order_ID, Product_Name, Category, Profit
FROM orders o1
WHERE Profit > (
    SELECT AVG(Profit)
    FROM orders o2
    WHERE o2.Category = o1.Category
);


-- 14. Display customers who have placed at least one order
-- with Sales greater than 1000
SELECT DISTINCT Custormer_Name
FROM orders
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM orders
    WHERE Sales > 1000
);


-- 15. Display orders belonging to customers who have
-- an order with Profit greater than 500
SELECT Order_ID, Custormer_Name, Sales, Profit
FROM orders
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM orders
    WHERE Profit > 500
);


-- 16. Display products that have been ordered with
-- Quantity greater than the average Quantity
SELECT DISTINCT Product_Name
FROM orders
WHERE Product_ID IN (
    SELECT Product_ID
    FROM orders
    WHERE Quantity > (
        SELECT AVG(Quantity)
        FROM orders
    )
);


-- 17. Find the customer who generated the highest total Sales
SELECT Custormer_Name, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Customer_ID, Custormer_Name
HAVING SUM(Sales) = (
    SELECT MAX(Total_Sales)
    FROM (
        SELECT Customer_ID, SUM(Sales) AS Total_Sales
        FROM orders
        GROUP BY Customer_ID
    ) AS Customer_Sales
);


-- 18. Find the category with the highest total Profit
SELECT Category, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
HAVING SUM(Profit) = (
    SELECT MAX(Total_Profit)
    FROM (
        SELECT Category, SUM(Profit) AS Total_Profit
        FROM orders
        GROUP BY Category
    ) AS Category_Profit
);


-- 19. Display orders with Sales higher than every order
-- from the South region
SELECT Order_ID, Custormer_Name, Region, Sales
FROM orders
WHERE Sales > ALL (
    SELECT Sales
    FROM orders
    WHERE Region = 'South'
);


-- 20. Display orders with Sales higher than at least one
-- order from the South region
SELECT Order_ID, Custormer_Name, Region, Sales
FROM orders
WHERE Sales > ANY (
    SELECT Sales
    FROM orders
    WHERE Region = 'South'
);
```
