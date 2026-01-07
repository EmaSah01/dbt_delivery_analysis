import streamlit as st

st.set_page_config(page_title="Delivery Analytics Dashboard", layout="wide")

st.title("Delivery Analytics Dashboard")

# Sidebar navigacija
page = st.sidebar.selectbox(
    "Izaberi stranicu:",
    [
        "Shipments by Time",
        "Courier Performance",
        "Courier Load",
        "Shipment Delays",
        "Active Delays",
        "Shipment Status",
        "Delays by City Type"  # <-- dodano
    ]
)

if page == "Shipments by Time":
    from pages import shipments_by_time
    shipments_by_time.show()
elif page == "Courier Performance":
    from pages import courier_performance
    courier_performance.show()
elif page == "Courier Load":
    from pages import courier_load
    courier_load.show()
elif page == "Shipment Delays":
    from pages import shipment_delays
    shipment_delays.show()
elif page == "Active Delays":
    from pages import active_delays
    active_delays.show()
elif page == "Shipment Status":
    from pages import shipment_status
    shipment_status.show()
elif page == "Delays by City Type":   # <-- dodano
    from pages import delays_by_city_type
    delays_by_city_type.show()
