
  
    

  create  table "delivery_analytics2"."analytics"."fct_shipments_by_time__dbt_tmp"
  
  
    as
  
  (
    with shipments as (
    select *
    from "delivery_analytics2"."analytics"."fct_shipments"
)

select
    date_trunc('day', shipment_date) as day,
    date_trunc('week', shipment_date) as week,
    date_trunc('month', shipment_date) as month,
    delivery_city,
    courier_id,
    delivery_type,
    count(*) as total_shipments,
    count(case when is_late_delivery = false then 1 end) as on_time_shipments,
    avg(delivery_duration_days) as avg_delivery_days
from shipments
group by 1,2,3,4,5,6
order by day
  );
  