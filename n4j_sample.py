from neo4j import GraphDatabase


# uri = "bolt://localhost:7687"
g = GraphDatabase.driver('bolt://localhost',auth=basic_auth("neo4j", "admin"))

def get_db():
    if not hasattr(g, 'neo4j_db'):
        g.neo4j_db = driver.session()
    return g.neo4j_db

db = get_db()
results = db.run("MATCH (n:Place) " 
                 "RETURN n.id as id, n.latitude as latitude " 
                 "LIMIT {limit}", {"limit": 25})
