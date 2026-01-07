with shipments as (
    select *
    from "delivery_analytics2"."analytics"."fct_shipments"
)

select
    courier_id,

    count(*) as total_shipments,
    count(case when current_status = 'delivered' then 1 end) as delivered_shipments,
    avg(delivery_duration_days) as avg_delivery_duration_days,
    sum(price) as total_revenue,
    sum(case when is_late_delivery then 1 else 0 end)::float / nullif(count(*),0) as pct_late_deliveries

from shipments
group by courier_id