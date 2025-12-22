# DBT Delivery Analytics

This project is a data analytics system built using **dbt (Data Build Tool)** and **PostgreSQL**, focused on delivery logistics. It transforms raw operational data into analytics-ready fact tables and metrics to support operational and financial insights.

## Project Structure

- **models/staging/**  
  Staging models (stg) that clean and prepare raw tables from PostgreSQL.
  
- **models/marts/analytics/**  
  Analytical models (facts and metrics):
  - `fct_shipments`: central fact table with shipment details, courier assignments, and SLA metrics.
  - `courier_performance`: aggregated metrics per courier (total shipments, on-time shipments, late deliveries, average delivery time).
  - `fct_shipments_sla`: SLA metrics with delivery delays and late delivery flag.
  - `fct_shipments_revenue`: revenue analysis per day, courier, and period.
  - `daily_shipments_status`: daily shipment counts by status (created, in transit, delivered).

- **models/schema.yml**  
  DBT tests and documentation for model columns (not_null, unique, accepted_values).

Key Metrics
SLA Metrics

Late deliveries per shipment

Delivery delay in days

Helps monitor reliability of couriers

Courier Performance

Total shipments per courier

On-time vs late deliveries

Average delivery duration

Revenue Analytics

Daily and monthly revenue

Revenue per courier

Identifies most profitable periods and couriers

Operational Status

Daily shipment count per status

Tracks operational workflow

Running the Project
1. Set up virtual environment
python -m venv venv
source venv/bin/activate       # Linux / macOS
venv\Scripts\Activate.ps1      # Windows PowerShell

2. Install dependencies
pip install -r requirements.txt

3. Run dbt models
dbt run --select marts.analytics

4. Run Streamlit dashboard
streamlit run streamlit_app.py
