WITH ADV as
(
select * from {{ source('shipping_data', 'ADJ_ADV_947') }}
),
stagged as
(
select
        SHIPMENT_NUMBER,
        ITEM,
        VENDOR_NAME,
        TRANSFER_ORGANIZATION_NAME
        from ADV

)
select * from stagged
