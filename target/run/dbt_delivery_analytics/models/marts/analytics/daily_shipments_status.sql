
  
    

  create  table "delivery_analytics"."analytics"."daily_shipments_status__dbt_tmp"
  
  
    as
  
  (
    with fct as (
    select *
    from "delivery_analytics"."analytics"."fct_shipments"
)

select
    shipment_date,
    status,
    count(*) as shipments_count
from fct
group by shipment_date, status
order by shipment_date, status
  );
  