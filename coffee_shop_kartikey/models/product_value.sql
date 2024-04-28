{{ config(
    materialized = 'table'
) }}

WITH
    orders AS (
                  SELECT 
                        id,
                        total
                  FROM `analytics-engineers-club.coffee_shop.orders`

    )

SELECT 
      o.id AS order_id,
      oi.product_id,
      o.total AS sales_value

FROM `analytics-engineers-club.coffee_shop.order_items` oi
    JOIN orders o ON oi.order_id = o.id