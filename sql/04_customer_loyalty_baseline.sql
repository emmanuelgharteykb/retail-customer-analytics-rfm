# Checking current distributing of one time customers and repeat customers

WITH customer_orders AS (
    SELECT CustomerID, COUNT(DISTINCT InvoiceNo) as order_count
    FROM `retail-analytics-project-101.retail_analytics.raw_transactions`
    GROUP BY 1
)
SELECT 
    order_count,
    COUNT(CustomerID) as customer_count
FROM customer_orders
GROUP BY 1
ORDER BY 1 LIMIT 10;

# Observation
-- 1. This query counted how many customers have shopped once, twice, three times, etc.
-- 2. A total of 1,494 customers placed only one order. This mighht be first time customers or risk of potentially losing customers.
-- 3. Just an insight - Converting at least 10% of these into a second order would significantly boost revenue
-- 4. A total of 835 customers shopped only twice. 
-- 5. A total of 54 customers shopped ten times.

