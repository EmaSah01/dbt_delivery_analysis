select distinct city
from {{ ref('stg_customers') }}

