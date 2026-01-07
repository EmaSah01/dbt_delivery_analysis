import streamlit as st
import plotly.express as px
from utils import load_view

st.title("Shipment Delays")
df = load_view("shipment_delays")

fig = px.histogram(df, x="delay_days", nbins=30, title="Distribution of Shipment Delays")
st.plotly_chart(fig, use_container_width=True)

st.dataframe(df)
