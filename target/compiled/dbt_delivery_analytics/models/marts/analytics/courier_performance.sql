with fct as (
    select *
    from "delivery_analytics"."analytics"."fct_shipments"
)

select
    courier_id,
    count(distinct shipment_id) as total_shipments,
    sum(case when status = 'delivered' then 1 else 0 end) as delivered_shipments,
    AVG(EXTRACT(EPOCH FROM (expected_delivery_date - shipment_date)) / 86400) AS avg_delivery_time
from fct
group by courier_id