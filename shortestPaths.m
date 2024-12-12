function [ShortestPath, ShortestDistance, timeSpent] = shortestPaths(adjacent_matrix, startingNode);
%get values
[ShortestPath, ShortestDistance, timeSpent] = dijkstras_algorithm(adjacent_matrix, startingNode);

%display shortest paths and distances
disp('shortest paths: ')
disp(ShortestPath)

disp('Shortest Distances: ')
disp(ShortestDistance)

disp('Shortest time: ')
disp(timeSpent)
