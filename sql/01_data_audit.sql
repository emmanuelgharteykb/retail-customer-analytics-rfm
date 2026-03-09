# Checking if data is clean

SELECT 
    COUNT(*) as total_rows,
    COUNTIF(CustomerID IS NULL) as missing_customers,
    COUNTIF(UnitPrice <= 0) as zero_price_items,
    MIN(InvoiceDate) as start_date,
    MAX(InvoiceDate) as end_date
FROM `retail-analytics-project-101.retail_analytics.raw_transactions`;

# Observation
-- 1. Missing customers = 0
-- 2. Total rows - 397,924 which means the Python script successfully cleaned the data
-- 3. The start and end dates both confirm the entire dataset is from Dec 2010 to Dec 2011
