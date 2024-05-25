WITH

    pull_requests AS (
        SELECT * FROM {{ ref('stg_github__pull_requests') }}
    ),

    repositories AS (
        SELECT * FROM {{ ref('stg_github__repositories') }}
    ),

    issues AS (
        SELECT * FROM {{ ref('stg_github__issues') }}
    ),

    issue_merged AS (
        SELECT * FROM {{ ref('stg_github__issue_merged') }}
    ),

    final AS (

        SELECT 
            pull_requests.pull_request_id,
            repositories.name AS repo_name,
            issues.number AS pull_request_number,

            -- Find out how to label these pull requests
            CAST(NULL AS string) AS type, -- (bug, eng, feature)
            
            CASE
                WHEN pull_requests.is_draft THEN 'draft'
                WHEN issue_merged.merged_at IS NOT NULL THEN 'merged'
                WHEN issues.closed_at IS NOT NULL THEN 'closed without merge'
                ELSE 'open'
            END AS state, -- (open, draft, closed_with)

            issues.created_at AS opened_at,
            issue_merged.merged_at AS merged_at,
            DATE_DIFF(issue_merged.merged_at, issues.created_at, hour) / 24.0 AS days_open_to_merged

        FROM pull_requests

        LEFT JOIN repositories 
            ON pull_requests.pull_request_id = repositories.repository_id

        LEFT JOIN issues
            ON pull_requests.issue_id = issues.issue_id

        LEFT JOIN issue_merged
            ON pull_requests.issue_id = issue_merged.issue_id
    )

SELECT * FROM final