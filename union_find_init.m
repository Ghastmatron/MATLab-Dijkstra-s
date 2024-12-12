function uf = union_find_init(num_elements)
%each element needs to be made its own parent/root initially
uf.parent = 1:num_elements;
%will implement a rank of zero to keep the tree flat
uf.rank = zeros(1, num_elements);
end

function root = union_find_find(uf, x)
if uf.parent(x) ~= x
    %path unionising: update parent to be root of the set
end
root = uf.parent(x);
end

function uf union_find_union(uf, x, y)
rootX = union_find_find(uf, x);
rootY = union_find_find(uf, y);

if rootX ~= rootY
    %union by rank:attach smaller tree under root of bigger tree
    if uf.rank(rootX) > uf.rank(rootY)
        uf.parent(rootY) = rootX;
    elseif uf.rank(rootX) < uf.rank(rootY)
        uf.parent(rootX) = rootY;
    else
        uf.parent(rootY) = rootX;
        uf.rank(rootX) = uf.rank(rootX) + 1;
    end
end
end
