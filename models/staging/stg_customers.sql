with source as (
    select
        customer_id,
        name,
        email,
        phone,
        address,
        city
    from {{ source('raw', 'customers') }}
)

select * from source
