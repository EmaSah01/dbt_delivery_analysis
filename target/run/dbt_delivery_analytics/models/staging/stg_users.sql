
  create view "delivery_analytics"."analytics"."stg_users__dbt_tmp"
    
    
  as (
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
  );