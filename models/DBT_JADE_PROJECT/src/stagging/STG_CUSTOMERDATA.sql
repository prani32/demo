with source_data AS
(
select * from {{ source('SHIPPING_DATA', 'customer_data') }}
)

select * from source_data

