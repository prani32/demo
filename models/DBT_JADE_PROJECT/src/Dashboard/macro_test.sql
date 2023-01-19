{{ config (
    materialized="table"
)}}
(
select 
  C_CUSTKEY,
  C_MKTSEGMENT,
  {{rename_segments('C_MKTSEGMENT')}} mkt_segment_adjusted
from {{ source('shipping_data', 'customers') }}
)
