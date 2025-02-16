--- Create a field masiva_lg that evaluates as 1/0 if the call passed through the module_name "AVERIA_MASIVA"
select 
distinct calls_ivr_id, 
max(case when module_name = 'AVERIA_MASIVA' then 1 else 0 end) over (partition by cast(calls_ivr_id as string)) as masiva_lg
from keepcoding.ivr_detail
