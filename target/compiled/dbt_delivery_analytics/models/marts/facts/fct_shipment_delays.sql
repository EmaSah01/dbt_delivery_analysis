with shipments as (
    select *
    from "delivery_analytics2"."analytics"."fct_shipments"
)

select
    shipment_id,
    shipment_date,
    expected_delivery_date,
    completed_at,
    delivery_city,
    delivery_type,
    courier_id,

    -- kašnjenje u danima
    case
        when completed_at is not null then (completed_at::date - expected_delivery_date::date)
        else (current_date - expected_delivery_date::date)
    end as delay_days,

    -- da li je pošiljka kasnila
    case
        when completed_at > expected_delivery_date then true
        when completed_at is null and current_date > expected_delivery_date then true
        else false
    end as is_late_delivery

from shipments

/*
FACT TABLE: fct_shipment_delays

Svrha:
- Prati kašnjenja po pošiljci
- Može se koristiti za analizu kašnjenja po gradu, tipu pošiljke i kuriru
- Ulaz za view-eve: delays_by_city_type, courier_load, couriers_performance itd.

Kolone:
- shipment_id: jedinstveni identifikator pošiljke
- shipment_date, expected_delivery_date, completed_at: datumi
- courier_id, delivery_city, delivery_type: atributi pošiljke
- delay_days: broj dana kašnjenja
- is_late_delivery: boolean, true ako je pošiljka kasnila
*/