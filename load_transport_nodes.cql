WITH "file:///var/lib/neo4j/import/" AS base
WITH base + "transport-nodes.csv" AS file
LOAD CSV WITH HEADERS FROM file AS row
MERGE (place:Place {id:row.id})
SET place.latitude = toFloat(row.latitude),
    place.longitude = toFloat(row.longitude),
    place.population = toInteger(row.population);



