-- Calculate the overall churn rate

SELECT
    COUNT(*) AS total_customers,
    SUM(Exited = 1) AS churned_customers,
    SUM(Exited = 0) AS retained_customers,
    ROUND(
        100.0 * SUM(Exited = 1) / COUNT(*),
        2
    ) AS churn_rate_pct
FROM customers;

-- Compare churn by country

SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited = 1) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited = 1) / COUNT(*),
        2
    ) AS churn_rate_pct
FROM customers
GROUP BY Geography
ORDER BY churn_rate_pct DESC;

SELECT
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(Exited = 1) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited = 1) / COUNT(*),
        2
    ) AS churn_rate_pct
FROM customers
GROUP BY IsActiveMember
ORDER BY IsActiveMember DESC;

-- Validate numeric ranges and binary fields

SELECT
    MIN(CreditScore) AS min_credit_score,
    MAX(CreditScore) AS max_credit_score,
    MIN(Age) AS min_age,
    MAX(Age) AS max_age,
    MIN(Tenure) AS min_tenure,
    MAX(Tenure) AS max_tenure,
    MIN(Balance) AS min_balance,
    MAX(Balance) AS max_balance,
    MIN(NumOfProducts) AS min_products,
    MAX(NumOfProducts) AS max_products,
    MIN(EstimatedSalary) AS min_salary,
    MAX(EstimatedSalary) AS max_salary
FROM customers;

-- Check business-rule violations

SELECT *
FROM customers
WHERE CreditScore NOT BETWEEN 350 AND 850
   OR Age NOT BETWEEN 18 AND 92
   OR Tenure NOT BETWEEN 0 AND 10
   OR Balance < 0
   OR NumOfProducts NOT BETWEEN 1 AND 4
   OR EstimatedSalary < 0
   OR HasCrCard NOT IN (0, 1)
   OR IsActiveMember NOT IN (0, 1)
   OR Exited NOT IN (0, 1);

SELECT 'HasCrCard' AS column_name, HasCrCard AS value, COUNT(*) AS records
FROM customers
GROUP BY HasCrCard

UNION ALL

SELECT 'IsActiveMember', IsActiveMember, COUNT(*)
FROM customers
GROUP BY IsActiveMember

UNION ALL

SELECT 'Exited', Exited, COUNT(*)
FROM customers
GROUP BY Exited;

-- Analyse churn by age group

SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age < 40 THEN '30-39'
        WHEN Age < 50 THEN '40-49'
        WHEN Age < 60 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(Exited = 1) AS churned_customers,
    ROUND(100.0 * SUM(Exited = 1) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age < 40 THEN '30-39'
        WHEN Age < 50 THEN '40-49'
        WHEN Age < 60 THEN '50-59'
        ELSE '60+'
    END
ORDER BY churn_rate_pct DESC;
