--- Create fields repeated_phone_24H and cause_recall_phone_24H that evaluates as 1/0 if for each calls_phone_number there was a call in the previous and next 24h

with aux as (
select
distinct calls_ivr_id, calls_phone_number,calls_start_date,
lag(calls_start_date) over(partition by calls_phone_number order by calls_start_date ASC) as previous_calls_start_date,
lead(calls_start_date) over(partition by calls_phone_number order by calls_start_date ASC) as next_calls_start_date,
from keepcoding.ivr_detail)

select
distinct calls_ivr_id,calls_phone_number,
max(case when timestamp_diff(calls_start_date, previous_calls_start_date, HOUR)  <= 24 and calls_start_date != previous_calls_start_date then 1 else 0 end) as repeated_phone_24H,
max(case when timestamp_diff(calls_start_date, next_calls_start_date, HOUR)  <= 24 and calls_start_date != next_calls_start_date then 1 else 0 end) as cause_recall_phone_24H
from aux
group by all
order by 1,2

