{{ config(
    full_refresh = true
) }}
select * from {{ref('RAW_CUSTOMERS')}}