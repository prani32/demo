{{ config (
    materialized="table"
)}}

with ACK_DETAILS as (
select * from {{ ref('STG_ACK')}}
),
ADV_DETAILS AS
(
 select * from {{ ref('STG_ADV') }}
)
  select AA.SHIPMENT_NUMBER,
         AA.ITEM,
         AA.VENDOR_NAME,
         SN.SOLD_TO_LEGAL_ENTITY,
         SN.SHIPPED_DATE,
         SN.EXPECTED_RECEIPT_DATE,
         ACK.ACKNOWLEDGEMENT_RESPONSE
         from ADV_DETAILS  AA
         JOIN  ACK_DETAILS   ACK USING (SHIPMENT_NUMBER)
         left join DBT_DB.DBT_SCHEMA.SHIPPING_NOTICE_856 SN
  using (SHIPMENT_NUMBER)

