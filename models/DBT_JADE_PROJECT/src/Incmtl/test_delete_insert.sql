
{{config(
    materialized='incremental'
    , incremental_strategy='delete+insert'
    , unique_key=''
)}}
with incr_data as
(
select * from {{ref('STG_CUSTOMERDATA')}}
{% if is_incremental() %}
-- this filter will only be applied on an incremental run
  where SHIPPED_DATE >= (select max(SHIPPED_DATE) from {{ this }})
{% endif %}
)
select * from incr_data

