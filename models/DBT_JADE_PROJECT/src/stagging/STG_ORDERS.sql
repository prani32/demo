{{ config (
    tags=["s1"]
)}}

with source_data AS
(
select * from {{ source('SHIPPING_DATA', 'RAW_ORDERS') }}
)

select * from source_data