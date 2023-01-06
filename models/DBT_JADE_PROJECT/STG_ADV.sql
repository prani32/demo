{{ config (
    materialized="table"
)}}

with ADJ_ADV as (
select
        SHIPMENT_NUMBER,
        ITEM,
        VENDOR_NAME,
        TRANSFER_ORGANIZATION_NAME
        from "DBT_DB"."DBT_SCHEMA"."ADJ_ADV_947"
)

select * from ADJ_ADV