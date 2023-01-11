{{
    config(
        materialized='incremental',
        unique_key='SHIPMENT_NUMBER'
    )
}}
select * from {{ref('stg_receipt')}}
{% if is_incremental() %}
-- this filter will only be applied on an incremental run
  where SHIPMENT_NUMBER >= (select max(SHIPMENT_NUMBER) from {{ this }})
{% endif %}
group by 1