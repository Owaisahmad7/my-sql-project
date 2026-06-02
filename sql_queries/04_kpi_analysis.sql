/* | KPI                    | Meaning                   |
| ---------------------- | ------------------------- |
| Churn Rate             | Lost customers percentage |
| Retention Rate         | Stayed customers          |
| Avg Monthly Charges    | Revenue analysis          |
| Contract Type Analysis | Risk customers            |
| Tenure Analysis        | Loyal customers           |
*/


-- Average Monthly Charges 
SELECT ROUND(AVG(MonthlyCharges),2)
AS avg_monthly_charge
FROM customer_churn;

-- Churn Rate
SELECT
ROUND(
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
    *100.0/COUNT(*),2
) AS churn_rate
FROM customer_churn;



-- Retention rate
SELECT
ROUND(
SUM(CASE WHEN Churn='No' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS retention_rate
FROM customer_churn;