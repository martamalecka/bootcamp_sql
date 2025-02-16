{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red167\green0\blue95;\red255\green255\blue255;\red24\green25\blue27;
\red22\green79\blue199;\red0\green0\blue0;\red46\green49\blue51;\red24\green112\blue43;}
{\*\expandedcolortbl;;\cssrgb\c72157\c2353\c44706;\cssrgb\c100000\c100000\c100000;\cssrgb\c12549\c12941\c14118;
\cssrgb\c9804\c40392\c82353;\cssrgb\c0\c0\c0;\cssrgb\c23529\c25098\c26275;\cssrgb\c9412\c50196\c21961;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 --- Create the table with the indicated fields\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 create\cf4 \strokec4  \cf5 \strokec5 table\cf4 \strokec4  \strokec6 keepcoding.ivr_detail\strokec4  \cf5 \strokec5 as\cf4 \cb1 \strokec4 \
\
\cf5 \cb3 \strokec5 select\cf4 \strokec4  \cb1 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3  \strokec6 cal.ivr_id\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_ivr_id\strokec4 ,\cb1 \
\cb3  \strokec6 cal.phone_number\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_phone_number\strokec4 ,\cb1 \
\cb3  \strokec6 cal.ivr_result\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_ivr_result\strokec4 ,\cb1 \
\cb3  \strokec6 cal.vdn_label\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_vdn_label\strokec4 ,\cb1 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec6 cal.start_date\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_start_date\strokec4 ,\cb1 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 format_timestamp\cf7 \strokec7 (\cf8 \strokec8 '%Y%m%d'\cf4 \strokec4 , \strokec6 cal.start_date\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_start_date_id\strokec4 ,\cb1 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec6 cal.end_date\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_end_date\strokec4 ,\cb1 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 format_timestamp\cf7 \strokec7 (\cf8 \strokec8 '%Y%m%d'\cf4 \strokec4 , \strokec6 cal.end_date\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_end_date_id\strokec4 ,\cb1 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec6 cal.total_duration\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_total_duration\strokec4 ,\cb1 \
\cb3 \strokec6 cal.customer_segment\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_customer_segment\strokec4 , \cb1 \
\cb3 \strokec6 cal.ivr_language\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_ivr_language\strokec4 , \cb1 \
\cb3 \strokec6 cal.steps_module\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_steps_module\strokec4 ,\cb1 \
\cb3 \strokec6 cal.module_aggregation\strokec4  \cf5 \strokec5 as\cf4 \strokec4  \strokec6 calls_module_aggregation\strokec4 ,\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 ----\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec6 mdl.module_sequece\strokec4 ,\cb1 \
\cb3 \strokec6 mdl.module_name\strokec4 ,\cb1 \
\cb3 \strokec6 mdl.module_duration\strokec4 ,\cb1 \
\cb3 \strokec6 mdl.module_result\strokec4 ,\cb1 \
\cb3 \strokec6 ste.step_sequence\strokec4 ,\cb1 \
\cb3 \strokec6 ste.step_name\strokec4 ,\cb1 \
\cb3 \strokec6 ste.step_result\strokec4 ,\cb1 \
\cb3 \strokec6 ste.step_description_error\strokec4 ,\cb1 \
\cb3 \strokec6 ste.document_type\strokec4 ,\cb1 \
\cb3 \strokec6 ste.document_identification\strokec4 ,\cb1 \
\cb3 \strokec6 ste.customer_phone\strokec4 ,\cb1 \
\cb3 \strokec6 ste.billing_account_id\cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 -----\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 from\cf4 \strokec4  \strokec6 keepcoding.ivr_calls\strokec4  \strokec6 cal\cb1 \strokec4 \
\cf5 \cb3 \strokec5 left\cf4 \strokec4  \cf5 \strokec5 join\cf4 \strokec4  \strokec6 keepcoding.ivr_modules\strokec4  \strokec6 mdl\cb1 \strokec4 \
\cf5 \cb3 \strokec5 on\cf4 \strokec4  \strokec6 cal.ivr_id\strokec4  = \strokec6 mdl.ivr_id\cb1 \strokec4 \
\cf5 \cb3 \strokec5 left\cf4 \strokec4  \cf5 \strokec5 join\cf4 \strokec4  \strokec6 keepcoding.ivr_steps\strokec4  \strokec6 ste\cb1 \strokec4 \
\cf5 \cb3 \strokec5 on\cf4 \strokec4  \strokec6 mdl.ivr_id\strokec4  = \strokec6 ste.ivr_id\cb1 \strokec4 \
\cf5 \cb3 \strokec5 and\cf4 \strokec4  \strokec6 mdl.module_sequece\strokec4  = \strokec6 ste.module_sequece\cb1 \strokec4 \
}