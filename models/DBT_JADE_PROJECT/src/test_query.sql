{{ config (
    materialized="view"
)}}
select max(SHIPPED_DATE) from {{ref('stg_receipt')}}