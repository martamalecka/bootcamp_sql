--- Get the last not unknown value of the customer_phone for each calls_ivr_id
select 
distinct calls_ivr_id, 
max(case when customer_phone is not null then customer_phone else null end) over (partition by cast(calls_ivr_id as string)) AS customer_phone,
from keepcoding.ivr_detail
