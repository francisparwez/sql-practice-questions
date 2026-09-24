USE ECommerceDB;
GO
-- 1. Filtering
-- Find all orders where:
-- amount > 50,000
-- status = 'Completed'

SELECT *
FROM orders
WHERE
    amount > 50000
    AND status = 'Completed';

-- 2. Aggregation
-- Calculate:
-- Total revenue
-- Average order value
-- Minimum order value
-- Maximum order value
-- Number of orders

SELECT
	SUM(amount) AS [Total revenue],
	AVG(amount) AS [Average order value],
	MIN(amount) AS [Minimum order value],
	MAX(amount) AS [Maximum order value],
	COUNT(*) AS [Number of orders]
FROM
	orders;

-- 3. GROUP BY
-- Calculate total revenue for each order status.
-- Expected concept:
-- Completed → ...
-- Pending → ...
-- Cancelled → …

SELECT
	status,
	SUM(amount) AS [Total revenue]
FROM
	orders
GROUP BY status;

-- 4. HAVING
-- Find customers whose total spending exceeds 100,000.

SELECT
	c.customer_id,
	c.customer_name,
	SUM(o.amount) AS [Total revenue]
FROM
	customers c
JOIN
	orders o
ON
	c.customer_id = o.customer_id
GROUP BY
	c.customer_id, c.customer_name
HAVING
	SUM(o.amount) > 100000;

-- 5. CASE
-- Create a column:
-- Low
-- Medium
-- High
-- based on order amount:
-- < 10,000 → Low
-- 10,000–50,000 → Medium
-- > 50,000 → High

SELECT
    order_id,
    amount,
    CASE
        WHEN amount < 10000 THEN 'Low'
        WHEN amount >= 10000
        AND amount <= 50000 THEN 'Medium'
        WHEN amount > 50000 THEN 'High'
    END AS amount_category
FROM orders;