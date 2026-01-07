import streamlit as st
from utils import load_view
import plotly.express as px
import pandas as pd

def show():
    st.header("Shipment Status Overview")

    # Load data
    df = load_view("shipment_status")

    # Tipovi
    df['total_shipments'] = df['total_shipments'].astype(int)
    df['active_shipments'] = df['active_shipments'].astype(int)

    # Tabela
    st.subheader("Tabela statusa pošiljki")
    st.dataframe(df)

    # Graf: broj pošiljki po statusu
    fig = px.bar(
        df,
        x="current_status",
        y="total_shipments",
        title="Total Shipments by Status",
        text="total_shipments"
    )
    st.plotly_chart(fig, width="stretch")

    # Graf: aktivne pošiljke
    fig2 = px.bar(
        df,
        x="current_status",
        y="active_shipments",
        title="Active (Non-delivered) Shipments by Status",
        text="active_shipments"
    )
    st.plotly_chart(fig2, width="stretch")
