{{ config (
        materialized='incremental',
        unique_key='id',
        incremental_strategy='merge'

)}}

WITH
using_clause AS (

    select * from RECEIPT_ADVICE_944 

),

updates AS (

    SELECT
        *

    FROM using_clause

),

inserts AS (

    SELECT
        *
    FROM using_clause

)

SELECT *

FROM updates

UNION inserts
