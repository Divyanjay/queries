﻿SELECT date(a.created+interval'5:30')as Lead_date,
(case when a.service = '1' then 'Nursing'
when a.service = '2' then 'Physio'
when a.service = '3' then 'Attendant'
when a.service = '4' then 'InfantCare'
when a.service = '5' then 'Baby Sitter'
when a.service = '6' then 'Dietitian'
when a.service = '7' then 'Elderly Care'
when a.service = '8' then 'XSell Equip'
when a.service = '9' then 'XSell Doc'
when a.service = '10' then 'Care Package'
when a.service = '11' then 'Premium Care Package'
when a.service = '12' then 'Nutrition'
when a.service = '13' then 'Equipment'
when a.service = '14' then 'Mothers Package'
when a.service = '15' then 'New Mothers Package'
when a.service = '16' then 'Neuro Rehab'
when a.service = '17' then 'Speech Therapy'
when a.service = '18' then 'Occupational Therapy'
when a.service = '19' then 'Clinical Psychology'
when a.service = '20' then 'Pregnancy Care'
when a.service = '21' then 'Mother and Infant Care'
when a.service = '22' then 'Cancer Care'
when a.service = '23' then 'Onco Nurse'
when a.service = '24' then 'Cancer Coach'
when a.service = '25' then 'Pharmacy'
when a.service = '26' then 'Diagnostics'
when a.service = '27' then 'XSELL DOC1'
when a.service = '28' then 'XSELL DOC2'
when a.service = '29' then 'XSELL DOC3'
when a.service = '30' then 'Supply'
when a.service = '31' then 'Physician'
when a.service =-1 then ( case when c24service = 'N' then 'Nursing'
when c24service = 'N' then 'Nurse Sister+Brother'
when c24service = 'A' then 'Attendant Aaya+Wardboy'
when c24service = 'P' then 'Physiotherapist'
when c24service = 'Nu' then 'Nutritionist'
when c24service = 'Eq' then 'Equipment'
when c24service = 'Ic' then 'InfantCare'
when c24service = 'St' then 'Speech Therapy'
when c24service = 'Ot' then 'Occupational Therapy'
when c24service = 'Cp' then 'Clinical Psychology'
when c24service = 'On' then 'Onco Nurse'
when c24service = 'Cc' then 'Cancer Coach'
when c24service = 'Pc' then 'Pregnancy Care'
when c24service = 'Ph' then 'Pharmacy'
when c24service = 'Py' then 'Physician' else 'unknown'
end ) else null END) Lead_Service_Category,

(CASE WHEN campaigntype_id = 1 then 'Facebook_Ad'
WHEN campaigntype_id = 2 then 'Google_Adwords'
WHEN campaigntype_id = 3 then 'Twitter'
WHEN campaigntype_id = 13 then 'Email'
WHEN campaigntype_id = 14 then 'SMS'
WHEN campaigntype_id = 15 then 'LinkedIn'
WHEN lead_type = 1 THEN 'JustDial'
WHEN lead_type = 2 THEN 'WebSite'
WHEN lead_type = 3 THEN 'Web-Promo'
WHEN lead_type = 4 THEN 'Web-Adwords'
WHEN lead_type = 5 THEN 'App'
WHEN lead_type = 6 THEN 'Quickr'
WHEN lead_type = 7 THEN 'Groupon'
WHEN lead_type = 8 THEN 'AskLaila'
WHEN lead_type = 9 THEN 'Sulekha'
WHEN lead_type = 20 THEN 'Manual'
WHEN lead_type = 21 THEN 'Hospital'
WHEN lead_type = 22 THEN 'MissedCall'
WHEN lead_type = 23 THEN 'Web-Unbounce'
WHEN lead_type = 24 THEN 'Practo'
when lead_type = '25' then 'ColdCalling-PC'
when lead_type = '26' then 'Quikr'
when lead_type = '27' then 'Cancer Referral'
when lead_type = '28' then 'OnGroundSale'
ELSE 'Unknown' END) as Lead_Channel,
(CASE WHEN lstat IN (0,2,5) THEN 'Converted'
WHEN lstat IN (3,4,31) THEN 'Open'
WHEN lstat IN (-4,-3) THEN 'Bad'
WHEN lstat=-1 THEN 'Lost'
WHEN lstat=1 THEN 'No Action'
ELSE 'Others' END) Lead_Status_Category, 
count(*) as Lead_Count,sum(price_negotiated*1.00 * estimated_visits*1.00) 
 from "LeadManager_lead" as A 
LEFT OUTER JOIN "CampaignManager_campaign" as B ON (A.from_campaign_id = B.id) 
left join "RequestBooking_booking" rbb on for_lead_id  = a.id 
where date(a.created+interval'5:30') >=current_date-64 AND lstat NOT IN (-2,-10,-4) 
group by 1,2,3,4 order by 1 
