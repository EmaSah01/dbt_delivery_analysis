
  create view "delivery_analytics2"."analytics"."stg_shipments__dbt_tmp"
    
    
  as (
    with source as (
    select
        shipment_id,
        sender_id,
        receiver_id,
        courier_id,
        shipment_date,
        expected_delivery_date,
        completed_at,
        price,
        delivery_city,
        delivery_type,
        distance_km
    from "delivery_analytics2"."raw"."shipments"
),

status_logic as (
    select
        *,
        case
            when shipment_date is null then 'pending'
            when shipment_date is not null and completed_at is null then 'picked_up'
            when completed_at is not null then 'delivered'
        end as current_status
    from source
)

select * from status_logic
  );