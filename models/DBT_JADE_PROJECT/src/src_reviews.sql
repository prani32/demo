with RAW_REVIEWS as (
    select * from DBT_DB.EDI_DEV.RAW_REVIEWS
)
select 
  listing_id,
  date as review_date,
  reviewer_name,
  comments as review_text,
  sentiment as review_sentiment
  from raw_reviews