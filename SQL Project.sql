CREATE DATABASE food_industry;
USE food_industry;
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(50) NOT NULL,
    city VARCHAR(30),
    contact VARCHAR(15) UNIQUE
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    role VARCHAR(30),
    salary DECIMAL(10,2) CHECK (salary > 10000),
    join_date DATE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    price DECIMAL(8,2),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO suppliers VALUES
(1,'Fresh Farms','Chennai','9000011111'),
(2,'Green Veg','Coimbatore','9000022222'),
(3,'Dairy Best','Salem','9000033333'),
(4,'Spice World','Madurai','9000044444'),
(5,'Meat Hub','Trichy','9000055555');
INSERT INTO employees VALUES
(1,'Ravi','Chef',35000,'2022-01-10'),
(2,'Anu','Quality Manager',42000,'2021-03-15'),
(3,'Suresh','Packaging',25000,'2023-05-20'),
(4,'Meena','Store Manager',48000,'2020-11-25'),
(5,'Arjun','Delivery',30000,'2022-08-30');
INSERT INTO products VALUES
(1,'Veg Burger','Fast Food',80,1),
(2,'Chicken Pizza','Fast Food',250,5),
(3,'Milk Shake','Beverage',120,3),
(4,'Paneer Roll','Fast Food',150,2),
(5,'Spicy Noodles','Fast Food',140,4),
(6,'Ice Cream','Dessert',100,3);
INSERT INTO orders VALUES
(1,1,10,'2025-01-01'),
(2,2,5,'2025-01-01'),
(3,3,8,'2025-01-02'),
(4,4,6,'2025-01-02'),
(5,5,7,'2025-01-03'),
(6,6,12,'2025-01-03');
SORTING DATA
SELECT * FROM products ORDER BY price DESC;
CASE MANIPULATION FUNCTION
SELECT UPPER(product_name), LOWER(category) FROM products;
CHARACTER MANIPULATION FUNCTION
SELECT product_name,LENGTH(product_name),SUBSTRING(product_name,1,4)FROM products;
NUMBER FUNCTION
SELECT product_name, ROUND(price), CEIL(price), FLOOR(price)FROM products;
NULL FUNCTION
SELECT emp_name, IFNULL(role,'Not Assigned') FROM employees;
DATE FUNCTION
SELECT product_name, price, GREATEST(price,150) FROM products;
SELECT emp_name,join_date,YEAR(join_date),DATEDIFF(CURDATE(), join_date) AS experience_days FROM employees;
SELECT emp_name FROM employees;
AGGREGATE FUNCTION
SELECT product_name FROM products WHERE price > (SELECT AVG(price) FROM products);
ANALYTICS FUNCTION
SELECT product_name, category,RANK() OVER (PARTITION BY category ORDER BY price DESC) AS rank_price FROM products;
JOINS
CREATE VIEW food_view AS SELECT p.product_name, p.price, s.supplier_name FROM products p JOIN suppliers s ON p.supplier_id = s.supplier_id;
VIEW
SELECT * FROM food_view;
INDEX
CREATE INDEX idx_product_price ON products(price);
STORED PROCEDURE
DELIMITER 
CREATE PROCEDURE expensive_food()
BEGIN
    SELECT product_name, price FROM products WHERE price > 150;
END
DELIMITER ;
CALL expensive_food();
TRIGGER
DELIMITER 
CREATE TRIGGER after_order AFTER INSERT ON orders FOR EACH ROW
BEGIN
    INSERT INTO audit_log(action)
    VALUES ('New order placed');
END 
DELIMITER ;
REGEX
SELECT * FROM suppliers
WHERE supplier_name REGEXP '^D';

