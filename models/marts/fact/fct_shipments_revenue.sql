
-- Analiza prihoda po danu, po kuriru ili po mjesecu.

select
    s.shipment_id,
    ca.courier_id,
    s.shipment_date,
    s.expected_delivery_date,
    ca.delivered_at,
    s.price,

    case
        when ca.delivered_at is null then null
        when ca.delivered_at::date > s.expected_delivery_date then true
        else false
    end as late_delivery

from {{ source('raw', 'shipments') }} s
left join {{ source('raw', 'courier_assignments') }} ca
    on s.shipment_id = ca.shipment_id
