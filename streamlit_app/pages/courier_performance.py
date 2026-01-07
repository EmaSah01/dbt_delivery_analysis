import streamlit as st
import plotly.express as px
from utils import load_view

st.title("Courier Performance")

df = load_view("couriers_performance")

# Sortiranje po success rate
df_sorted = df.sort_values(by="success_rate_percent", ascending=False)

fig = px.bar(df_sorted, x="courier_id", y="success_rate_percent", color="total_shipments",
             title="Courier Success Rate (%)", text="total_shipments")
st.plotly_chart(fig, use_container_width=True)

st.dataframe(df_sorted)
