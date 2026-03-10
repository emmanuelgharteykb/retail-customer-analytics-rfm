WITH customer_metrics AS (
    -- Layer 1: Aggregate Transaction Data
    SELECT 
        CustomerID,
        MAX(InvoiceDate) as last_purchase_date,
        COUNT(DISTINCT InvoiceNo) as frequency,
        ROUND(SUM(Quantity * UnitPrice), 2) as monetary
    FROM `retail-analytics-project-101.retail_analytics.raw_transactions`
    GROUP BY CustomerID
),

rfm_counts AS (
    -- Layer 2: Calculate R, F, M Scores (1-5)
    SELECT 
        *,
        -- We use the dataset's max date as "today" (Dec 9, 2011)
        DATE_DIFF(DATE('2011-12-10'), DATE(last_purchase_date), DAY) as recency_days
    FROM customer_metrics
),

rfm_scores AS (
    -- Layer 3: Assign Percentiles
    SELECT 
        *,
        NTILE(5) OVER (ORDER BY recency_days DESC) as r_score, -- Higher days = Lower score
        NTILE(5) OVER (ORDER BY frequency ASC) as f_score,   -- Higher frequency = Higher score
        NTILE(5) OVER (ORDER BY monetary ASC) as m_score    -- Higher monetary = Higher score
    FROM rfm_counts
)

-- Final Output: Calculate Total RFM Score
SELECT 
    *,
    (r_score + f_score + m_score) as total_rfm_score,
    CONCAT(CAST(r_score AS STRING), CAST(f_score AS STRING), CAST(m_score AS STRING)) as rfm_cell
FROM rfm_scores
ORDER BY total_rfm_score DESC;

# Observations:
-- 1. There are over 310 customers with an rfm score of 555
-- 2. What this means:
-- Recency = 5 : These are active customers whose last purchawse was likely within the last 30 days during that period. 
-- Frequency = 5 : These are habitual shoppers. They don't just wait for Black Friday sale. They shop month-in and month-out. 
-- Monetary = 5 : These are highest spenders. They literally purchase items without concerns of the value of the items.
-- 3. A customer with rfm of 111 means the customer shopped once, spent the minimum and hasn't been seen in a year.
-- 4. A 555 customer is worth more than 30-50 "111" customers combined in terms of total profit.
