--- Create a summary table
create table keepcoding.ivr_summary as

with aux as (
SELECT 
calls_ivr_id as ivr_id, 
calls_phone_number as phone_number, 
calls_ivr_result as ivr_result, 
case 
when starts_with(calls_vdn_label, 'ATC') then 'FRONT'
when starts_with(calls_vdn_label, 'TECH') then 'TECH'
when calls_vdn_label = 'ABSORPTION' then 'ABSORPTION'
else 'RESTO' end as vdn_aggregation,
calls_start_date as start_date, 
calls_end_date as end_date, 
calls_total_duration as total_duration, 
calls_customer_segment as customer_segment, 
calls_ivr_language as ivr_language, 
calls_steps_module as steps_module,
calls_module_aggregation as module_aggregation,
max(case when document_type != 'UNKNOWN' then document_type else null end) over (partition by cast(calls_ivr_id as string)) as document_type,
max(case when document_identification != 'UNKNOWN' then document_identification else null end) over (partition by cast(calls_ivr_id as string)) as document_identification,
max(case when customer_phone is not null then customer_phone else null end) over (partition by cast(calls_ivr_id as string)) AS customer_phone,
max(case when billing_account_id != 'UNKNOWN' then billing_account_id else null end) over (partition by cast(calls_ivr_id as string)) AS billing_account_id,
max(case when module_name = 'AVERIA_MASIVA' then 1 else 0 end) over (partition by cast(calls_ivr_id as string)) as masiva_lg,
max(case when step_name = 'CUSTOMERINFOBYPHONE.TX' and step_result = "OK" then 1 else 0 end) over (partition by cast(calls_ivr_id as string)) as info_by_phone_lg,
max(case when step_name = 'CUSTOMERINFOBYDNI.TX' and step_result = "OK" then 1 else 0 end) over (partition by cast(calls_ivr_id as string)) as info_by_dni_lg,
lag(calls_start_date) over(partition by calls_phone_number order by calls_start_date ASC) as previous_calls_start_date,
lead(calls_start_date) over(partition by calls_phone_number order by calls_start_date ASC) as next_calls_start_date,
FROM keepcoding.ivr_detail
)

select
* except(previous_calls_start_date,next_calls_start_date),
max(case when timestamp_diff(start_date, previous_calls_start_date, HOUR)  <= 24 and start_date != previous_calls_start_date then 1 else 0 end) as repeated_phone_24H,
max(case when timestamp_diff(start_date, next_calls_start_date, HOUR)  <= 24 and start_date != next_calls_start_date then 1 else 0 end) as cause_recall_phone_24H
from aux
group by all
order by 1, start_date, steps_module asc
