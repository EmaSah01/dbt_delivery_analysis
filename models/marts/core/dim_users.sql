with users as (
    select *
    from {{ ref('stg_users') }}
)

select
    user_id,
    username,
    email,
    role,
    created_at
from users
