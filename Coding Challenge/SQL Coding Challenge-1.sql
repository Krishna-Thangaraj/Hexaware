create database ecom;
use ecom;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    price DECIMAL(10,2),
    stockQuantity INT
);

INSERT INTO products (product_id, name, description, price, stockQuantity) VALUES
(1, 'Refrigerator', 'Energy-efficient', 800.00, 10),
(2, 'Microwave Oven', 'Convection microwave', 300.00, 8),
(3, 'Blender', 'High-speed blender', 120.00, 20),
(4, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 100.00, 12);

SELECT * FROM products;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(255)
);

INSERT INTO customers (customer_id, firstname, lastname, email, address) VALUES
(1, 'John', 'Doe', 'john@example.com', '123 Main St, City'),
(2, 'Alice', 'Smith', 'alice@example.com', '456 Elm St, Village'),
(3, 'Robert', 'Brown', 'robert@example.com', '789 Oak St, Suburb'),
(4, 'Emma', 'Wilson', 'emma@example.com', '101 Redwood St, Country'),
(5, 'David', 'Clark', 'david@example.com', '202 Birch St, Town'),
(6, 'Olivia', 'Adams', 'olivia@example.com', '305 Pine St, Territory');

SELECT * FROM customers;


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2023-05-25', 1000.00),
(2, 2, '2023-06-15', 800.00),
(3, 3, '2023-06-25', 120.00),
(4, 4, '2023-07-05', 300.00),
(5, 5, '2023-07-15', 100.00),
(6, 6, '2023-07-25', 1400.00);

SELECT * FROM orders;

CREATE TABLE orderitem (
    orderitem_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    item_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orderitem (orderitem_id, order_id, product_id, quantity, item_amount) VALUES
(1, 1, 1, 2, 1000.00),
(2, 2, 2, 2, 600.00),
(3, 3, 3, 1, 120.00),
(4, 4, 4, 3, 300.00),
(5, 5, 1, 1, 800.00),
(6, 6, 2, 2, 600.00);

SELECT * FROM orderitem;


CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO cart (cart_id, customer_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 2),
(3, 3, 3, 1),
(4, 4, 4, 3),
(5, 5, 1, 1),
(6, 6, 2, 2);

SELECT * FROM cart;

-- 1 --
-- 1. Retrieve all product details.

UPDATE products SET price = 800 WHERE name = 'Refrigerator';

-- 2 --
-- 2. Retrieve the names and prices of all products.
DELETE FROM cart WHERE customer_id = 2;

-- 3 --
-- 3. Retrieve all customers who live in a specific city.
SELECT * FROM products WHERE price < 100;

-- 4 --
-- 4. Retrieve orders placed by a specific customer.
SELECT * FROM products WHERE stockQuantity > 5;

-- 5 --
-- 5. Retrieve all orders where the total amount is between 500 and 1000.
SELECT * FROM orders WHERE total_amount BETWEEN 500 AND 1000;

-- 6 --
-- 6. Retrieve all products that have a stock quantity of less than 5.
SELECT * FROM products WHERE name LIKE '%r';

-- 7 --
-- 7. Retrieve the total number of orders placed.
SELECT * FROM cart WHERE customer_id = 5;

-- 8 --
-- 8. Retrieve the average price of all products.
SELECT DISTINCT customer_id FROM orders WHERE YEAR(order_date) = 2023;

-- 9 --
-- 9. Retrieve the category and minimum stock quantity of each product category.
SELECT MIN(stockQuantity) FROM products;

-- 10 --
-- 10. Retrieve the highest-priced product.
SELECT customer_id, SUM(total_amount) FROM orders GROUP BY customer_id;

-- 11 --
-- 11. Retrieve the number of products available in stock for each product.
SELECT customer_id, AVG(total_amount) FROM orders GROUP BY customer_id;

-- 12 --
-- 12. Retrieve all customers who have placed an order.
SELECT customer_id, COUNT(order_id) FROM orders GROUP BY customer_id;

-- 13 --
-- 13. Retrieve the total revenue generated from all orders.
SELECT customer_id, MAX(total_amount) FROM orders GROUP BY customer_id;

-- 14 --
-- 14. Retrieve the most ordered product.
SELECT customer_id FROM orders GROUP BY customer_id HAVING SUM(total_amount) > 1000;

-- 15 --
-- 15. Retrieve the customers who have spent more than 1000 on orders.
SELECT * FROM products WHERE product_id NOT IN (SELECT product_id FROM cart);

-- 16 --
-- 16. Retrieve the total quantity of products sold for each product.
SELECT * FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders);

-- 17 --
-- 17. Retrieve the revenue percentage of each product.
SELECT product_id, 
       (SUM(item_amount) / (SELECT SUM(total_amount) FROM orders)) * 100 AS revenue_percentage 
FROM orderitem 
GROUP BY product_id;

-- 18 --
-- 18. Retrieve the names of products that have not been ordered.
SELECT c.customer_id, c.firstname, c.lastname, SUM(o.total_amount) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.firstname, c.lastname;

-- 19 --
-- 19. Retrieve the most recent order placed.
SELECT p.product_id, p.name, SUM(o.quantity) AS total_quantity_sold 
FROM products p 
JOIN orderitem o ON p.product_id = o.product_id 
GROUP BY p.product_id, p.name 
ORDER BY total_quantity_sold DESC 
LIMIT 5;






























