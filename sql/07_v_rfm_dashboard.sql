CREATE OR REPLACE VIEW `retail-analytics-project-101.retail_analytics.v_rfm_dashboard` AS
SELECT 
    *,
    CASE 
        WHEN rfm_cell = '555' THEN 'Champions'
        WHEN rfm_cell IN ('545', '455', '454', '554', '544', '445') THEN 'Loyal Customers'
        WHEN rfm_cell IN ('511', '411', '512', '521') THEN 'New Customers'
        WHEN rfm_cell IN ('311', '331', '111') THEN 'Lost / Hibernating'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk Customers'
        ELSE 'Potential Loyalist'
    END AS customer_segment
FROM `retail-analytics-project-101.retail_analytics.rfm_scores`;

# Observation
-- 1. This created a dashboard for viewing or use in Looker Studio where the actual dashboard was created.
