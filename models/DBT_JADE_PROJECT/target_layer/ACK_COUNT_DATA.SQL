{{ config (
    materialized="table"
)}}
select
    SOLD_TO_LE_NAME,
    {{ACK_COUNT('ACKNOWLEDGEMENT_NOTE')}},
    count(*) Total_Order_Count
from {{ ref('stg_ack') }}
group by SOLD_TO_LE_NAME
order by SOLD_TO_LE_NAME


