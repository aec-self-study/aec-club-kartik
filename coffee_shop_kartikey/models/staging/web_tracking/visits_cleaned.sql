WITH

    pageviews AS (
        SELECT * FROM {{ source('web_tracking', 'pageviews') }}
    ),

    visitors AS (
        SELECT * FROM {{ ref('visitors') }}
    ),

    joined AS (
        SELECT 
            pageviews.*,
            COALESCE(visitors.first_customer_id, pageviews.visitor_id) AS blended_user_id,
            visitors.first_visitor_id
        FROM pageviews
            LEFT JOIN visitors ON pageviews.visitor_id = visitors.visitor_id
    )

SELECT * FROM joined