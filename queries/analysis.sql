-- 1. Revenue by store
SELECT
    s.store_name,
    s.city,
    ROUND(SUM(oi.quantity * p.price), 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * p.price) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders o
JOIN stores s ON o.store_id = s.store_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY s.store_id, s.store_name, s.city
ORDER BY total_revenue DESC;

-- 2. Best-selling products
SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * p.price), 2) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC;

-- 3. Revenue by category
SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * p.price), 2) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 4. Daily revenue trend
SELECT
    o.order_date,
    ROUND(SUM(oi.quantity * p.price), 2) AS daily_revenue,
    COUNT(DISTINCT o.order_id) AS orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- 5. Customer value ranking
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.loyalty_member,
        COUNT(DISTINCT o.order_id) AS order_count,
        ROUND(SUM(oi.quantity * p.price), 2) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name, c.loyalty_member
)
SELECT
    customer_name,
    CASE WHEN loyalty_member = 1 THEN 'Loyalty' ELSE 'Standard' END AS customer_type,
    order_count,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS spend_rank
FROM customer_revenue
ORDER BY spend_rank;

-- 6. Loyalty vs standard customer behavior
SELECT
    CASE WHEN c.loyalty_member = 1 THEN 'Loyalty' ELSE 'Standard' END AS customer_type,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.quantity * p.price), 2) AS revenue,
    ROUND(SUM(oi.quantity * p.price) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.loyalty_member;

-- 7. Revenue by time of day
SELECT
    CASE
        WHEN CAST(SUBSTR(order_time, 1, 2) AS INTEGER) BETWEEN 6 AND 10 THEN 'Morning'
        WHEN CAST(SUBSTR(order_time, 1, 2) AS INTEGER) BETWEEN 11 AND 14 THEN 'Midday'
        WHEN CAST(SUBSTR(order_time, 1, 2) AS INTEGER) BETWEEN 15 AND 18 THEN 'Afternoon'
        ELSE 'Evening'
    END AS daypart,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.quantity * p.price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY daypart
ORDER BY revenue DESC;

-- 8. Products commonly bought in the same order
SELECT
    p1.product_name AS product_a,
    p2.product_name AS product_b,
    COUNT(*) AS times_bought_together
FROM order_items oi1
JOIN order_items oi2
    ON oi1.order_id = oi2.order_id
    AND oi1.product_id < oi2.product_id
JOIN products p1 ON oi1.product_id = p1.product_id
JOIN products p2 ON oi2.product_id = p2.product_id
GROUP BY p1.product_name, p2.product_name
ORDER BY times_bought_together DESC, product_a, product_b;

