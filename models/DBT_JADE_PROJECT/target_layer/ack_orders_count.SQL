{{ config (
    tag="p1"
)}}
select
    SOLD_TO_LE_NAME,
    {{ACK_COUNT('ACKNOWLEDGEMENT_NOTE')}} ack_orders_count,
    count(*) Total_Order_Count
from {{ ref('stg_ack') }}
group by SOLD_TO_LE_NAME
order by SOLD_TO_LE_NAME


