with raw_hosts as(
    select * from "DBT_DB"."EDI_DEV"."RAW_HOSTS"
)
select 
id as host_id,
name as host_name
from 
    raw_hosts