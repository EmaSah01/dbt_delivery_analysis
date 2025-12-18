
  
    

  create  table "delivery_analytics"."analytics"."daily_shipments_status__dbt_tmp"
  
  
    as
  
  (
    select
    status_timestamp::date as shipment_date,
    status,
    count(*) as shipments_count
from "delivery_analytics"."analytics"."stg_shipment_status"
group by
    status_timestamp::date,
    status
order by
    shipment_date,
    status
  );
  