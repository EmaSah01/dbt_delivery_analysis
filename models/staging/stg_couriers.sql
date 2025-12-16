with source as (
    select *
    from {{ source('raw', 'couriers') }}
)

select
    courier_id,
    user_id,
    vehicle_type,
    city
from source
