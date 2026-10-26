# Data Quality Report — Bank Customer Churn

## Scope
Initial Python data quality checks were run against `data/Churn_Modelling.csv` using pandas. The checks covered dataset dimensions, missing values, duplicate rows, duplicate customer IDs, and the churn outcome distribution.

## Results

| Check | Result | Status |
|---|---:|---|
| Total records | 10,000 | Expected row count observed |
| Total columns | 14 | Expected column count observed |
| Missing values | 0 across all columns | Passed |
| Duplicate rows | 0 | Passed |
| Duplicate `CustomerId` values | 0 | Passed |
| Retained customers (`Exited = 0`) | 7,963 | Recorded |
| Churned customers (`Exited = 1`) | 2,037 | Recorded |
| Overall churn rate | 20.37% | Calculated |

## Method
`python/01_data_quality_checks.py` loads the CSV with pandas, prints row/column counts and column names, counts missing values, checks duplicate rows and IDs, summarises `Exited`, calculates the churn rate, and prints numeric descriptive statistics.

## Interpretation
No missing values or duplicates were found by the checks performed. The `Exited` field contains 2,037 churned customers out of 10,000, resulting in a 20.37% churn rate.

## Limitations and Further Checks
Passing these checks does **not** prove every value is accurate or valid. Additional checks should cover:
- allowed values for `Exited`, `HasCrCard`, and `IsActiveMember` (expected 0 or 1);
- plausible ranges for `Age`, `CreditScore`, `Tenure`, `NumOfProducts`, `Balance`, and `EstimatedSalary`;
- inconsistent category labels or whitespace;
- consistency between source CSV and SQL row counts;
- uniqueness of `RowNumber` and `CustomerId` after SQL import;
- whether transformations introduced nulls or changed data types.

## Reproducibility
From the repository root:
```bash
python python/01_data_quality_checks.py
```
These results reflect the output shared for the current analysis. Re-run the script if the data or cleaning process changes.
