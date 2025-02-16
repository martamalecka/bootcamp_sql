--- Get the last non unknown value of the fields document_type and document_identification for each calls_ivr_id
select 
distinct calls_ivr_id, 
max(case when document_type != 'UNKNOWN' then document_type else null end) over (partition by cast(calls_ivr_id as string)) as document_type,
max(case when document_identification != 'UNKNOWN' then document_identification else null end) over (partition by cast(calls_ivr_id as string)) as document_identification
from keepcoding.ivr_detail
order by calls_ivr_id asc
