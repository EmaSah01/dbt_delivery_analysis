
  create view "delivery_analytics2"."analytics"."stg_customers__dbt_tmp"
    
    
  as (
    with source as (
    select
        customer_id,
        name,
        email,
        phone,
        address,
        city
    from "delivery_analytics2"."raw"."customers"
)

select * from source
  );