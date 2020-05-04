MATCH (source:Place {id: "Amsterdam"}),
      (destination:Place {id:"London"})
CALL algo.shortestPath.stream(source, destination, null)
YIELD nodeId, cost
RETURN nodeId, cost;
RETURN algo.getNodeById(nodeId).id AS place, cost


