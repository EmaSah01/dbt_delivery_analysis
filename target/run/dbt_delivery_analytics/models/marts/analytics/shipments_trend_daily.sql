
  
    

  create  table "delivery_analytics"."analytics"."shipments_trend_daily__dbt_tmp"
  
  
    as
  
  (
    -- models/analytics/shipments_trend_daily.sql
with shipments as (
    select *
    from "delivery_analytics"."analytics"."fct_shipments"
)

select
    shipment_date::date as date,
    count(distinct shipment_id) as total_shipments,
    sum(case when late_delivery = false then 1 else 0 end) as on_time_shipments,
    sum(case when late_delivery = true then 1 else 0 end) as late_shipments
from shipments
group by shipment_date::date
order by shipment_date::date
  );
  