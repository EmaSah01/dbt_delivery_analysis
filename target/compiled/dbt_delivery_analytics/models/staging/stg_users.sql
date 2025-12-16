with source as (
    select *
    from "delivery_analytics"."raw"."users"
)

select
    user_id,
    username,
    email,
    role,
    created_at
from source