
  create view "delivery_analytics"."analytics"."stg_courier_assigments__dbt_tmp"
    
    
  as (
    with source as (
    select *
    from "delivery_analytics"."raw"."courier_assignments"
)

select
    assignment_id,
    courier_id,
    shipment_id,
    assigned_at,
    delivered_at
from source
  );