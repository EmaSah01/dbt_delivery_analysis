import streamlit as st
import plotly.express as px
import pandas as pd
from utils import load_view

st.title("Courier Load")

# Učitavanje view-a
df = load_view("courier_load")

# Prikaz table
st.subheader("Courier Load Table")
st.dataframe(df)

# Graf: total shipments po kuriru po danu
if 'shipment_date' in df.columns:
    fig = px.line(df, x='shipment_date', y='total_shipments_per_day', color='courier_id',
                  title="Total Shipments per Courier per Day")
    st.plotly_chart(fig, use_container_width=True)

# Graf: active shipments po kuriru
if 'active_shipments' in df.columns:
    fig2 = px.bar(df, x='courier_id', y='active_shipments', color='courier_id',
                  title="Active Shipments per Courier")
    st.plotly_chart(fig2, use_container_width=True)
