import pandas as pd
import sqlalchemy

# Kreiranje engine-a za konekciju na PostgreSQL
def get_engine():
    engine = sqlalchemy.create_engine(
        "postgresql+psycopg2://postgres:1234@localhost:5433/delivery_analytics2"
    )
    return engine

# Funkcija za učitavanje view-a
def load_view(view_name):
    engine = get_engine()
    query = f"SELECT * FROM analytics.{view_name}"
    df = pd.read_sql(query, engine)
    return df