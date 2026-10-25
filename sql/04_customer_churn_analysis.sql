-- Analyse churn by active-member status

SELECT
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(Exited = 1) AS churned_customers,
    ROUND(100.0 * SUM(Exited = 1) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY IsActiveMember
ORDER BY IsActiveMember DESC;

-- Analyse churn by number of products

SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited = 1) AS churned_customers,
    ROUND(100.0 * SUM(Exited = 1) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-- Analyse churn by tenure

SELECT
    Tenure,
    COUNT(*) AS total_customers,
    SUM(Exited = 1) AS churned_customers,
    ROUND(100.0 * SUM(Exited = 1) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY Tenure
ORDER BY Tenure;

-- Analyse churn by gender

SELECT
    Gender,
    COUNT(*) AS total_customers,
    SUM(Exited = 1) AS churned_customers,
    ROUND(100.0 * SUM(Exited = 1) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY Gender
ORDER BY churn_rate_pct DESC;

-- Compare financial characteristics

SELECT
    Exited,
    COUNT(*) AS total_customers,
    ROUND(AVG(CreditScore), 2) AS avg_credit_score,
    ROUND(AVG(Age), 2) AS avg_age,
    ROUND(AVG(Balance), 2) AS avg_balance,
    ROUND(AVG(NumOfProducts), 2) AS avg_products,
    ROUND(AVG(EstimatedSalary), 2) AS avg_salary
FROM customers
GROUP BY Exited
ORDER BY Exited;