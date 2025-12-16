with source as (
    select *
    from {{ source('raw', 'shipments') }}
)

select
    shipment_id,
    sender_id,
    receiver_id,
    shipment_date,
    expected_delivery_date,
    price
from source
