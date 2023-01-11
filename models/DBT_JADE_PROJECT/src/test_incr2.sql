{{
    config(
        materialized='incremental',
        unique_key='date_day'
    )
}}
with incr_data1 as
(
select * from {{ref('stg_receipt')}}
{% if is_incremental() %}
-- this filter will only be applied on an incremental run
  where EXPECTED_RECEIPT_DATE >= (select max(EXPECTED_RECEIPT_DATE) from {{ this }})
{% endif %}
group by 1
