WITH "file:///account_nodes.csv" AS base
LOAD CSV WITH HEADERS FROM file AS row
MERGE (acc:Account {id:row.account_id})
SET acc.name = row.name,
    acc.bank = row.bank