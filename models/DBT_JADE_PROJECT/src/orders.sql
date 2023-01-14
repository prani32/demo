with source_data AS
(
select * from {{ source('shipping_data', 'orders') }}
)

select * from source_data

