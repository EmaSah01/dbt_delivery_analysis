
  
  
  create or replace view `delivery_analytics`.`staging`.`stg_couriers`
  
  as (
    -- stg_couriers.sql
with source as (
    select
        courier_id,
        name,
        vehicle_type,
        city
    from `delivery_analytics2`.`raw`.`couriers`
)

select * from source
  )
