{{ config(
    full_refresh = true
) }}
select * from {{ref('STG_CUSTOMERDATA')}}