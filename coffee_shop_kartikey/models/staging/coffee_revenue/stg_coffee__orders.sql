WITH 

    source AS (
        SELECT * FROM {{ source('coffee_shop', 'orders') }}
    ),

    renamed AS (
        SELECT
            id AS order_id,
            created_at AS order_created_at,
            customer_id,
            total AS order_total,
            state
        FROM source
    )

SELECT * FROM renamed