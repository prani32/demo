

with source_data AS
(
select * from {{ source('shipping_data', 'SRC_ORDERS') }}
)

select * from source_data

