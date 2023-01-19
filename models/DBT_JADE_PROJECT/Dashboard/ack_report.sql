{{ config (
    materialized="table"
)}}

WITH ack_reviews AS (
 SELECT * FROM {{ ref('stg_ack') }}
)
select
    SOLD_TO_LE_NAME,
    sum(case when ACKNOWLEDGEMENT_NOTE = 'RE'   then 1 else 0 end) Reject,
    sum(case when ACKNOWLEDGEMENT_NOTE= 'AC' then 1 else 0 end) Accept,
    count(*) Total_Order_Count
from  DBT_DB.DBT_SCHEMA.PO_ACK_855
group by SOLD_TO_LE_NAME
order by SOLD_TO_LE_NAME