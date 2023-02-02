{{ config (
    materialized="view"
)}}

with ACK_DATA as (

    select * from {{ ref('stg_ack')}}

),
ADV_DATA as (

    select * from {{ ref('stg_adv') }}
),
SHIIPING_DETAILS as (
select
        SHIPMENT_NUMBER,
        ITEM,
        VENDOR_NAME,
        TRANSFER_ORGANIZATION_NAME
        from "DBT_DB"."EDI_DEV"."ADJ_ADV_947"
),
PO_ACK AS
(
  SELECT ACKNOWLEDGEMENT_RESPONSE,
  SUPPLIER_ORDER_NUMBER AS SHIPMENT_NUMBER
  FROM DBT_DB.EDI_DEV.PO_ACK_855
         
)
 select  SD.SHIPMENT_NUMBER,
         SD.ITEM,
         SD.VENDOR_NAME,
         SN.SOLD_TO_LEGAL_ENTITY,
         SN.SHIPPED_DATE,
         SN.EXPECTED_RECEIPT_DATE,
         PO_ACK.ACKNOWLEDGEMENT_RESPONSE
         from SHIIPING_DETAILS SD
         JOIN  PO_ACK USING (SHIPMENT_NUMBER)
         left join DBT_DB.DBT_SCHEMA.SHIPPING_NOTICE_856 SN
  using (SHIPMENT_NUMBER)
  
  
  
  