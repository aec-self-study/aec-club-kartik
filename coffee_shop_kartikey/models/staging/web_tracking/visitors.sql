WITH

    visitors AS (
        SELECT DISTINCT
            visitor_id,
            FIRST_VALUE(customer_id IGNORE NULLS) OVER(PARTITION BY visitor_id ORDER BY timestamp) AS first_customer_id,
            MIN(timestamp) OVER(PARTITION BY visitor_id) AS first_seen_at,
            MAX(timestamp) OVER(PARTITION BY visitor_id) AS last_seen_at
        
        FROM {{ source('web_tracking', 'pageviews') }}
    )

SELECT 
    *, 
    FIRST_VALUE(visitor_id) OVER(PARTITION BY COALESCE(first_customer_id, visitor_id) ORDER BY first_seen_at) AS first_visitor_id
FROM visitors