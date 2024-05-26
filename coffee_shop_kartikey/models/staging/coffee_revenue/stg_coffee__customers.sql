WITH 

    source AS (
        SELECT * FROM {{ source('coffee_shop', 'customers') }}
    ),

    renamed AS (
        SELECT
            id AS customer_id,
            name AS customer_name,
            email AS customer_email
        FROM source
    )

SELECT * FROM renamed