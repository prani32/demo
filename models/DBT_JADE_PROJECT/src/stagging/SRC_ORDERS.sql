

with source_data AS
(
select * from {{ source('SHIPPING_DATA', 'SRC_ORDERS') }}
)

select * from source_data

