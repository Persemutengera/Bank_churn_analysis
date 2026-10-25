CREATE DATABASE churn_analysis;

USE churn_analysis;

-- Creating a table

CREATE TABLE customers (
    RowNumber INT PRIMARY KEY,
    CustomerId BIGINT NOT NULL UNIQUE,
    Surname VARCHAR(100),
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    Tenure INT,
    Balance DECIMAL(15,2),
    NumOfProducts INT,
    HasCrCard TINYINT,
    IsActiveMember TINYINT,
    EstimatedSalary DECIMAL(15,2),
    Exited TINYINT
);
