with source_data AS
(
select * from {{ source('SHIPPING_DATA', 'ADJ_ADV_947') }}
)

select * from source_data