{{ config (
    materialized="incremental"
)}}
with incr_data as
(
select * from {{ref('stg_customerdata')}}
{% if is_incremental() %}
-- this filter will only be applied on an incremental run
  where SHIPPED_DATE >= (select max(SHIPPED_DATE) from {{ this }})
{% endif %}
)
select * from incr_data



