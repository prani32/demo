with ACK AS
(
  SELECT ACKNOWLEDGEMENT_RESPONSE,
  SUPPLIER_ORDER_NUMBER AS SHIPMENT_NUMBER
  FROM DBT_DB.DBT_SCHEMA.PO_ACK_855
)

select * from ACK