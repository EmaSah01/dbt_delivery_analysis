with couriers as (
    select *
    from {{ ref('stg_couriers') }}
),

users as (
    select user_id, username
    from {{ ref('stg_users') }}
)

select
    c.courier_id,
    c.user_id,
    u.username,
    c.vehicle_type,
    c.city
from couriers c
left join users u
    on c.user_id = u.user_id
