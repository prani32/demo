{{ config (
    materialized="incremental"
)}}
with incr_data as
(
select * from {{ref('stg_receipt')}}
{% if is_incremental()%}
where EXPECTED_RECEIPT_DATE>=(select MAX(EXPECTED_RECEIPT_DATE) from {{this}})
{%endif%}
)
select * from incr_data



