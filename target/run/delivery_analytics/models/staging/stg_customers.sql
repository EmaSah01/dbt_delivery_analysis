
  
  
  create or replace view `delivery_analytics`.`staging`.`stg_customers`
  
  as (
    with source as (
    select
        customer_id,
        name,
        email,
        phone,
        address,
        city
    from `delivery_analytics2`.`raw`.`customers`
)

select * from source
  )
