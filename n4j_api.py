from neo4j import GraphDatabase
from flask import Flask, g, Response, request
driver = GraphDatabase.driver('bolt://localhost', auth=("neo4j", "admin"))

# def get_db():
#     if not hasattr(g, 'neo4j_db'):
#         g.neo4j_db = driver.session()
#    return g.neo4j_db

db = driver.session()

results = db.run('''MATCH path=(n1:Place{id:"Doncaster"})-[*..]->(n2:Place{id:"Rotterdam"}) RETURN path;''')

#record a list of all paths
all_paths = [rec for rec in results]
print("total paths are: ", len(all_paths))

# get id pairs for all paths
for rec in all_paths:
    rec_length = len(rec['path'].nodes)
    for ids in range(rec_length):
        if ids < rec_length - 1:
            print(rec['path'].nodes[ids]['id'] + "|" + rec['path'].nodes[ids+1]['id'])