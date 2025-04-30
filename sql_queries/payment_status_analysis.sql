-- Query 1: Payment status distribution
SELECT 
    payment_status,
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM payments), 2) AS percentage
FROM 
    payments
GROUP BY 
    payment_status
ORDER BY 
    count DESC;
    
-- Query 2: Payment failure analysis by payment method
SELECT 
    payment_method,
    COUNT(*) AS total_payments,
    COUNT(CASE WHEN payment_status = 'Failed' THEN 1 END) AS failed_payments,
    ROUND((COUNT(CASE WHEN payment_status = 'Failed' THEN 1 END) * 100.0) / COUNT(*), 2) AS failure_rate
FROM 
    payments
GROUP BY 
    payment_method
ORDER BY 
    failure_rate DESC;
    
-- Query 3: Monthly payment status trends
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    COUNT(*) AS total_payments,
    COUNT(CASE WHEN payment_status = 'Success' THEN 1 END) AS successful_payments,
    ROUND((COUNT(CASE WHEN payment_status = 'Success' THEN 1 END) * 100.0) / COUNT(*), 2) AS success_rate
FROM 
    payments
GROUP BY 
    month
ORDER BY 
    month;