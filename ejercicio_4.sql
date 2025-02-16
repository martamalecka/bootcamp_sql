--- Classify the calls_vdn_label values per 4 categories
select 
*,
case 
when starts_with(calls_vdn_label, 'ATC') then 'FRONT'
when starts_with(calls_vdn_label, 'TECH') then 'TECH'
when calls_vdn_label = 'ABSORPTION' then 'ABSORPTION'
else 'RESTO' end as vdn_aggregation,
from keepcoding.ivr_detail
