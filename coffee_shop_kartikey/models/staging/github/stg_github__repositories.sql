WITH source AS (
    SELECT * FROM {{ source('github', 'repository') }}
),

renamed AS (
    SELECT
        id AS repository_id,
        owner_id AS owner_user_id,
        archived AS is_archived,
        default_branch,
        description,
        fork As is_fork,
        full_name,
        homepage,
        language,
        name,
        private AS is_private,
        stargazers_count,

        --timestamps
        created_at

        -- excluded columns
        -- _fivetran_synced

    FROM source
)

SELECT * FROM renamed