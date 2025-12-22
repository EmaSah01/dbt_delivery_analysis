-- models/analytics/shipments_trend_monthly.sql
with shipments as (
    select *
    from "delivery_analytics"."analytics"."fct_shipments"
)

select
    date_trunc('month', shipment_date) as month,
    count(distinct shipment_id) as total_shipments,
    sum(case when late_delivery = false then 1 else 0 end) as on_time_shipments,
    sum(case when late_delivery = true then 1 else 0 end) as late_shipments
from shipments
group by date_trunc('month', shipment_date)
order by month