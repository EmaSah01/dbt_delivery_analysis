
  
    

  create  table "delivery_analytics2"."analytics"."fct_shipments__dbt_tmp"
  
  
    as
  
  (
    with shipments as (

    select *
    from "delivery_analytics2"."analytics"."stg_shipments"

),

customers as (

    select *
    from "delivery_analytics2"."analytics"."stg_customers"

),


couriers as (

    select *
    from "delivery_analytics2"."analytics"."stg_couriers"

)

select
    s.shipment_id,

    -- keys
    s.sender_id,
    s.receiver_id,
    s.courier_id,

    -- dates
    s.shipment_date,
    s.expected_delivery_date,
    s.completed_at,

    -- metrics
    s.price,
    s.distance_km,

    -- attributes
    s.delivery_city,
    s.delivery_type,
    s.current_status,

    -- derived metrics
    case
        when s.completed_at is not null
        then (s.completed_at::date - s.shipment_date)
    end as delivery_duration_days,

    case
        when s.completed_at > s.expected_delivery_date then true
        else false
    end as is_late_delivery

from shipments s




/*
    FACT TABLE: fct_shipments

    Svaki red u ovoj tabeli predstavlja jednu pošiljku (shipment) iz naše baze.

    Svrha:
    - Centralizovati sve metrike vezane za pošiljke na jednom mjestu
    - Omogućiti analitiku po vremenu, kuriru, tipu pošiljke i gradu
    - Poslužiti kao ulaz za BI dashboard ili dalju analitiku u marts layer-u

    Šta se ovdje računa:
    1. Ključne kolone:
        - shipment_id
        - sender_id, receiver_id
        - courier_id
    2. Datumi:
        - shipment_date (kada je pošiljka poslana)
        - expected_delivery_date (planirani datum isporuke)
        - completed_at (kada je pošiljka zaista dostavljena)
    3. Metričke kolone:
        - price
        - distance_km
    4. Atributi:
        - delivery_city
        - delivery_type (standard / express)
        - current_status (pending, picked_up, delivered)
    5. Derived metrics (izvedene kolone):
        - delivery_duration_days = koliko je dana trajala pošiljka
        - is_late_delivery = boolean, true ako je pošiljka dostavljena nakon expected_delivery_date

    Napomena:
    - Ova tabela služi kao "fact" jer sadrži sve mjere koje se mogu agregirati
    - Za dimenzije ćemo imati posebne dim_tables: dim_customers, dim_couriers, dim_cities
    - Može se koristiti za: analizu performansi kurira, kašnjenja po gradu, tip pošiljke, revenue po gradu itd.

*/
  );
  