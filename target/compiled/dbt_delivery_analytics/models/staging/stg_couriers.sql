with source as (
    select *
    from "delivery_analytics"."raw"."couriers"
)

select
    courier_id,
    user_id,
    vehicle_type,
    city
from source