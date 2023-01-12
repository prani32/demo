{{ config(
    materialized='incremental',
    unique_key='SHIPMENT_NUMBER',
    incremental_strategy='merge'
)}}

with 
using_clause AS
(
    select 
    SHIPMENT_NUMBER,
    ORGANIZATION_NAME,
    TRANSFER_ORGANIZATION_NAME,
    TRANSACTION_QUANTITY,
    TRANSACTION_UNIT_OF_MEASURE,
    ITEM,
    SUB_INVENTORY,
    TRANSFER_SUB_INVENTORY,
    max(TRANSACTION_DATE) as TRANSACTION_DATE
    from {{ref('stg_customerdata')}}

    {% if is_incremental() %}
-- this filter will only be applied on an incremental run
  where TRANSACTION_DATE >= (select max(TRANSACTION_DATE) from {{ this }})
{% endif %}
),

updates AS
(select 
 SHIPMENT_NUMBER,
    ORGANIZATION_NAME,
    TRANSFER_ORGANIZATION_NAME,
    TRANSACTION_QUANTITY,
    TRANSACTION_UNIT_OF_MEASURE,
    ITEM,
    SUB_INVENTORY,
    TRANSFER_SUB_INVENTORY,
    TRANSACTION_DATE from using_clause 
    {% if is_incremental() %}
-- this filter will only be applied on an incremental run
  where SHIPMENT_NUMBER in (select SHIPMENT_NUMBER from {{ this }})
{% endif %}
),
    insert as 
    (
        select 
 SHIPMENT_NUMBER,
    ORGANIZATION_NAME,
    TRANSFER_ORGANIZATION_NAME,
    TRANSACTION_QUANTITY,
    TRANSACTION_UNIT_OF_MEASURE,
    ITEM,
    SUB_INVENTORY,
    TRANSFER_SUB_INVENTORY,
    TRANSACTION_DATE from using_clause 
    where SHIPMENT_NUMBER not in (select SHIPMENT_NUMBER from updates)
    )

    select from updates 
    union insert