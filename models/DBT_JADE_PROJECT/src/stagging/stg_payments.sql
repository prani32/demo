with source_data AS
(
select * from {{ source('shipping_data', 'RAW_PAYMENTS') }}
)

select * from source_data