-- Day 8: String Functions Practice
-- Database: ecommerce_sales
-- Table: orders


-- 1. Display customer names in uppercase
SELECT Custormer_Name,
       UPPER(Custormer_Name) AS Uppercase_Name
FROM orders;


-- 2. Display customer names in lowercase
SELECT Custormer_Name,
       LOWER(Custormer_Name) AS Lowercase_Name
FROM orders;


-- 3. Find the length of each customer name
SELECT Custormer_Name,
       LENGTH(Custormer_Name) AS Name_Length
FROM orders;


-- 4. Display product names in uppercase
SELECT Product_Name,
       UPPER(Product_Name) AS Uppercase_Product
FROM orders;


-- 5. Find the length of each product name
SELECT Product_Name,
       LENGTH(Product_Name) AS Product_Name_Length
FROM orders;


-- 6. Remove leading and trailing spaces from customer names
SELECT Custormer_Name,
       TRIM(Custormer_Name) AS Clean_Name
FROM orders;


-- 7. Display the first 5 characters of each product name
SELECT Product_Name,
       LEFT(Product_Name, 5) AS First_5_Characters
FROM orders;


-- 8. Display the last 5 characters of each product name
SELECT Product_Name,
       RIGHT(Product_Name, 5) AS Last_5_Characters
FROM orders;


-- 9. Extract the first 3 characters from each customer name
SELECT Custormer_Name,
       SUBSTRING(Custormer_Name, 1, 3) AS First_3_Characters
FROM orders;


-- 10. Replace spaces in customer names with underscores
SELECT Custormer_Name,
       REPLACE(Custormer_Name, ' ', '_') AS Modified_Name
FROM orders;


-- 11. Replace spaces in product names with hyphens
SELECT Product_Name,
       REPLACE(Product_Name, ' ', '-') AS Modified_Product
FROM orders;


-- 12. Find customers whose names contain the word 'John'
SELECT Custormer_Name
FROM orders
WHERE Custormer_Name LIKE '%John%';


-- 13. Find products whose names contain the word 'Laptop'
SELECT Product_Name
FROM orders
WHERE Product_Name LIKE '%Laptop%';


-- 14. Find customers whose names start with 'A'
SELECT Custormer_Name
FROM orders
WHERE Custormer_Name LIKE 'A%';


-- 15. Find products whose names end with 'Pro'
SELECT Product_Name
FROM orders
WHERE Product_Name LIKE '%Pro';


-- 16. Display customer names along with their customer segment
-- in a single column
SELECT CONCAT(Custormer_Name, ' - ', Customer_Segment) AS Customer_Details
FROM orders;


-- 17. Display product name and category together
SELECT CONCAT(Product_Name, ' - ', Category) AS Product_Details
FROM orders;


-- 18. Convert customer names to uppercase and remove extra spaces
SELECT UPPER(TRIM(Custormer_Name)) AS Clean_Customer_Name
FROM orders;


-- 19. Find the length of product names that contain more than 10 characters
SELECT Product_Name,
       LENGTH(Product_Name) AS Product_Name_Length
FROM orders
WHERE LENGTH(Product_Name) > 10;


-- 20. Display customer names in uppercase along with their region
SELECT UPPER(Custormer_Name) AS Customer_Name,
       Region
FROM orders;