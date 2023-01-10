with source_data AS
(
select * from {{ source('shipping_data', 'PO_ACK_855') }}
)

select * from source_data