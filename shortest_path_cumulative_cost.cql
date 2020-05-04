MATCH (source:Place {id: "Amsterdam"}),
      (destination:Place {id:"London"})
CALL algo.shortestPath.stream(source, destination, null)
YIELD nodeId, cost;

WITH collect(algo.getNodeById(nodeId)) as path 
UNWIND range(0, size(path)-1) as index
WITH path[index] AS current, path[index + 1] AS next 
WITH current, next, [(current)-[r:EROAD]-(next) | r.distance][0] AS distance

WITH collect({current: current, next:next, distance: distance}) AS stops
UNWIND range(0, size(stops) - 1) AS index
WITH stops[index] AS location, stops, index
RETURN location.current.id AS place,
       reduce(acc=0.0,
	      distance in [stop in stops[0..index] | stop.distance] |
              acc + distance) as cost
