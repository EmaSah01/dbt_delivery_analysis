import streamlit as st
from utils import load_view
import plotly.express as px
import pandas as pd

def show():
    st.header("Delays by City and Delivery Type")

    # Load view
    df = load_view("delays_by_city_type")

    # Provjera i konverzija tipova
    df['avg_delay_days'] = df['avg_delay_days'].astype(float)
    df['total_shipments'] = df['total_shipments'].astype(int)
    df['on_time_shipments'] = df['on_time_shipments'].astype(int)

    # Filtriranje po gradu
    cities = df['delivery_city'].unique()
    selected_city = st.multiselect("Izaberi grad:", options=cities, default=cities)
    df = df[df['delivery_city'].isin(selected_city)]

    if df.empty:
        st.warning("Nema podataka za izabrani grad/gradove.")
        return

    # Tabela
    st.subheader("Tabela kašnjenja")
    st.dataframe(df)

    # Graf: Prosječno kašnjenje po gradu
    fig = px.bar(
        df, 
        x='delivery_city', 
        y='avg_delay_days', 
        color='delivery_type',
        title="Average Delay Days by City and Delivery Type",
        barmode='group'
    )
    st.plotly_chart(fig, use_container_width=True)

    # Graf: Ukupan broj pošiljki po gradu
    fig2 = px.bar(
        df, 
        x='delivery_city', 
        y='total_shipments', 
        color='delivery_type', 
        title="Total Shipments by City and Delivery Type",
        barmode='group'
    )
    st.plotly_chart(fig2, width= 'stretch')
