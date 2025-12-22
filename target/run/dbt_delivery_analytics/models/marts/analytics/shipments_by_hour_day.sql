
  
    

  create  table "delivery_analytics"."analytics"."shipments_by_hour_day__dbt_tmp"
  
  
    as
  
  (
    with fct as (
    select
        s.shipment_id,
        s.shipment_date::timestamp as shipment_timestamp,
        extract(hour from s.shipment_date::timestamp) as shipment_hour,
        extract(dow from s.shipment_date) as day_of_week,
        ca.delivered_at,
        s.expected_delivery_date
    from "delivery_analytics"."raw"."shipments" s
    left join "delivery_analytics"."raw"."courier_assignments" ca
        on s.shipment_id = ca.shipment_id
)

select
    day_of_week,
    shipment_hour,
    count(distinct shipment_id) as total_shipments,
    sum(case when delivered_at is not null and delivered_at::date <= expected_delivery_date::date then 1 else 0 end) as on_time_deliveries,
    sum(case when delivered_at::date > expected_delivery_date::date then 1 else 0 end) as late_deliveries
from fct
group by day_of_week, shipment_hour
order by day_of_week, shipment_hour
  );
  