with ADV as (
select
        SHIPMENT_NUMBER,
        ITEM,
        VENDOR_NAME,
        TRANSFER_ORGANIZATION_NAME
        from "DBT_DB"."DBT_SCHEMA"."ADJ_ADV_947"
)