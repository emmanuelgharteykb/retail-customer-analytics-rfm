# Checking for the busiest time for the business

SELECT 
    FORMAT_DATE('%Y-%m', InvoiceDate) as month,
    ROUND(SUM(Quantity * UnitPrice), 2) as monthly_revenue,
    COUNT(DISTINCT InvoiceNo) as order_count
FROM `retail-analytics-project-101.retail_analytics.raw_transactions`
GROUP BY 1
ORDER BY 1;

# Observations:
-- 1. November 2011 generated highest revenue worth £1,161,817.38 with order count of 2,658 which also happens to be the highest.
-- 2. October 2011 generated second highest revenue worth £1,039,318.79 with 1,929 orders.
-- 3. Folling the second highest is September 2011, with monthly revenue of £952,838.38 and 1,756 orders.

