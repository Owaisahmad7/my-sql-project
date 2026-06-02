/* Exploratory Data Analysis */
-- Total Customer
SELECT COUNT(*) AS total_customer
FROM customer_churn;
-- Churn Customers
SELECT COUNT(*) AS churn_customers
FROM customer_churn
WHERE Churn = 'Yes';


-- Retained Cistomer 
SELECT COUNT(*) AS Retention_customers
FROM customer_churn
WHERE Churn = 'No';
