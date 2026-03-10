WITH stats AS (
    SELECT
        SUM(monetary)                                            AS global_revenue,
        COUNT(CustomerID)                                        AS global_customer_count,
        SUM(CASE WHEN rfm_cell = '555' THEN monetary ELSE 0 END) AS champion_revenue,
        COUNT(CASE WHEN rfm_cell = '555' THEN CustomerID END)    AS champion_count
    FROM retail_analytics.rfm_scores
)

SELECT
    champion_count,
    ROUND((champion_count / global_customer_count) * 100, 2)     AS pct_of_customer_base,
    ROUND(champion_revenue, 2)                                   AS total_champion_spend,
    ROUND((champion_revenue / global_revenue) * 100, 2)          AS revenue_contribution_pct
FROM stats;

# Observation
-- 1. A total of 346 customers make up the champions, making up 7.97% of total customer base.
-- 2. Revenue generated from these elite small group is over £3 million, hence, contributing to 43.76% of the total revenue.
