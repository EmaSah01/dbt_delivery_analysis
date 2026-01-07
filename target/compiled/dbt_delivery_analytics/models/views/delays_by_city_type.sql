with delays as (
    select *
    from "delivery_analytics2"."analytics"."fct_shipment_delays"
)

select
    delivery_city,
    delivery_type,
    count(*) as total_shipments,
    count(case when is_late_delivery = false then 1 end) as on_time_shipments,
    avg(delay_days) as avg_delay_days
from delays
group by delivery_city, delivery_type
order by delivery_city, delivery_type

/*
VIEW: delays_by_city_type

Svrha:
- Agregacija kašnjenja po delivery_city i delivery_type
- Metričke kolone: total_shipments, on_time_shipments, avg_delay_days
*/