{{ config (
    materialized="table"
)}}
(
select
    SOLD_TO_LE_NAME,
    count(*) Total_Order_Count,
    {{ACK_COUNT('ACKNOWLEDGEMENT_NOTE')}} ACK_ORDERS_COUNT
from  {{ source('shipping_data', 'PO_ACK_855') }}
group by SOLD_TO_LE_NAME
order by SOLD_TO_LE_NAME
)
