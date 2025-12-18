
  
    

  create  table "delivery_analytics"."analytics"."fct_shipments_sla__dbt_tmp"
  
  
    as
  
  (
    /*

Upoređujemo planirani datum isporuke 
(expected_delivery_date) sa stvarnim datumom 
isporuke (delivered_at). Izračunavamo trajanje 
isporuke i označavamo late_delivery kao true/false.

*/


with sla as (
    select
        shipment_id,
        courier_id,
        shipment_date,
        expected_delivery_date,
        delivered_at,

        case
            when delivered_at is null then null
            else (delivered_at::date - expected_delivery_date::date)
        end as delivery_delay_days,

        case
            when delivered_at is null then null
            when delivered_at::date > expected_delivery_date::date then true
            else false
        end as late_delivery

    from "delivery_analytics"."analytics"."fct_shipments"
)

select *
from sla
  );
  