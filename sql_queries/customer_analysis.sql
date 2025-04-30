-- Query 1: Customer segmentation by order frequency
SELECT 
    customer_id,
    COUNT(*) AS order_count,
    CASE 
        WHEN COUNT(*) = 1 THEN 'One-time'
        WHEN COUNT(*) BETWEEN 2 AND 3 THEN 'Occasional'
        WHEN COUNT(*) BETWEEN 4 AND 10 THEN 'Regular'
        ELSE 'Loyal'
    END AS customer_segment
FROM 
    customer_orders
GROUP BY 
    customer_id
ORDER BY 
    order_count DESC;
    
-- Query 2: Customer ordering behavior over time
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(*) AS total_orders,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT customer_id), 2) AS avg_orders_per_customer
FROM 
    customer_orders
GROUP BY 
    month
ORDER BY 
    month;
    

-- Query 3: New vs returning customers by month
WITH first_order AS (
    SELECT 
        customer_id,
        DATE_FORMAT(MIN(order_date), '%Y-%m') AS first_order_month
    FROM 
        customer_orders
    GROUP BY 
        customer_id
)
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN f.first_order_month = DATE_FORMAT(o.order_date, '%Y-%m') THEN o.customer_id END) AS new_customers,
    COUNT(DISTINCT CASE WHEN f.first_order_month < DATE_FORMAT(o.order_date, '%Y-%m') THEN o.customer_id END) AS returning_customers
FROM 
    customer_orders o
JOIN 
    first_order f ON o.customer_id = f.customer_id
GROUP BY 
    month
ORDER BY 
    month;
