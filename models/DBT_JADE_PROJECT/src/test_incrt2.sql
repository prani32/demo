{{
    config(
        materialized='incremental',
        unique_key='SHIPMENT_NUMBER'
    )
}}
select * from {{ref('stg_receipt')}}
{% if is_incremental() %}
-- this filter will only be applied on an incremental run
  where SHIPPED_DATE >= (select max(SHIPPED_DATE) from {{ this }})
{% endif %}

group by 1