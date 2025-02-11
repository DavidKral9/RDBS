from sqlalchemy import create_engine, text

# Připojení k MySQL databázi
DATABASE_URL = "mysql+pymysql://david:heslo123@localhost:3306/football_top_20"

# Vytvoření engine (spojení s databází)
engine = create_engine(DATABASE_URL)

def execute_query(query):
    """Spustí SQL dotaz a vypíše výsledek."""
    try:
        with engine.connect() as connection:
            result = connection.execute(text(query))
            for row in result:
                print(row)
    except Exception as e:
        print("Chyba při provádění dotazu:", e)

# Dotazy k provedení
queries = {
    "Průměr záznamů na celou databázi":
        """SELECT (
            (SELECT COUNT(*) FROM players) + 
            (SELECT COUNT(*) FROM clubs) + 
            (SELECT COUNT(*) FROM leagues) + 
            (SELECT COUNT(*) FROM stadiums) + 
            (SELECT COUNT(*) FROM cities) + 
            (SELECT COUNT(*) FROM nations) + 
            (SELECT COUNT(*) FROM positions)
        ) / 7 AS avg_records_per_table;""",
}

#  Spustí všechny dotazy postupně
if __name__ == "__main__":
    for query_name, sql in queries.items():
        print(f"\n🔹 Spouštím dotaz: {query_name}")
        execute_query(sql)