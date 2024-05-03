SELECT
    DATE_TRUNC(first_order_date, month) AS date_month,
    count(*) AS new_customers

FROM {{ ref('customers') }}

GROUP BY 1