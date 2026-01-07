
  create view "delivery_analytics2"."analytics"."courier_load__dbt_tmp"
    
    
  as (
    with shipments as (
    select *
    from "delivery_analytics2"."analytics"."fct_shipments"
)

select
    courier_id,
    shipment_date,
    count(*) as total_shipments_per_day,
    count(case when current_status != 'delivered' then 1 end) as active_shipments
from shipments
group by courier_id, shipment_date
order by courier_id, shipment_date

/*
VIEW: courier_load

Svrha:
- Analiza radnog opterećenja kurira po danu
- active_shipments = pošiljke koje nisu još dostavljene
*/
  );