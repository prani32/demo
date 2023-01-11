{{ config (
    materialized="incremental"
)}}
with incr_data as
(
select * from DBT_DB.DBT_SCHEMA.SHIPPING_NOTICE_856
)

select * from incr_data