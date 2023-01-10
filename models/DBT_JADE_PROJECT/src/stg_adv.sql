with source_data AS
select * from {{ source('shipping_data', 'ADJ_ADV_947') }}
),
ack_data as
(
select
        SHIPMENT_NUMBER,
        ITEM,
        VENDOR_NAME,
        TRANSFER_ORGANIZATION_NAME
        from "DBT_DB"."DBT_SCHEMA"."ADJ_ADV_947"
)

select * from source_data