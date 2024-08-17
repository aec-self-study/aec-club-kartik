{% set product_categories = ['coffee beans', 'merch', 'brewing supplies'] %}

SELECT
    DATE_TRUNC(order_created_at, month) as date_month,
    {% for product_category in product_categories %}
    SUM(CASE WHEN product_category = '{{product_category}}' THEN product_revenue END) AS {{product_category | replace(" ","_")}}_amount,
    {% endfor %}
    COUNT(product_name) AS total_items_sold
FROM {{ ref('weekly_rev_by_product') }}
GROUP BY 1