with fct as (
    select
        s.shipment_id,
        s.shipment_date,
        ca.courier_id,
        c.city,
        c.vehicle_type,
        s.expected_delivery_date,
        ca.delivered_at
    from "delivery_analytics"."raw"."shipments" s
    left join "delivery_analytics"."raw"."courier_assignments" ca
        on s.shipment_id = ca.shipment_id
    left join "delivery_analytics"."raw"."couriers" c
        on ca.courier_id = c.courier_id
)

select
    city,
    vehicle_type,
    count(distinct shipment_id) as total_shipments,
    sum(case when delivered_at is not null and delivered_at::date <= expected_delivery_date::date then 1 else 0 end) as on_time_deliveries,
    sum(case when delivered_at::date > expected_delivery_date::date then 1 else 0 end) as late_deliveries
from fct
group by city, vehicle_type
order by city, vehicle_type