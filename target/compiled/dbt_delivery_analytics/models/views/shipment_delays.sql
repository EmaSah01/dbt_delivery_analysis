with shipments as (
    select *
    from "delivery_analytics2"."analytics"."fct_shipments"
)

select
    shipment_id,
    shipment_date,
    expected_delivery_date,
    completed_at,

    -- delay_days = difference između expected i actual delivery
    case
        when completed_at is not null then 
            extract(day from (completed_at::timestamp - expected_delivery_date::timestamp))
        else
            extract(day from (current_date - expected_delivery_date::timestamp))
    end as delay_days,

    -- is_late_delivery
    case
        when completed_at is not null and completed_at > expected_delivery_date then true
        when completed_at is null and current_date > expected_delivery_date then true
        else false
    end as is_late_delivery

from shipments

/*
VIEW: fct_shipment_delays
Svrha:
- Kašnjenje po pošiljci
- Metričke kolone: delay_days, is_late_delivery
- Može se agregirati po gradu, tipu pošiljke, kuriru
*/