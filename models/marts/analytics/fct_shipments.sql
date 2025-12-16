with shipments as (
    select *
    from {{ ref('stg_shipments') }}
),

shipment_status as (
    select *
    from {{ ref('stg_shipment_status') }}
),

users as (
    select *
    from {{ ref('dim_users') }}
),

couriers as (
    select *
    from {{ ref('dim_couriers') }}
)

select
    s.shipment_id,
    s.sender_id,
    su.username as sender_name,
    s.receiver_id,
    ru.username as receiver_name,
    s.shipment_date,
    s.expected_delivery_date,
    ss.status,
    ss.status_timestamp,
    ss.courier_id,
    c.user_id as courier_user_id,
    c.vehicle_type,
    s.price
from shipments s
left join shipment_status ss on s.shipment_id = ss.shipment_id
left join users su on s.sender_id = su.user_id
left join users ru on s.receiver_id = ru.user_id
left join couriers c on ss.courier_id = c.courier_id
