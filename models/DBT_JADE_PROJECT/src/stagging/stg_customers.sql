with source_data AS
(
select * from {{ source('shipping_data', 'RAW_CUSTOMERS') }}
)

select * from source_data