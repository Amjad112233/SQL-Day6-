CREATE TABLE products (
    product_name VARCHAR(50),
    category VARCHAR(20)
);

INSERT INTO products
VALUES
('Laptop', 'Electronics'),
('Phone', 'Electronics'),
('Headphones', 'Electronics'),
('Shoes', 'Fashions');

SELECT * FROM products;

SELECT customers.name, orders.product, products.category, orders.amount
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
INNER JOIN products
ON orders.product = products.product_name;


-- Revenue by category
SELECT products.category, SUM(orders.amount) AS revenue
FROM orders
INNER JOIN products
ON orders.product = products.product_name
GROUP BY products.category;

-- Top customers by spending
SELECT customers.name, SUM(orders.amount) AS total_spent
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC
LIMIT 1;

-- Most popular category
SELECT products.category, COUNT(*) AS total_orders
FROM orders
INNER JOIN products
ON orders.product = products.product_name
GROUP BY products.category
ORDER BY total_orders DESC;


-- Customer + Category analysis
SELECT customers.name, products.category, SUM(orders.amount) AS spending
FROM orders
INNER JOIN customers 
ON orders.customer_id = customers.customer_id
INNER JOIN products
ON orders.product = products.product_name
GROUP BY customers.name, products.category;

