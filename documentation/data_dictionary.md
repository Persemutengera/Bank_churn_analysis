# Data Dictionary — Bank Customer Churn

## Dataset Overview
The source dataset contains 10,000 records and 14 columns. Each row represents one bank customer. Field names follow `Churn_Modelling.csv`.

| Column | Data type | Description | Notes |
|---|---|---|---|
| `RowNumber` | Integer | Row sequence in the source dataset | Source-row identifier; not a business metric |
| `CustomerId` | Integer or text | Customer identifier | Treat as an identifier, not a measure |
| `Surname` | Text | Customer surname | Personal information; avoid public-facing analysis |
| `CreditScore` | Integer | Customer credit score | Check plausible range against source documentation |
| `Geography` | Text | Customer country/market | Observed categories include France, Germany, Spain |
| `Gender` | Text | Gender category in the source | Avoid unsupported explanations |
| `Age` | Integer | Customer age in years | Check for missing or implausible values |
| `Tenure` | Integer | Length of time with the bank | Confirm unit in source documentation |
| `Balance` | Decimal | Customer account balance | Currency/unit not specified in column name |
| `NumOfProducts` | Integer | Number of bank products held | Some groups have small counts |
| `HasCrCard` | Integer/Boolean | Whether customer has a credit card | `1` = Yes; `0` = No |
| `IsActiveMember` | Integer/Boolean | Active-member indicator | `1` = Active; `0` = Inactive |
| `EstimatedSalary` | Decimal | Estimated customer salary | Currency/unit not specified in column name |
| `Exited` | Integer/Boolean | Whether customer left the bank | `1` = Churned; `0` = Retained; analysis target |

## Derived Fields and Metrics

| Derived field / metric | Definition |
|---|---|
| `Churn Status` | `Exited = 1` → Churned; otherwise Retained |
| `Total Customers` | Count of distinct `CustomerId` values |
| `Churned Customers` | Count where `Exited = 1` |
| `Retained Customers` | Count where `Exited = 0` |
| `Churn Rate (%)` | Churned customers / total customers × 100 |
| `Retention Rate (%)` | Retained customers / total customers × 100 |
| `Credit Card Status` | `HasCrCard = 1` → Has Credit Card; `0` → No Credit Card |
| `Member Status` | `IsActiveMember = 1` → Active; `0` → Inactive |

## Interpretation Notes
- Do not sum `RowNumber` or `CustomerId`.
- `Exited` is the outcome field used to calculate churn.
- Do not assign a currency to `Balance` or `EstimatedSalary` unless confirmed by the source.
- Segment comparisons are descriptive and do not establish why a customer left.
- `Surname` is not needed for churn segmentation and should generally be excluded from visualisations.
