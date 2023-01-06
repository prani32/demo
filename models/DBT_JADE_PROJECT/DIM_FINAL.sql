{{ config (
    materialized="table"
)}}

with SHIIPING_DETAILS as (
select * from {{ ref('STG_ACK') }}
),
PO_ACK AS
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
         from ADJ_ADV  AA
         JOIN  ACK USING (SHIPMENT_NUMBER)
         left join DBT_DB.DBT_SCHEMA.SHIPPING_NOTICE_856 SN
  using (SHIPMENT_NUMBER)