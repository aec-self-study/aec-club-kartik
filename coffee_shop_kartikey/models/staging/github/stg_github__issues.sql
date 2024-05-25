WITH source AS (
    SELECT * FROM {{ source('github', 'issue') }}
),

renamed AS (
    SELECT
        id AS issue_id,
        body,
        locked AS is_locked,
        milestone_id,
        number,
        pull_request AS is_pull_request,
        repository_id,
        state,
        title,
        user_id,
        
        --timestamps
        closed_at,
        created_at,
        updated_at

        --excluded columns
        -- _fivetran_synced

    FROM source
)

SELECT * FROM renamed