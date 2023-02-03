WITH src_hosts AS (
 SELECT
 *
 FROM
 {{ ref('src_hosts') }}
)
SELECT
 host_id,
 created_at,
 is_superhost,
 updated_at,
 host_name
FROM
 src_hosts
