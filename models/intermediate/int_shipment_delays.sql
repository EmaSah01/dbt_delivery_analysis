with shipments as (
    select *
    from {{ ref('fct_shipments') }}
)

select
    shipment_id,
    shipment_date,
    expected_delivery_date,
    completed_at,
    case 
        when completed_at is not null then (completed_at::date - expected_delivery_date)
        else (current_date - expected_delivery_date)
    end as delay_days
from shipments



/*

Koliko je kasnjenje po posiljci

*/


