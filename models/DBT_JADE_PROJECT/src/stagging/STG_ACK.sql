with source_data AS
(
select * from {{ source('SHIPPING_DATA', 'PO_ACK_855') }}
)

select * from source_data