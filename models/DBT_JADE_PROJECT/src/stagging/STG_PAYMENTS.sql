{{ config (
    tags=["s2"]
)}}

with source_data AS
(
select * from {{ source('SHIPPING_DATA', 'RAW_PAYMENTS') }}
)

select * from source_data

