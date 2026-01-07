
  create view "delivery_analytics2"."analytics"."int_shipment_status__dbt_tmp"
    
    
  as (
    select
    shipment_id,
    current_status,
    delivery_type,
    delivery_city,
    courier_id
from "delivery_analytics2"."analytics"."fct_shipments"




/*

Koji je status po posiljci je li 
pending, picked up, delivered


*/
  );