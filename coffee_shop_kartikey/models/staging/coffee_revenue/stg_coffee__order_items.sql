WITH 

    source AS (
        SELECT * FROM {{ source('coffee_shop', 'order_items') }}
    ),

    renamed AS (
        SELECT
            id AS order_line_id,
            order_id,
            product_id
        FROM source
    )

SELECT * FROM renamed