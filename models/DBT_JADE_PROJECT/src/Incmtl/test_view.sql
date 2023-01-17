{{ config (
    materialized="view"
)}}

select * from DBT_DB.DBT_SCHEMA.SHIPPING_NOTICE_856