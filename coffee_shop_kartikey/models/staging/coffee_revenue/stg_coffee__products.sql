WITH 

    source AS (
        SELECT * FROM {{ source('coffee_shop', 'products') }}
    ),

    renamed AS (
        SELECT
            id AS product_id,
            name AS product_name,
            category AS product_category
        FROM source
    )

SELECT * FROM renamed