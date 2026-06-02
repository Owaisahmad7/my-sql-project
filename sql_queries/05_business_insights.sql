-- Which Internet Service Has Highest Churn?
SELECT InternetService,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_count
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_count DESC;
-- High Risk Customer 
SELECT customerID,
Contract,
MonthlyCharges,
Tenure
FROM customer_churn
WHERE Churn='Yes'
AND MonthlyCharges> 70
ORDER BY MonthlyCharges ASC;