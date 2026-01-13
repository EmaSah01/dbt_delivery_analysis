
  
    

  create  table "delivery_analytics2"."analytics"."dim_cities__dbt_tmp"
  
  
    as
  
  (
    select distinct city
from "delivery_analytics2"."analytics"."stg_customers"
  );
  