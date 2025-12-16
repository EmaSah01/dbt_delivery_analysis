
  create view "delivery_analytics"."analytics"."stg_couriers__dbt_tmp"
    
    
  as (
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
  );