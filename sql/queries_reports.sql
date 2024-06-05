-- Monthly sales report
SELECT date_trunc('month', order_date) AS month, SUM(total) AS total_sales
FROM orders
GROUP BY month
ORDER BY month;

-- Continue with the rest of the queries...
