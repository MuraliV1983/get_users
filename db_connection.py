import psycopg2

def get_connection():
    return psycopg2.connect(
        host="localhost",
        user="postgres",
        password="server",
        database="flask_pg_demo"
    )