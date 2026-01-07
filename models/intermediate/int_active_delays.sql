with shipments as (
    select *
    from {{ ref('fct_shipments') }}
)

select *
from shipments
where current_status in ('pending','picked_up')
   or (current_status='delivered' and is_late_delivery)



/*

Koje posiljke trenutno kasne

*/