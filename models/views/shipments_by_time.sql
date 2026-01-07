with shipments as (
    select *
    from {{ ref('fct_shipments') }}
    where shipment_date is not null
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
    avg(delivery_duration_days) as avg_delivery_days,
    sum(price) as total_revenue,
    sum(distance_km) as total_distance

from shipments
group by 1,2,3,4,5,6
order by day, delivery_city, courier_id, delivery_type

/*
VIEW: shipments_by_time

Svrha:
- Analiza pošiljki po danu, sedmici i mjesecu
- Segmentacija po delivery_city, courier_id, delivery_type (standard/express)
- Metričke kolone: total_shipments, on_time_shipments, avg_delivery_days, total_revenue, total_distance
- Može se koristiti za trend analizu i dashboard vizualizacije
*/
