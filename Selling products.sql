create database sales1;
use products;
SELECT product_name, SUM(quantity_sold) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;