--- Get the last not unknown value of the billing_account_id for each calls_ivr_id
select 
distinct calls_ivr_id, 
max(case when billing_account_id != 'UNKNOWN' then billing_account_id else null end) over (partition by cast(calls_ivr_id as string)) AS billing_account_id,
from keepcoding.ivr_detail
