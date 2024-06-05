-- Queries and Reports
-- Monthly Sales Report

-- Monthly sales report
SELECT date_trunc('month', order_date) AS month, SUM(total) AS total_sales
FROM orders
GROUP BY month
ORDER BY month;

-- Top-rated products
SELECT p.product_id, p.product_name, AVG(r.rating) AS average_rating
FROM products p
JOIN reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(r.review_id) > 0
ORDER BY average_rating DESC;

-- Inventory status
SELECT p.product_id, p.product_name, i.quantity
FROM products p
JOIN inventory i ON p.product_id = i.product_id
ORDER BY i.quantity ASC;

-- User order history
SELECT u.user_id, u.username, o.order_id, o.order_date, o.total
FROM users u
JOIN orders o ON u.user_id = o.user_id
ORDER BY u.user_id, o.order_date DESC;

-- Product sales report
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_quantity_sold, SUM(oi.price * oi.quantity) AS total_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;

