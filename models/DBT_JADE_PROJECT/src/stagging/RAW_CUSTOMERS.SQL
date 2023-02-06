
with source_data AS
(
select * from {{ source('SHIPPING_DATA', 'RAW_CUSTOMERS') }}
)

select * from source_data