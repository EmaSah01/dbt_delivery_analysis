with source as (
    select *
    from {{ source('raw', 'shipment_status') }}
)

select
    shipment_status_id,
    shipment_id,
    status,
    status_timestamp,
    courier_id
from source
