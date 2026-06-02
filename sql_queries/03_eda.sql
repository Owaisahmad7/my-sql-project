/* Exploratory Data Analysis */
-- Total Customer
SELECT COUNT(*) AS total_customer
FROM customer_churn;
-- Churn Customers
SELECT COUNT(*) AS churn_customers
FROM customer_churn
WHERE Churn = 'Yes';
-- Churn Rate
SELECT
ROUND(
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
    *100.0/COUNT(*),2
) AS churn_rate
FROM customer_churn;
-- Retained Cistomer 
SELECT COUNT(*) AS Retention_customers
FROM customer_churn
WHERE Churn = 'No';
