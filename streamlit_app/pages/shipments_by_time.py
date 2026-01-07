import streamlit as st
from utils import load_view
import plotly.express as px
import pandas as pd

def show():
    st.header("Shipments by Time")

    # Load data
    df = load_view("shipments_by_time")
    st.write(df.head())

    # Provjera i konverzija tipova
    df['day'] = pd.to_datetime(df['day'])
    df['total_shipments'] = df['total_shipments'].astype(int)
    df['avg_delivery_days'] = df['avg_delivery_days'].astype(float)

    # Filtriranje po gradu
    cities = df['delivery_city'].unique()
    selected_city = st.multiselect("Izaberi grad:", options=cities, default=cities)
    df = df[df['delivery_city'].isin(selected_city)]

    if df.empty:
        st.warning("Nema podataka za izabrani grad/gradove.")
        return

    # Tabela
    st.subheader("Tabela pošiljki")
    st.dataframe(df)

    # Graf: Shipments per day
    fig = px.line(
        df, 
        x='day', 
        y='total_shipments', 
        color='delivery_type', 
        title="Total Shipments per Day",
        markers=True
    )
    st.plotly_chart(fig, use_container_width=True)

    # Graf: Avg delivery duration per day
    fig2 = px.bar(
        df, 
        x='day', 
        y='avg_delivery_days', 
        color='delivery_type', 
        title="Average Delivery Duration per Day"
    )
    st.plotly_chart(fig2, use_container_width=True)
