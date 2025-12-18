select
    status_timestamp::date as shipment_date,
    status,
    count(*) as shipments_count
from {{ ref('stg_shipment_status') }}
group by
    status_timestamp::date,
    status
order by
    shipment_date,
    status
