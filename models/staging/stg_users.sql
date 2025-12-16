with source as (
    select *
    from {{ source('raw', 'users') }}
)

select
    user_id,
    username,
    email,
    role,
    created_at
from source
