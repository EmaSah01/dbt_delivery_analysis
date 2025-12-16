
  
    

  create  table "delivery_analytics"."analytics"."dim_dates__dbt_tmp"
  
  
    as
  
  (
    with users as (
    select *
    from "delivery_analytics"."analytics"."stg_users"
)

select
    user_id,
    username,
    email,
    role,
    created_at
from users
  );
  