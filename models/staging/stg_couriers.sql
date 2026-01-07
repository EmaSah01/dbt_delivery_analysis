-- stg_couriers.sql
with source as (
    select
        courier_id,
        name,
        vehicle_type,
        city
    from {{ source('raw', 'couriers') }}
)

select * from source
