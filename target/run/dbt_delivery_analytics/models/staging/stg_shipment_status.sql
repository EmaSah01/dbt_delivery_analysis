
  create view "delivery_analytics"."analytics"."stg_shipment_status__dbt_tmp"
    
    
  as (
    with source as (
    select *
    from "delivery_analytics"."raw"."shipment_status"
)

select
    shipment_status_id,
    shipment_id,
    status,
    status_timestamp,
    courier_id
from source
  );