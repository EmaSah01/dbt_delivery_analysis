with shipments as (
    select *
    from {{ source('raw', 'shipments') }}
),

assignments as (
    select
        shipment_id,
        courier_id,
        delivered_at
    from {{ source('raw', 'courier_assignments') }}
)

select
    s.shipment_id,
    a.courier_id,
    s.shipment_date,
    s.expected_delivery_date,
    a.delivered_at,
    s.price,

    case
        when a.delivered_at is null then null
        when a.delivered_at::date > s.expected_delivery_date::date then true
        else false
    end as late_delivery

from shipments s
left join assignments a
    on s.shipment_id = a.shipment_id
