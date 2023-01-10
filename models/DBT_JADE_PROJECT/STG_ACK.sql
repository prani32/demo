WITH ACK as
(
select * from {{ source('shipping_data', 'PO_ACK_855') }}
),
staged as 
(
SELECT ACKNOWLEDGEMENT_RESPONSE,
  SUPPLIER_ORDER_NUMBER AS SHIPMENT_NUMBER
  FROM ACK
)

select * from staged
