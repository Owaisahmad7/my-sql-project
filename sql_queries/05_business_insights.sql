-- (1) Which Internet Service Has Highest Churn?
SELECT InternetService,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_count
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_count DESC;
/* Insight
Fiber optic users often show higher churn
 */

-- (2 )Churn by Contract Type
SELECT Contract,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,
       ROUND(
           SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
           *100.0/COUNT(*),2
       ) AS churn_rate
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

/* Insights 
Usually:
Month-to-month customers churn most
Long-term contracts retain customers better
 */

-- (3)High Risk Customer 
SELECT customerID,
Contract,
MonthlyCharges,
Tenure
FROM customer_churn
WHERE Churn='Yes'
AND MonthlyCharges> 70
ORDER BY MonthlyCharges ASC;

-- (4) High revenue customer leaving
SELECT customerID,
MonthlyCharges,
Tenure,
Contract
FROM customer_churn
WHERE Churn='Yes'
AND MonthlyCharges> 80
ORDER BY MonthlyCharges DESC;
/* Insight
Senior citizens may churn differently from younger customers.
 */

 -- (5) Gender-Based Churn
 SELECT Gender,
 COUNT(*) AS total_customer,
 SUM(CASE WHEN CHURN= 'Yes' THEN 1 ELSE 0 END) AS churn_customers
 FROM customer_churn
 GROUP BY gender;

 -- (6)Customers with Lowest Tenure Churn Most
 SELECT
CASE
    WHEN tenure <= 12 THEN '0-12 Months'
    WHEN tenure <= 24 THEN '13-24 Months'
    WHEN tenure <= 48 THEN '25-48 Months'
    ELSE '48+ Months'
END AS tenure_group,

COUNT(*) AS total_customers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers

FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_customers DESC;
/* Insight
New customers are more likely to churn.*/

-- (7)Revenue Loss Due to Churn
SELECT
ROUND(SUM(MonthlyCharges),2)
AS monthly_revenue_loss
FROM customer_churn
WHERE Churn='Yes';
/*Insight

Estimates monthly revenue lost from churned customers*/

-- (8)