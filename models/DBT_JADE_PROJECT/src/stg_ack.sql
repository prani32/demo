with source_data AS
select * from {{ source('shipping_data', 'PO_ACK_855') }}
),
ack_data as
(
  SELECT ACKNOWLEDGEMENT_RESPONSE,
  SUPPLIER_ORDER_NUMBER AS SHIPMENT_NUMBER
  FROM DBT_DB.DBT_SCHEMA.PO_ACK_855
)

select * from source_data