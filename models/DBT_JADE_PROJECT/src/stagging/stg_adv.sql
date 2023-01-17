with source_data AS
(
select * from {{ source('shipping_data', 'ADJ_ADV_947') }}
)

select * from source_data