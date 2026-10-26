-- Bank Customer Churn Analysis: Business Insights
-- MySQL table named `customers` with columns matching Churn_Modelling.csv.
-- Exited: 1 = churned; 0 = retained.

-- 1. Overall churn and retention
SELECT
    COUNT(DISTINCT CustomerId) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
          / NULLIF(COUNT(DISTINCT CustomerId), 0), 2) AS churn_rate_pct,
    ROUND(100.0 * SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END)
          / NULLIF(COUNT(DISTINCT CustomerId), 0), 2) AS retention_rate_pct
FROM customers;

-- 2. Churn by geography
SELECT Geography, COUNT(*) AS customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * AVG(Exited), 2) AS churn_rate_pct
FROM customers
GROUP BY Geography
ORDER BY churn_rate_pct DESC;

-- 3. Churn by gender
SELECT Gender, COUNT(*) AS customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * AVG(Exited), 2) AS churn_rate_pct
FROM customers
GROUP BY Gender
ORDER BY churn_rate_pct DESC;

-- 4. Churn by active membership
SELECT CASE WHEN IsActiveMember = 1 THEN 'Active' ELSE 'Inactive' END AS member_status,
       COUNT(*) AS customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * AVG(Exited), 2) AS churn_rate_pct
FROM customers
GROUP BY IsActiveMember
ORDER BY churn_rate_pct DESC;

-- 5. Churn by number of products
SELECT NumOfProducts, COUNT(*) AS customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * AVG(Exited), 2) AS churn_rate_pct
FROM customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-- 6. Churn by age band
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age < 40 THEN '30-39'
        WHEN Age < 50 THEN '40-49'
        WHEN Age < 60 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * AVG(Exited), 2) AS churn_rate_pct
FROM customers
GROUP BY age_group
ORDER BY MIN(Age);

-- 7. Churn by tenure
SELECT Tenure, COUNT(*) AS customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * AVG(Exited), 2) AS churn_rate_pct
FROM customers
GROUP BY Tenure
ORDER BY Tenure;

-- 8. Churn by credit-card ownership
SELECT CASE WHEN HasCrCard = 1 THEN 'Has Credit Card' ELSE 'No Credit Card' END AS credit_card_status,
       COUNT(*) AS customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * AVG(Exited), 2) AS churn_rate_pct
FROM customers
GROUP BY HasCrCard
ORDER BY churn_rate_pct DESC;

-- 9. Churn by activity and geography
SELECT Geography,
       CASE WHEN IsActiveMember = 1 THEN 'Active' ELSE 'Inactive' END AS member_status,
       COUNT(*) AS customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * AVG(Exited), 2) AS churn_rate_pct
FROM customers
GROUP BY Geography, IsActiveMember
ORDER BY Geography, churn_rate_pct DESC;

-- 10. Flag small product groups for careful interpretation
SELECT NumOfProducts, COUNT(*) AS customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * AVG(Exited), 2) AS churn_rate_pct
FROM customers
GROUP BY NumOfProducts
HAVING COUNT(*) < 500
ORDER BY churn_rate_pct DESC;
