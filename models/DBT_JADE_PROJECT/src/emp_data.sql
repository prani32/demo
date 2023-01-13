with emp_data as
(
select * from {{ source('emp_data', 'emp') }}
)