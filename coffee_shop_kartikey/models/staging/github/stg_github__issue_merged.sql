WITH source AS (
    SELECT * FROM {{ source('github', 'issue_merged') }}
),

renamed AS (
    SELECT
        issue_id,
        actor_id AS merge_user_id,
        
        commit_sha,
        
        -- timestamps
        merged_at
                
        -- excluded columns
        -- _fivetran_synced,
    FROM source
)

SELECT * FROM renamed