{{config(
    materialized = 'table'
) }}

WITH
    orders AS (
                  SELECT
                      customer_id,
                      SUM(total) AS total_sales,
                      COUNT(id) AS total_orders,
                      MIN(created_at) AS first_order_date
                  FROM analytics-engineers-club.coffee_shop.orders
                  GROUP BY 1
    )


SELECT 
    c.id,
    c.name,
    c.email,
    o.total_orders,
    o.total_sales,
    o.first_order_date
FROM analytics-engineers-club.coffee_shop.customers c
    JOIN orders o ON c.id = o.customer_id
ORDER BY o.first_order_date