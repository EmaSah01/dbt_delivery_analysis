with shipments as (
    select *
    from "delivery_analytics2"."analytics"."fct_shipments"
    where shipment_date is not null
)

select
    courier_id,
    shipment_date,
    count(*) as shipments_per_day,
    sum(distance_km) as total_distance_per_day,
    sum(price) as revenue_per_day

from shipments
group by courier_id, shipment_date
order by courier_id, shipment_date



/*

Daily load po kuriru


*/