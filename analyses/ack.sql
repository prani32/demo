WITH ack_reviews AS (
 SELECT * FROM {{ ref('stg_ack') }}
)
SELECT
 ORDER_NUMBER,
 SUPPLIER_ORDER_NUMBER,
 COUNT(*) as ack
FROM
ack_reviews
GROUP BY
 RESPONSE
ORDER BY
 SOLD_TO_LE_NAME
