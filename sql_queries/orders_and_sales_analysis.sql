CREATE DATABASE IF NOT EXISTS alt_mobility;
USE alt_mobility;

CREATE TABLE customer_orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_date DATE,
    order_amount DECIMAL(10,2),
    shipping_address VARCHAR(255),
    order_status VARCHAR(50)
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_orders.csv'
INTO TABLE customer_orders
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE payments (
    payment_id VARCHAR(100) PRIMARY KEY,
    order_id VARCHAR(100),
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM customer_orders;
SELECT * FROM payments;

-- Query 1: Order status distribution
SELECT 
    order_status,
    COUNT(*) AS order_count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM customer_orders), 2) AS percentage
FROM 
    customer_orders
GROUP BY 
    order_status
ORDER BY 
    order_count DESC;

-- Query 2: Revenue trends by month
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(p.payment_amount) AS total_revenue,
    AVG(p.payment_amount) AS average_order_value
FROM 
    customer_orders o
JOIN 
    payments p ON o.order_id = p.order_id
WHERE 
    p.payment_status = 'completed'
GROUP BY 
    month
ORDER BY 
    month;



-- Query 3: Order fulfillment time analysis
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_order_amount
FROM 
    customer_orders
GROUP BY 
    month
ORDER BY 
    month;

