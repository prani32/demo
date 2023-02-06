
with source_data AS
(
select * from {{ source('SHIPPING_DATA', 'SHIPPING_NOTICE_856') }}
)

select  * from source_data
