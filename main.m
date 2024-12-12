%main function
function main();
    
    [A, B] = CourseWorkTask_Updated();
    

    %replace NaN values with zeros
    A(isnan(A)) = 0;
    
    % Define node names
    nodeNames = {'A', 'B', 'C', 'D', 'E', 'F'};
    
    % Create table for node names
    nodeTable = table(nodeNames','VariableNames',{'Name'});
    
    
    %Create directed graph
    G = digraph(A);
    G.Nodes = nodeTable;
    %PLot directed graph, with labels
    h = plot(G);
    labelnode(h, 1:numnodes(G), G.Nodes.Name);
    labeledge(h, G.Edges.EndNodes(:,1),G.Edges.EndNodes(:,2), G.Edges.Weight);
    
    %running dijkstras_algorithm
    dijkstras_algorithm(A, 1);

    %find shortest paths from node 1
    shortestPaths(A, 1);

    %need to add B into adjacent matrix 
    %will do this by inserting a collumn then a row into the matrix
    %making collumn to enter
    new_col = sparse([0;0;0;0;0;0]);
    %get number of rows and columns in A
    [num_rows, num_cols] = size(A);
    %create space for adding new column
    A = [A, spalloc(num_rows, 1, 0)];
    %add new collumn
    A(:, end) = new_col;
    %now will add a new row, which is G
    new_row = sparse([6, 1, 29, 1, 8, 17, 0]);
    %need to add a zero on the end
    %calculate number of rows and collumns
    [num_rows, num_cols] = size(A);
    %Create space for new row
    A = [A; spalloc(1, num_cols, 0)]
    %add new row
    A(end, :) = new_row;

    %now need to do dijkstras again for new matrix
    %can do this by labelling the new edge and node
    %define new node names
    nodeNames = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};
    % Create new table for node names
    nodeTable = table(nodeNames','VariableNames',{'Name'});
    %Create directed graph
    G = digraph(A);
    G.Nodes = nodeTable;
    %Plot directed graph, with labels
    h = plot(G);
    labelnode(h, 1:numnodes(G), G.Nodes.Name);
    labeledge(h, G.Edges.EndNodes(:,1),G.Edges.EndNodes(:,2), G.Edges.Weight);
    %find shortest paths from node 1
    shortestPaths(A, 7);

    disp(full(A));
end
    
    




