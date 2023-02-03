with raw_hosts as(
    select * from "DBT_DB"."EDI_DEV"."RAW_HOSTS"
)
select 
id as host_id,
name as host_name,
 created_at,
 is_superhost,
 updated_at
from 
    raw_hosts