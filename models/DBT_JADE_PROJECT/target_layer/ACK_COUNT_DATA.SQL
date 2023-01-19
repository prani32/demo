{{ config (
    materialized="table"
)}}
(
select
    SOLD_TO_LE_NAME,
    count(*) Total_Order_Count,
    {{rename_segments('ACKNOWLEDGEMENT_NOTE')}} mkt_segment_adjusted
from  {{ source('shipping_data', 'PO_ACK_855') }}
group by SOLD_TO_LE_NAME
order by SOLD_TO_LE_NAME
)
