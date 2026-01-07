
  create view "delivery_analytics2"."analytics"."int_active_delays__dbt_tmp"
    
    
  as (
    with shipments as (
    select *
    from "delivery_analytics2"."analytics"."fct_shipments"
)

select *
from shipments
where current_status in ('pending','picked_up')
   or (current_status='delivered' and is_late_delivery)



/*

Koje posiljke trenutno kasne

*/
  );