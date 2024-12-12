function [shortest_path, distances, timeSpent] = dijkstras_algorithm(adj_matrix, source_node)
    % Initialize: set starting distance to 0, set distances to all other nodes to infinity
    timespent_temp = 0;
    timeSpent = zeros(1, size(adj_matrix, 1)); % Initialize timeSpent as an array
    num_nodes = size(adj_matrix, 1); % Calculates number of nodes in the graph
    distances = inf(1, num_nodes); % Initialize all distances to infinity
    distances(source_node) = 0; % Distance to source node is 0
    visited = false(1, num_nodes); % Track visited nodes
    previous = zeros(1, num_nodes); % Track previous node for each node

    % Main loop
    for i = 1:num_nodes
        % Need to find nearest unvisited node with shortest distance
        [min_distance, min_node_index] = min(distances(~visited));

        % Check if any unvisited nodes remain
        unvisited_index = find(~visited, 1, 'first');
        if isempty(unvisited_index)
            break; % All nodes are visited, exit the loop
        end

        % Correctly calculate min_node
        min_node = unvisited_index + min_node_index - 1; 

        % Update current node
        visited(min_node) = true; % Mark node as visited

        % Update distances to neighbors that haven't been visited
        for j = 1:size(adj_matrix, 2) % Use size(adj_matrix, 2) to get the number of columns
            if adj_matrix(min_node, j) > 0 && ~visited(j)
                new_distance = distances(min_node) + adj_matrix(min_node, j);
                if new_distance < distances(j)
                    distances(j) = new_distance;
                    previous(j) = min_node; % Update previous
                end
            end
        end
    end

    % Construct shortest paths from the predecessor
    shortest_path = cell(1, num_nodes);
    for i = 1:num_nodes
        if i ~= source_node
            current_node = i;
            path = {current_node};
            while previous(current_node) ~= 0
                % Calculate time spent based on the distance to the previous node
                distance_to_previous = adj_matrix(previous(current_node), current_node);
                timeSpent(i) = timeSpent(i) + timeSpent_func(distance_to_previous);
                current_node = previous(current_node);
                path = [path, {current_node}];
            end
            shortest_path{i} = fliplr(path);
        end
    end
end
