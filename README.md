# 🏦 Bank Customer Churn Analysis

## Project Overview
This portfolio project analyses bank customer churn using **Python, MySQL, and Power BI**. The objective is to understand which customer segments have higher churn rates and turn the findings into practical retention questions and recommendations.

The dataset contains 10,000 customer records and 14 columns. Python is used for data quality checks, exploratory analysis, and chart generation; SQL supports business-focused queries; and Power BI provides interactive reporting.

## Business Questions
- What proportion of customers have left the bank?
- How does churn differ by geography and gender?
- Is churn associated with active membership?
- How do churn rates vary by number of products held?
- Which customer segments should be investigated first?

## Tools
- Python: pandas, NumPy, Matplotlib
- SQL: MySQL
- Visualisation: Power BI
- Development: VS Code, Git, GitHub

## Dataset
Expected source file: `data/Churn_Modelling.csv`.

The dataset includes geography, age, tenure, account balance, product count, credit-card ownership, active-member status, estimated salary, and the target field `Exited`.

## Repository Structure
```text
bank-customer-churn-analysis/
├── README.md
├── data/Churn_Modelling.csv
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_quality_checks.sql
│   ├── 03_exploratory_data_analysis.sql
│   ├── 04_customer_churn_analysis.sql
│   └── business_insights.sql
├── python/
│   ├── 01_data_quality_checks.py
│   ├── 02_exploratory_data_analysis.py
│   ├── 03_churn_visualizations.py
│   ├── requirements.txt
│   └── outputs/
├── powerbi/
│   ├── Bank_Customer_Churn_Analysis.pbix
│   └──dashboard_screenshots/
├── documentation/
│   ├── data_dictionary.md
│   ├── data_quality_report.md
│   ├── key_findings.md
│   └── recommendations.md
└── reports/project_summary.md
```

## How to Run the Python Analysis
Run from the repository root:
```bash
python -m pip install -r python/requirements.txt
python python/01_data_quality_checks.py
python python/02_exploratory_data_analysis.py
python python/03_churn_visualizations.py
```
The visualisation script saves PNG charts to `python/outputs/`.

## Headline Results
- Customers analysed: **10,000**
- Churned customers: **2,037**
- Retained customers: **7,963**
- Overall churn rate: **20.37%**
- Germany churn rate: **32.44%**
- Female churn rate: **25.07%**; male churn rate: **16.46%**
- Inactive-member churn rate: **26.85%**; active-member churn rate: **14.27%**
- Churn by product count: 1 product: **27.71%**; 2 products: **7.58%**; 3 products: **82.71%**; 4 products: **100.00%**

The three- and four-product segments contain only 266 and 60 customers respectively, so their high rates require careful investigation. These are descriptive associations, not proof of cause.

## Power BI Report
The report is designed around three pages:
1. **Customer Churn Overview** — headline KPIs and overall churn distribution.
2. **Customer Churn Analysis** — churn by geography, age, gender, tenure, product count, activity, and credit-card status.
3. **Customer Retention Insights** — segment comparisons and evidence-based retention questions.

Add the `.pbix` file and screenshots when they are ready to share.

## Data Quality Summary
Initial Python checks reported 10,000 rows, 14 columns, no missing values, no duplicate rows, and no duplicate `CustomerId` values. These results cover the tests performed and do not guarantee every field is valid.

## Limitations
- The analysis describes patterns; it does not establish causation.
- Some segments, especially customers with three or four products, are much smaller than others.
- Customer characteristics may be correlated; further analysis is needed before taking action.
- Confirm the dataset licence before publishing raw data.

## Author
**Perseverance Mutengera** — Entry-level Data Analyst portfolio project.
