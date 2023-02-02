{{ config (
    materialized="view"
)}}

select * from DBT_DB.EDI_DEV.SHIPPING_NOTICE_856