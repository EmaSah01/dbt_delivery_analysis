with shipments as (
    select *
    from {{ ref('fct_shipments') }}
)

select
    current_status,
    count(*) as total_shipments,
    sum(case when current_status != 'delivered' then 1 else 0 end) as active_shipments
from shipments
group by current_status

/*
VIEW: shipment_status
Svrha:
- Prikazuje broj pošiljki po statusu: pending, picked_up, delivered
- Koristi se za monitoring opterećenja i trenutnog statusa pošiljki
*/
