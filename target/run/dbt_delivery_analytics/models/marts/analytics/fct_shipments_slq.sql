
  
    

  create  table "delivery_analytics"."analytics"."fct_shipments_slq__dbt_tmp"
  
  
    as
  
  (
    /*

Upoređujemo planirani datum isporuke 
(expected_delivery_date) sa stvarnim datumom 
isporuke (delivered_at). Izračunavamo trajanje 
isporuke i označavamo late_delivery kao true/false.

*/


with base as (
    select *
    from "delivery_analytics"."analytics"."fct_shipments"
),

sla as (
    select
        shipment_id,
        courier_id,
        shipment_date,
        expected_delivery_date,
        delivered_at,
        -- trajanje isporuke u danima
        extract(epoch from (delivered_at - shipment_date))/86400 as delivery_duration_days,
        -- kasnjenje
        case 
            when delivered_at > expected_delivery_date then true
            else false
        end as late_delivery
    from base
)

select * from sla;
  );
  