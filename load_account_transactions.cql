WITH "file:///transactions" AS file
LOAD CSV WITH HEADERS FROM file AS row
MATCH (src:Account {id: row.src})
MATCH (dst:Account {id: row.dst})
MERGE (src)-[:TRANSFERS_TO {amount: toFloat(row.settled_amount)}]->(dst);
