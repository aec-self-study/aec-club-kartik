WITH

    orders AS (
        SELECT * FROM {{ ref('stg_coffee__orders') }}
    ),

    return_customers AS (
        SELECT
            customer_id,
            MIN(order_created_at) AS first_order_date        
        FROM orders
        GROUP BY 1 
    ),

    customers As (
        SELECT c.*, r.first_order_date 
        FROM {{ ref('stg_coffee__customers') }} AS c
            LEFT JOIN return_customers AS r
                ON c.customer_id = r.customer_id
    ),

    products AS (
        SELECT * FROM {{ ref('stg_coffee__products') }}
    ),

    order_items AS (
        SELECT * FROM {{ ref('stg_coffee__order_items') }}
    ),
    
    product_prices AS (
        SELECT * FROM {{ ref('stg_coffee__product_prices') }}
    )

    

SELECT
    orders.order_created_at,
    products.product_name,
    products.product_category,
    product_prices.product_price AS product_revenue,
    orders.state,
    customers.customer_id,
    customers.customer_name,
    customers.customer_email,
    CASE 
        WHEN orders.order_created_at > customers.first_order_date THEN 'return customer'
        WHEN orders.order_created_at = customers.first_order_date THEN 'new customer'
        ELSE 'unknown'
    END AS customer_type

FROM orders
    LEFT JOIN order_items ON orders.order_id = order_items.order_id
    LEFT JOIN products ON order_items.product_id = products.product_id
    LEFT JOIN product_prices 
        ON order_items.product_id = product_prices.product_id 
        AND orders.order_created_at BETWEEN product_prices.product_price_created_at AND product_prices.product_price_ended_at
    LEFT JOIN customers ON orders.customer_id = customers.customer_id

ORDER BY 1
    