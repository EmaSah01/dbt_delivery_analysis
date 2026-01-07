


select
    shipment_id,
    current_status,
    delivery_type,
    delivery_city,
    courier_id
from {{ ref('fct_shipments') }}




/*

Koji je status po posiljci je li 
pending, picked up, delivered


*/