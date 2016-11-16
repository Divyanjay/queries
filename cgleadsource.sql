﻿select regexp_replace(first_name ||' '|| coalesce(last_name,''),'[^a-zA-Z0-9]+', '','g') as name, 
(case when source = '1' then 'Manual'
when source = '2' then 'Referral'
when source = '3' then 'Newspaper'
when source = '4' then 'Website'
when source = '5' then 'App'
when source = '6' then 'Walk-In'
when source = '7' then 'Supply_Call'
when source = '8' then 'Pamphlet'
when source = '9' then 'Quickr'
when source = '10' then 'JustDial'
when source = '11' then 'Baba-Jobs'
when source = '12' then 'HospitalSource'
else null end) as source
,(case 
when service = 'N' then 'Nurse Sister+Brother'
 when service = 'A' then 'Attendant Aaya+Wardboy'
when service = 'P' then 'Physiotherapist'
when service = 'Nu' then 'Nutritionist'
when service = 'Eq' then 'Equipment'
when service = 'Ic' then 'InfantCare'
when service = 'St' then 'Speech Therapy'
when service = 'Ot' then 'Occupational Therapy'
when service = 'Cp' then 'Clinical Psychology'
when service = 'On' then 'Onco Nurse'
when service = 'Cc' then 'Cancer Coach'
when service = 'Pc' then 'Pregnancy Care'
when service = 'Ph' then 'Pharmacy'
when service = 'Cm' then 'Consumables'
when service = 'D' then 'Diagnostics'
when service = 'Py' then 'Physician' 
else null end) as service,
phone,
(case when status = '1' then 'Pending'
when status = '2' then 'Screening Rejected'
when status = '3' then 'Registration'
when status = '4' then 'Interview Scheduled'
when status = '5' then 'Interview Rejected'
when status = '6' then 'Interview Absent'
when status = '7' then 'Closed for Interview'
when status = '8' then 'No Contact'
when status = '9' then 'Others'
else null end) as status
,date(created+interval'5:30') as date
 from "TrainingAndOnboarding_cglead"