{{ config(
    full_refresh = true
) }}
select * from {{ref('stg_customerdata')}}