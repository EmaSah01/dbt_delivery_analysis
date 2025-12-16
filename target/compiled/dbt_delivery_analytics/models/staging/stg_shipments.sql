with source as (
    select *
    from "delivery_analytics"."raw"."shipments"
)

select
    shipment_id,
    sender_id,
    receiver_id,
    shipment_date,
    expected_delivery_date,
    price
from source