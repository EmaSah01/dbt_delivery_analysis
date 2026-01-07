import streamlit as st
from utils import load_view

st.title("Active Shipments & Status")
active = load_view("active_delays")
status = load_view("shipment_status")

st.subheader("Active Shipments")
st.dataframe(active)

st.subheader("Shipment Status")
st.dataframe(status)
