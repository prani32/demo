{{ config (
        materialized='incremental',
        unique_key='ride_id',
        incremental_strategy='merge'

)}}
MERGE INTO target_table
using(select * from RECEIPT_ADVICE_944 AS s
on target_table.SHIPMENT_NUMBER=s.SHIPMENT_NUMBER
when matched then update 
set set target_table.ORGANIZATION_NAME=s.ORGANIZATION_NAME,
    target_table.TRANSFER_ORGANIZATION_NAME=s.TRANSFER_ORGANIZATION_NAME,
    target_table.TRANSACTION_QUANTITY=s.TRANSACTION_QUANTITY,
    target_table.TRANSACTION_UNIT_OF_MEASURE=s.TRANSACTION_UNIT_OF_MEASURE,
    target_table.ITEM=s.ITEM,
    target_table.SUB_INVENTORY=s.SUB_INVENTORY,
    target_table.TRANSFER_SUB_INVENTORY=s.TRANSFER_SUB_INVENTORY,
    target_table.TRANSACTION_DATE=s.TRANSACTION_DATE
    when not matched then insert(SHIPMENT_NUMBER,ORGANIZATION_NAME,TRANSFER_ORGANIZATION_NAME,TRANSACTION_QUANTITY,
                              TRANSACTION_UNIT_OF_MEASURE,ITEM,SUB_INVENTORY,TRANSFER_SUB_INVENTORY,TRANSACTION_DATE)
                              values(s.SHIPMENT_NUMBER,s.ORGANIZATION_NAME,s.TRANSFER_ORGANIZATION_NAME,s.TRANSACTION_QUANTITY,
                              s.TRANSACTION_UNIT_OF_MEASURE,s.ITEM,s.SUB_INVENTORY,s.TRANSFER_SUB_INVENTORY,s.TRANSACTION_DATE);
)