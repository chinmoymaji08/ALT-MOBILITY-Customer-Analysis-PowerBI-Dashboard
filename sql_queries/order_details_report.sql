-- Comprehensive Order Details Report
SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    p.payment_id,
    p.payment_date,
    p.payment_method,
    p.payment_status,
    p.payment_amount,
    NULL AS fulfillment_days,
    CASE 
        WHEN p.payment_date IS NOT NULL AND o.order_date IS NOT NULL THEN
            DATEDIFF(p.payment_date, o.order_date)
        ELSE NULL
    END AS days_to_payment
FROM 
    customer_orders o
LEFT JOIN 
    payments p ON o.order_id = p.order_id
ORDER BY 
    o.order_date DESC;



-- Key Metrics Summary
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    SUM(p.payment_amount) AS total_revenue,
    ROUND(AVG(p.payment_amount), 2) AS avg_order_value,
    ROUND(SUM(p.payment_amount) / COUNT(DISTINCT o.customer_id), 2) AS revenue_per_customer,
    NULL AS avg_fulfillment_days, -- Fulfillment not available
    ROUND((COUNT(CASE WHEN p.payment_status = 'Success' THEN 1 END) * 100.0) / COUNT(*), 2) AS payment_success_rate
FROM 
    customer_orders o
LEFT JOIN 
    payments p ON o.order_id = p.order_id;
