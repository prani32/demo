WITH src_hosts AS (
 SELECT
 *
 FROM
 {{ ref('src_hosts') }}
)
SELECT
 host_id,
 NVL(
 host_name,
 'Anonymous') host_name,
 created_at,
  is_superhost,
 updated_at
FROM
 src_hosts