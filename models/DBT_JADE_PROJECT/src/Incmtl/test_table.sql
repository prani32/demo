{{ config (
    materialized="table"
)}}

select * from DBT_DB.EDI_DEV.SHIPPING_NOTICE_856