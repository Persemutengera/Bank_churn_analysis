# Project Summary — Bank Customer Churn Analysis

## Objective
Analyse bank customer churn and identify segments with elevated churn rates using Python, MySQL, and Power BI to support evidence-based retention investigations.

## Dataset
The dataset contains 10,000 customer records and 14 columns, including geography, gender, age, tenure, balance, number of products, credit-card ownership, active-member status, estimated salary, and the churn outcome (`Exited`).

## Tools and Methods
- **Python:** pandas and NumPy for data checks and analysis; Matplotlib for charts.
- **MySQL:** SQL queries for overall churn and segment-level comparisons.
- **Power BI:** KPI cards, slicers, charts, and retention insight pages.

## Data Quality
Initial Python checks found no missing values, duplicate rows, or duplicate customer IDs. Further validation of allowed values, plausible numeric ranges, and SQL import consistency is recommended.

## Key Results
- 10,000 customers analysed.
- 2,037 customers churned and 7,963 were retained.
- Overall churn rate: 20.37%.
- Germany had the highest country churn rate at 32.44%.
- Female churn rate was 25.07%, compared with 16.46% for male customers.
- Inactive-member churn rate was 26.85%, compared with 14.27% for active members.
- Churn was 27.71% for one-product customers and 7.58% for two-product customers. Three- and four-product groups had rates of 82.71% and 100%, but contained only 266 and 60 customers.

## Business Implications
Geography, activity status, gender, and product count are useful dimensions for further investigation. The findings are descriptive and do not establish causes. High churn rates in small groups should be interpreted alongside customer counts.

## Deliverables
- Python data quality check script.
- Python exploratory analysis script.
- Python visualisation script and four PNG charts.
- MySQL business-insights query file.
- Data dictionary, quality report, key findings, and recommendations.
- Power BI dashboard, once the final `.pbix` and screenshots are included.

## Conclusion
This project demonstrates an analytics workflow: checking data quality, exploring customer segments, generating visual evidence, querying business metrics, and translating observed patterns into testable recommendations. 
