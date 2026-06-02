-- (1)FINDING NULL VALUES
SELECT *
FROM customer_churn
WHERE TotalCharges IS NOT NULL;
-- (2) Remove Blank Value
DELETE FROM customer_churn
WHERE customerID IS NULL;