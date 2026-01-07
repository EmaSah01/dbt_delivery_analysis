Delivery Analytics Platform (dbt + PostgreSQL + Streamlit)

End-to-end data analytics project for delivery logistics, built using dbt, PostgreSQL, and Streamlit.
The project transforms raw operational data into analytical models and exposes insights through an interactive dashboard.

🚀 Project Overview

This project simulates a real-world delivery analytics system:

Raw shipment, courier, and customer data is modeled using dbt

Clean staging, intermediate, fact, and analytics views are built

Analytical views are visualized in a Streamlit dashboard

Focus on delivery performance, delays, courier workload, and trends over time

🧱 Tech Stack

Database: PostgreSQL

Transformation: dbt (data build tool)

Visualization: Streamlit + Plotly

Language: SQL, Python

Version Control: Git & GitHub

🗂️ Project Structure
dbt_delivery_analytics/
│
├── models/
│   ├── sources.yml
│   ├── staging/
│   │   ├── stg_shipments.sql
│   │   ├── stg_customers.sql
│   │   └── stg_couriers.sql
│   │
│   ├── intermediate/
│   │   ├── int_shipment_delays.sql
│   │   ├── int_active_delays.sql
│   │   └── int_shipment_status.sql
│   │
│   ├── marts/
│   │   └── facts/
│   │       ├── fct_shipments.sql
│   │       ├── fct_shipment_delays.sql
│   │       ├── fct_courier_performance.sql
│   │       └── fct_courier_load.sql
│   │
│   └── views/
│       ├── shipments_by_time.sql
│       ├── couriers_performance.sql
│       ├── courier_load.sql
│       ├── shipment_delays.sql
│       ├── shipment_status.sql
│       ├── delays_by_city_type.sql
│       └── active_delays.sql
│
├── streamlit_app/
│   ├── app.py
│   ├── utils.py
│   └── pages/
│       ├── shipments_by_time.py
│       ├── courier_performance.py
│       ├── courier_load.py
│       ├── shipment_delays.py
│       ├── shipment_status.py
│       ├── delays_by_city_type.py
│       └── active_delays.py
│
├── .gitignore
├── README.md
└── requirements.txt

📊 Analytics Views
A. Shipments by Time

Shipments per day / week / month

Segmented by:

delivery city

courier

delivery type (standard / express)

Metrics:

total_shipments

on_time_shipments

avg_delivery_days

total_revenue

total_distance

B. Courier Performance

total_shipments

delivered_shipments

avg_delivery_duration_days

express_shipments_count

avg_distance_per_shipment

total_distance_per_courier

success_rate_percent

pending_shipments

C. Shipment Delays

Delay per shipment

Delay aggregation by:

city

delivery type

Metrics:

avg_delay_days

on_time_shipments

total_shipments

D. Courier Load

Daily workload per courier

Active (non-delivered) shipments

Trend analysis of courier utilization

E. Shipment Status

Number of shipments by status:

pending

picked_up

delivered

🖥️ Streamlit Dashboard

The dashboard is split into multiple pages:

Shipments by Time

Courier Performance

Courier Load

Shipment Delays

Active Delays

Shipment Status

Delays by City & Delivery Type

Each page includes:

Interactive filters

Tables

Charts (line, bar, histogram)

⚙️ How to Run the Project
1️⃣ Setup Python Environment
python -m venv venv
source venv/bin/activate   # Windows: venv\Scripts\activate
pip install -r requirements.txt

2️⃣ Run dbt Models
dbt run
dbt test

3️⃣ Run Streamlit App
cd streamlit_app
streamlit run app.py
