
with source_data AS
(
select * from {{ source('shipping_data', 'RECEIPT_ADVICE_944') }}
)

select * from source_data
