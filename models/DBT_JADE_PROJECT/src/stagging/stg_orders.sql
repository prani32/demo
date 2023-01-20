{{ config (
    tags=["s1"]
)}}

with source_data AS
(
select * from {{ source('shipping_data', 'RAW_ORDERS') }}
)

select * from source_data