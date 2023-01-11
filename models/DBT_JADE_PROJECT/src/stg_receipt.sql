
with source_data AS
(
select * from {{ source('shipping_data', 'SHIPPING_NOTICE_856') }}
)

select * from source_data
