{{ config (
    materialized="incremental"
)}}

with incr_data as (

    select * from RECEIPT_ADVICE_944
)

select * from incr_data