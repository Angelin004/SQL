-- E-Commerce Analytics System
-- SQL + MySQL Advanced Project


-- 1. CREATE DATABASE
CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

-- 2. TABLE CREATION WITH DATATYPES + CONSTRAINTS

CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
email VARCHAR(120) UNIQUE,
city VARCHAR(50),
signup_date DATE,
status VARCHAR(20) DEFAULT 'ACTIVE'
);

CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(120),
category VARCHAR(50),
price DECIMAL(10,2) CHECK(price > 0),
stock INT
);

CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
order_date DATE,
status VARCHAR(30),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
order_item_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
product_id INT,
quantity INT CHECK(quantity > 0),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
payment_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
amount DECIMAL(10,2),
payment_method VARCHAR(30),
payment_date DATE,
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 3. INSERT SAMPLE DATA

INSERT INTO customers(name,email,city,signup_date) VALUES
('John','john@gmail.com','New York','2023-01-01'),
('Alice','alice@gmail.com','London','2023-01-02'),
('David','david@gmail.com','Toronto','2023-01-03'),
('Sophia','sophia@gmail.com','Paris','2023-01-04'),
('Michael','michael@gmail.com','Berlin','2023-01-05'),
('Emma','emma@gmail.com','Tokyo','2023-01-06'),
('Daniel','daniel@gmail.com','Sydney','2023-01-07'),
('Olivia','olivia@gmail.com','Rome','2023-01-08'),
('James','james@gmail.com','Dubai','2023-01-09'),
('Ava','ava@gmail.com','Singapore','2023-01-10');

INSERT INTO products(product_name,category,price,stock) VALUES
('Laptop','Electronics',800,20),
('Headphones','Electronics',150,50),
('Shoes','Fashion',120,40),
('Smartphone','Electronics',900,25),
('Watch','Fashion',200,30),
('Backpack','Accessories',80,60),
('Keyboard','Electronics',60,70),
('Gaming Mouse','Electronics',50,100)

-- 4. BASIC QUERIES


SELECT * FROM customers;
SELECT * FROM products;

-- SORTING
SELECT * FROM products ORDER BY price DESC;

-- 5. CASE FUNCTION

SELECT product_name,
price,
CASE
WHEN price > 500 THEN 'Expensive'
WHEN price BETWEEN 100 AND 500 THEN 'Medium'
ELSE 'Cheap'
END AS price_category
FROM products;

-- 6. CHARACTER FUNCTIONS

SELECT UPPER(name) FROM customers;
SELECT LOWER(email) FROM customers;
SELECT LENGTH(name) FROM customers;

-- 7. NUMBER FUNCTIONS

SELECT ROUND(price,0) FROM products;
SELECT CEILING(price) FROM products;
SELECT FLOOR(price) FROM products;

-- 8. AGGREGATE FUNCTIONS

SELECT COUNT(*) FROM customers;
SELECT AVG(price) FROM products;
SELECT MAX(price) FROM products;
SELECT MIN(price) FROM products;


-- 9. DATE FUNCTIONS

SELECT NOW();
SELECT CURDATE();
SELECT YEAR(signup_date) FROM customers;

-- =============================================
-- 10. CONDITIONAL FUNCTIONS
-- =============================================

SELECT name,
IF(city='London','UK','Other Country')
FROM customers;

-- 11. CONVERSION FUNCTIONS

SELECT CAST(price AS SIGNED) FROM products;
SELECT CONVERT(price,CHAR) FROM products;

-- 12. NULL FUNCTIONS

SELECT IFNULL(city,'Unknown City')
FROM customers;

-- 13. JOINS

SELECT customers.name,orders.order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT customers.name,orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- 14. SET OPERATORS

SELECT city FROM customers
UNION
SELECT category FROM products;

-- 15. SUBQUERY

SELECT name
FROM customers
WHERE customer_id IN
(
SELECT customer_id
FROM orders
);

-- 16. ANALYTIC (WINDOW) FUNCTIONS

SELECT product_name,
price,
RANK() OVER (ORDER BY price DESC) AS price_rank
FROM products;

-- 17. VIEW

CREATE VIEW product_view AS
SELECT product_name,price
FROM products;

SELECT * FROM product_view;

-- 18. INDEX

CREATE INDEX idx_customer_city
ON customers(city);

-- 19. TRIGGER

DELIMITER $$

CREATE TRIGGER reduce_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
UPDATE products
SET stock = stock - NEW.quantity
WHERE product_id = NEW.product_id;
END$$

DELIMITER ;

-- 20. STORED PROCEDURE

DELIMITER $$

CREATE PROCEDURE getCustomerOrders()
BEGIN
SELECT customers.name,orders.order_id
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;
END$$

DELIMITER ;

CALL getCustomerOrders();

-- 21. REGEX

SELECT name
FROM customers
WHERE email REGEXP 'gmail.com';

-- 22. ADVANCED ANALYTICS
SELECT category,
COUNT(*) AS total_products
FROM products
GROUP BY category;

SELECT city,
COUNT(*) AS total_customers
FROM customers
GROUP BY city;

