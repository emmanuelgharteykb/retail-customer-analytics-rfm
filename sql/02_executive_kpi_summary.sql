# Calculating KPIs

SELECT 
    COUNT(DISTINCT InvoiceNo) as total_orders,
    COUNT(DISTINCT CustomerID) as total_customers,
    ROUND(SUM(Quantity * UnitPrice), 2) as total_revenue,
    ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) as avg_order_value
FROM `retail-analytics-project-101.retail_analytics.raw_transactions`;

# Observations
-- 1. This provided the four most important numbers for any retail business; total orders, total customers, total revenue, and average order value
-- Total orders = 18,536
-- Total customers = 4,339
-- Average order value = £480.76
