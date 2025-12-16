
  
    

  create  table "delivery_analytics"."analytics"."dim_couriers__dbt_tmp"
  
  
    as
  
  (
    with couriers as (
    select *
    from "delivery_analytics"."analytics"."stg_couriers"
),

users as (
    select user_id, username
    from "delivery_analytics"."analytics"."stg_users"
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
  );
  