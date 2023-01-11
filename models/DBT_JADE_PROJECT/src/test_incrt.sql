{{ config (
    materialized="incremental"
)}}
with incr_data as
(
select * from {{ref('stg_receipt')}}
)

select * from incr_data