SELECT
    product_id,
    SUM(sales_value) AS total_sales_value

FROM {{ ref('product_value') }}

GROUP BY 1