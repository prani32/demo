{{ config (
    materialized="view"
)}}
select max(EXPECTED_RECEIPT_DATE) from {{ref('stg_receipt')}}