with source_data AS
(
select * from {{ source('shipping_data', 'customer_data') }}
)

select * from source_data

