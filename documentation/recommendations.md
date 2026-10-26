# Recommendations — Bank Customer Churn Analysis

These recommendations are hypotheses to test based on observed churn differences, not proof of causation.

## 1. Investigate Churn in Germany
**Evidence:** Germany has a 32.44% churn rate, compared with 16.67% in Spain and 16.15% in France.

**Actions:**
- Compare tenure, age, balance, product holdings, and active-member status across countries.
- Review customer feedback, complaints, and service data if available.
- Test country-specific retention interventions against a baseline.

**Measure:** Churn rate, retained customers, and intervention uptake by country over a defined period.

## 2. Engage Inactive Customers
**Evidence:** Inactive customers have a 26.85% churn rate, compared with 14.27% for active customers.

**Actions:**
- Identify inactive customers who have not recently used relevant services.
- Test personalised communications, service reviews, or product education.
- Where possible, compare results with a suitable comparison group.

**Measure:** Reactivation rate, subsequent churn rate, and engagement with the intervention.

## 3. Investigate Gender Differences Carefully
**Evidence:** Female customers have a 25.07% churn rate and male customers have a 16.46% churn rate.

**Actions:**
- Examine whether age, geography, tenure, product count, or activity helps explain the difference.
- Review customer feedback by segment if appropriate data is available.
- Ensure any intervention is fair and complies with applicable privacy and equality requirements.

**Measure:** Compare churn across relevant segments without assuming gender itself is the cause.

## 4. Review Product-Holding Segments
**Evidence:** Churn is 27.71% for one-product customers and 7.58% for two-product customers. It is 82.71% for three-product customers and 100.00% for four-product customers.

**Actions:**
- Validate counts and definitions for the three- and four-product groups.
- Check whether these customers have distinct characteristics or service issues.
- Investigate product suitability and customer experience before making product changes.
- Do not treat the 100% rate among 60 customers as a stable prediction for all customers.

**Measure:** Track churn and customer outcomes by product count alongside segment size.

## 5. Establish Repeatable Monitoring
- Monitor churn and retention regularly when refreshed data and dates are available.
- Report churn rates alongside customer counts.
- Use SQL for reproducible analysis and Power BI for interactive monitoring.
- Re-run data quality checks after each data refresh.
- Record retention-test results and update recommendations based on evidence.

## Prioritisation
Begin by investigating Germany and inactive customers, whose observed churn rates are notably higher than the overall rate. In parallel, validate the small three- and four-product segments. These are starting points for investigation, not guaranteed solutions.
