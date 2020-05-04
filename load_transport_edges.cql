WITH "file:///" AS base
WITH base + "transport-relationships.csv" AS file
LOAD CSV WITH HEADERS FROM file AS row
MATCH (origin:Place {id: row.src})
MATCH (destination:Place {id: row.dst})
MERGE (origin)-[:EROAD {distance: toInteger(row.cost)}]->(destination);
