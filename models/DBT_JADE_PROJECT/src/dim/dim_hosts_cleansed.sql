{{ config (
    materialized="table"
)}}

WITH src_hosts AS (
 SELECT
 *
 FROM
 {{ ref('SRC_HOSTS') }}
)
SELECT
 host_id,
  NVL(
 host_name,
 'Anonymous'
 ) AS host_name,
 created_at,
 is_superhost,
 updated_at
FROM
 src_hosts
