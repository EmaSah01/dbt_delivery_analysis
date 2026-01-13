
  
    

  create  table "delivery_analytics2"."analytics"."dim_couriers__dbt_tmp"
  
  
    as
  
  (
    select *
from "delivery_analytics2"."analytics"."stg_couriers"
  );
  