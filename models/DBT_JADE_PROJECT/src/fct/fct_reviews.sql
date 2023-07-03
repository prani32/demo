{{
 config(
 materialized = 'incremental',
 om_schema_change='fail'
 )
}}
WITH src_reviews AS (
 SELECT * FROM {{ ref('SRC_REVIEWS') }}
)
SELECT * FROM src_reviews
WHERE review_text is not null
{% if is_incremental() %}
 AND review_date > (select max(review_date) from {{ this }})
{% endif %}
