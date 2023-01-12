{{ config(
    materialized='incremental',
    unique_key='SHIPMENT_NUMBER',
    incremental_strategy='merge'
)}}

merge into target_table t
using(select * from {{ref('stg_customerdata')}}) s
on t.SHIPMENT_NUMBER=s.SHIPMENT_NUMBER
when matched then update 
set t.ORGANIZATION_NAME=s.ORGANIZATION_NAME,
    t.TRANSFER_ORGANIZATION_NAME=s.TRANSFER_ORGANIZATION_NAME,
    t.TRANSACTION_QUANTITY=s.TRANSACTION_QUANTITY,
    t.TRANSACTION_UNIT_OF_MEASURE=s.TRANSACTION_UNIT_OF_MEASURE,
    t.ITEM=s.ITEM,
    t.SUB_INVENTORY=s.SUB_INVENTORY,
    t.TRANSFER_SUB_INVENTORY=s.TRANSFER_SUB_INVENTORY,
    t.TRANSACTION_DATE=s.TRANSACTION_DATE
    
  when not matched then insert(t.SHIPMENT_NUMBER,t.ORGANIZATION_NAME,t.TRANSFER_ORGANIZATION_NAME,t.TRANSACTION_QUANTITY,
                              t.TRANSACTION_UNIT_OF_MEASURE,t.ITEM,t.SUB_INVENTORY,t.TRANSFER_SUB_INVENTORY,t.TRANSACTION_DATE)
                              values(s.SHIPMENT_NUMBER,
                              s.ORGANIZATION_NAME,
                              s.TRANSFER_ORGANIZATION_NAME,
                              s.TRANSACTION_QUANTITY,
                              s.TRANSACTION_UNIT_OF_MEASURE,
                              s.ITEM,s.SUB_INVENTORY,
                              s.TRANSFER_SUB_INVENTORY,
                              s.TRANSACTION_DATE);