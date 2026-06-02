/* | KPI                    | Meaning                   |
| ---------------------- | ------------------------- |
| Churn Rate             | Lost customers percentage |
| Retention Rate         | Stayed customers          |
| Avg Monthly Charges    | Revenue analysis          |
| Contract Type Analysis | Risk customers            |
| Tenure Analysis        | Loyal customers           |
*/
-- Churn by Contract Type
SELECT Contract,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customer_churn
GROUP BY Contract;
-- Average Monthly Charges 
SELECT ROUND(AVG(MonthlyCharges),2)
AS avg_monthly_charge
FROM customer_churn;