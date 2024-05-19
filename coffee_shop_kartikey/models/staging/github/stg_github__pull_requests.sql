WITH source AS (
    SELECT * FROM {{ source('github', 'pull_request') }}
),

renamed AS (
    SELECT
        id AS pull_request_id,
        base_label,
        base_ref,
        base_repo_id,
        base_sha,
        base_user_id,
        draft AS is_draft,
        head_label,
        head_ref,
        head_repo_id,
        head_sha,
        head_user_id,
        issue_id,
        merge_commit_sha

        -- excluded columns
        -- _fivetran_synced
        

    FROM source
)

SELECT * FROM renamed