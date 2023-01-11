{{ config (
    materialized="incremental:"
)}}
with incr_data as (

    select * from {{ ref('stg_ack')}}

)

select * from incr_data