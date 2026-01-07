with shipments as (
    select *
    from {{ ref('fct_shipments') }}
    where current_status != 'delivered'
)

select
    shipment_id,
    courier_id,
    delivery_city,
    delivery_type,
    shipment_date,
    expected_delivery_date,
    current_status,
    (current_date - expected_delivery_date) as delay_days
from shipments
where current_date > expected_delivery_date
order by delay_days desc

/*
VIEW: active_delays
Svrha:
- Prikazuje sve aktivne pošiljke koje kasne
- Metričke kolone: delay_days
- Koristi se za monitoring kašnjenja i upozorenja
*/
