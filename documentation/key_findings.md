# Key Findings — Bank Customer Churn Analysis

## Overall Results
- Customers analysed: **10,000**
- Churned customers: **2,037**
- Retained customers: **7,963**
- Overall churn rate: **20.37%**
- Overall retention rate: **79.63%**

## Churn by Geography

| Country | Customers | Churned | Churn rate |
|---|---:|---:|---:|
| Germany | 2,509 | 814 | 32.44% |
| Spain | 2,477 | 413 | 16.67% |
| France | 5,014 | 810 | 16.15% |

Germany has the highest observed churn rate, at 32.44%, around twice the rates observed in Spain and France. It is a priority for further investigation, while considering customer mix and sample sizes.

## Churn by Gender

| Gender | Customers | Churned | Churn rate |
|---|---:|---:|---:|
| Female | 4,543 | 1,139 | 25.07% |
| Male | 5,457 | 898 | 16.46% |

Female customers have a churn rate 8.61 percentage points higher than male customers in this dataset. This descriptive difference does not explain the cause of churn.

## Churn by Active Membership

| Membership status | Customers | Churned | Churn rate |
|---|---:|---:|---:|
| Inactive | 4,849 | 1,302 | 26.85% |
| Active | 5,151 | 735 | 14.27% |

Inactive members have a churn rate 12.58 percentage points higher than active members. Engagement is a useful area to investigate, but the data alone cannot show whether inactivity causes churn.

## Churn by Number of Products

| Products held | Customers | Churned | Churn rate |
|---:|---:|---:|---:|
| 1 | 5,084 | 1,409 | 27.71% |
| 2 | 4,590 | 348 | 7.58% |
| 3 | 266 | 220 | 82.71% |
| 4 | 60 | 60 | 100.00% |

The three- and four-product groups have very high observed churn rates but are much smaller than the other groups. Validate these segments before using them to guide product strategy.

## Summary
Geography, active membership, gender, and number of products are useful dimensions for further churn investigation. These are associations, not causal conclusions.
