
  create view "delivery_analytics2"."analytics"."stg_couriers__dbt_tmp"
    
    
  as (
    -- stg_couriers.sql
with source as (
    select
        courier_id,
        name,
        vehicle_type,
        city
    from "delivery_analytics2"."raw"."couriers"
)

select * from source
  );