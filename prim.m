function [T, mincost] = prim(X)
    % Replace NaN with Inf to avoid indexing issues
    X(isnan(X)) = Inf;
    
    T = [];
    Next = inf(1, length(X));
    
    [~, ind] = min(X(1, :)); % Finding the minimum cost edge to vertex 1 (the first edge)
    mincost = X(1, ind); % Initialize mincost
    T = [1, ind]; % Adding to the tree
    
    for i = 1:length(X)
        if X(i, 1) > X(i, ind) && i ~= ind
            Next(i) = ind;
        else
            Next(i) = 1;
        end
    end
    
    Next(1) = -1; % Set Next(1) as -1 to indicate it's in the tree
    Next(ind) = -1;
    
    for i = 2:length(X) % Finding i^th edge
        temp = ones(1, length(X)) * inf; % Stores X(j, Next(j))
        
        for j = 1:length(X) % Greedy search all vertices
            if Next(j) ~= -1
                temp(j) = X(j, Next(j));
            end
        end
        
        [~, ind] = min(temp); % Finding the minimum cost edge to vertex j
        mincost = mincost + temp(ind);
        
        if ind ~= Next(ind) && X(ind, Next(ind)) ~= 0
            T = [T; ind, Next(ind)]; % Add edges only if they connect different nodes
        end
        
        Next(ind) = -1; % Mark the node as included in the tree
        
        for k = 1:length(X)
            if Next(k) ~= -1 && X(k, Next(k)) > X(k, ind)
                Next(k) = ind;
            end
        end
    end
    
    % Display the MST
    disp('Minimum Spanning Tree (MST):');
    disp(T);
    disp(['Total cost: ', num2str(mincost)]);
    
    % Plot the MST with node labels A-G
    figure;
    G = graph();
    for i = 1:size(T, 1)
        G = addedge(G, T(i, 1), T(i, 2), X(T(i, 1), T(i, 2)));
    end
    
    h = plot(G, 'EdgeLabel', G.Edges.Weight);
    title('Minimum Spanning Tree');
    % Label the nodes A-G
    labelNames = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};
    labelnode(h, 1:length(labelNames), labelNames);
end
