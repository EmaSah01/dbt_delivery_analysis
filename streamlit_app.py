import streamlit as st
import pandas as pd
import sqlalchemy

# ----- KONEKCIJA NA POSTGRES -----
engine = sqlalchemy.create_engine("postgresql://postgres:1234@localhost:5433/delivery_analytics")

st.title("DBT Delivery Analytics Dashboard")


# ----- PREGLED SVIH FACT TABLICA -----
st.subheader("Fact Tables Preview")
fact_tables = ["fct_shipments", "fct_shipments_sla", "fct_shipments_revenue"]

selected_fact = st.selectbox("Select a fact table to view", fact_tables)
fact_df = pd.read_sql(f"SELECT * FROM analytics.{selected_fact} LIMIT 100", engine)
st.dataframe(fact_df)

# ----- DAILY TREND -----
daily_df = pd.read_sql("SELECT * FROM analytics.shipments_trend_daily", engine)
st.subheader("Shipments Trend - Daily")
st.line_chart(daily_df.set_index('date')[['total_shipments', 'on_time_shipments', 'late_shipments']])

# ----- WEEKLY TREND -----
weekly_df = pd.read_sql("SELECT * FROM analytics.shipments_trend_weekly", engine)
st.subheader("Shipments Trend - Weekly")
st.bar_chart(weekly_df.set_index('week_start')['total_shipments'])

# ----- MONTHLY TREND -----
monthly_df = pd.read_sql("SELECT * FROM analytics.shipments_trend_monthly", engine)
st.subheader("Shipments Trend - Monthly")
st.bar_chart(monthly_df.set_index('month')['total_shipments'])

# ----- COURIER PERFORMANCE -----
courier_df = pd.read_sql("SELECT * FROM analytics.courier_performance", engine)
st.subheader("Courier Performance")
st.dataframe(courier_df)

# ----- SHIPMENTS BY CITY & VEHICLE -----
city_vehicle_df = pd.read_sql("SELECT * FROM analytics.shipments_by_city_vehicle", engine)
st.subheader("Shipments by City & Vehicle")
st.dataframe(city_vehicle_df)



# ----- PREGLED STAGING TABLICA -----
st.subheader("Staging Tables Preview")
stg_tables_query = pd.read_sql(
    "SELECT table_name FROM information_schema.tables WHERE table_schema='analytics'", engine
)
# filtriramo samo tablice koje počinju sa 'stg_'
stg_tables = [t for t in stg_tables_query['table_name'].tolist() if t.startswith('stg_')]

selected_stg = st.selectbox("Select a staging table to view", stg_tables)
stg_df = pd.read_sql(f"SELECT * FROM analytics.{selected_stg} LIMIT 100", engine)
st.dataframe(stg_df)


# ----- PREGLED BILO KOJE TABELE IZ BAZE -----
st.subheader("Custom Table Query")
all_tables_query = pd.read_sql(
    "SELECT table_name FROM information_schema.tables WHERE table_schema='analytics'", engine
)
all_tables = all_tables_query['table_name'].tolist()

selected_table = st.selectbox("Select any table from analytics schema", all_tables)
table_df = pd.read_sql(f"SELECT * FROM analytics.{selected_table} LIMIT 100", engine)
st.dataframe(table_df)
