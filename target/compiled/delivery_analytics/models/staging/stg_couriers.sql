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