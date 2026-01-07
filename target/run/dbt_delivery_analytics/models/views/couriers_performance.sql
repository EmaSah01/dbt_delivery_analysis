
  create view "delivery_analytics2"."analytics"."couriers_performance__dbt_tmp"
    
    
  as (
    with shipments as (
    select *
    from "delivery_analytics2"."analytics"."fct_shipments"
)

select
    courier_id,
    count(*) as total_shipments,
    count(case when current_status = 'delivered' then 1 end) as delivered_shipments,
    avg(delivery_duration_days) as avg_delivery_duration_days,
    sum(case when delivery_type = 'express' then 1 else 0 end) as express_shipments_count,
    avg(distance_km) as avg_distance_per_shipment,
    sum(distance_km) as total_distance_per_courier,
    (count(case when is_late_delivery = false then 1 end)::float / nullif(count(*),0))*100 as success_rate_percent,
    count(case when current_status != 'delivered' then 1 end) as pending_shipments
from shipments
group by courier_id
order by courier_id

/*
VIEW: couriers_performance

Svrha:
- Prikazuje performanse kurira
- Metričke kolone: total_shipments, delivered_shipments, avg_delivery_duration_days,
  express_shipments_count, avg_distance_per_shipment, total_distance_per_courier, success_rate_percent, pending_shipments
*/
  );