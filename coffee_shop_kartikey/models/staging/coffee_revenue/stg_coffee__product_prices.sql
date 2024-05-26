WITH 

    source AS (
        SELECT * FROM {{ source('coffee_shop', 'product_prices') }}
    ),

    renamed AS (
        SELECT
            id AS row_id,
            product_id,
            price AS product_price,
            created_at AS product_price_created_at,
            ended_at AS product_price_ended_at
        FROM source
    )

SELECT * FROM renamed