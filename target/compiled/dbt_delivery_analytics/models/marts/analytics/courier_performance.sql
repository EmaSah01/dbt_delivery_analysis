select
    courier_id,
    count(distinct shipment_id) as total_shipments,
    sum(case when late_delivery = false then 1 else 0 end) as on_time_shipments,
    sum(case when late_delivery = true then 1 else 0 end) as late_shipments
from "delivery_analytics"."analytics"."fct_shipments"
group by courier_id