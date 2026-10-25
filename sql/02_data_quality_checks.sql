SELECT COUNT(*) AS total_customers
FROM customers;

SELECT Exited, COUNT(*) AS customer_count
FROM customers
GROUP BY Exited
ORDER BY Exited;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CustomerId) AS unique_customers,
    SUM(Exited = 1) AS churned_customers,
    SUM(Exited = 0) AS retained_customers
FROM customers;


USE churn_analysis;

SHOW TABLES;

DESCRIBE customers;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CustomerId) AS unique_customers,
    COUNT(*) - COUNT(DISTINCT CustomerId) AS duplicate_customer_ids
FROM customers;

SELECT
    SUM(CustomerId IS NULL) AS missing_customer_id,
    SUM(CreditScore IS NULL) AS missing_credit_score,
    SUM(Geography IS NULL) AS missing_geography,
    SUM(Gender IS NULL) AS missing_gender,
    SUM(Age IS NULL) AS missing_age,
    SUM(Tenure IS NULL) AS missing_tenure,
    SUM(Balance IS NULL) AS missing_balance,
    SUM(NumOfProducts IS NULL) AS missing_products,
    SUM(HasCrCard IS NULL) AS missing_credit_card,
    SUM(IsActiveMember IS NULL) AS missing_active_status,
    SUM(EstimatedSalary IS NULL) AS missing_salary,
    SUM(Exited IS NULL) AS missing_churn_status
FROM customers;

SELECT
    SUM(Age <= 0) AS invalid_age,
    SUM(CreditScore < 0 OR CreditScore > 850)
        AS invalid_credit_score,
    SUM(Tenure < 0 OR Tenure > 10)
        AS invalid_tenure,
    SUM(NumOfProducts <= 0)
        AS invalid_product_count,
    SUM(HasCrCard NOT IN (0, 1))
        AS invalid_credit_card_flag,
    SUM(IsActiveMember NOT IN (0, 1))
        AS invalid_active_flag,
    SUM(Exited NOT IN (0, 1))
        AS invalid_churn_flag
FROM customers;

-- Checking duplicates and categorical values

SELECT
    CustomerId,
    COUNT(*) AS occurrences
FROM customers
GROUP BY CustomerId
HAVING COUNT(*) > 1;

SELECT DISTINCT Geography
FROM customers
ORDER BY Geography;

SELECT DISTINCT Gender
FROM customers
ORDER BY Gender;

SELECT Exited, COUNT(*) AS customer_count
FROM customers
GROUP BY Exited
ORDER BY Exited;