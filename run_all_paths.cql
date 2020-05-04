MATCH path=(n1:Place{id:"Doncaster"})-[*..]->(n2:Place{id:"Rotterdam"})
RETURN path;
