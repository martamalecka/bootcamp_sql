--- Create a field info_by_dni_lg that evaluates as 1/0 if the call passed through the step "CUSTOMERINFOBYDNI.TX " and the results was "OK"
select
distinct calls_ivr_id, 
max(case when step_name = 'CUSTOMERINFOBYDNI.TX' and step_result = "OK" then 1 else 0 end) over (partition by cast(calls_ivr_id as string)) as info_by_dni_lg
from keepcoding.ivr_detail;
