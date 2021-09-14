function DFS_Maze (maze)
% This function uses depth-first traversal (backtracking) to solve all the paths of the maze
% maze: is a maze matrix, where 0 indicates the way to go
% 1 indicates an obstacle
% 2 means entrance
% 3 represents the path
% 5 indicates the path
% 0 2 0 0 1
% 0 1 1 0 1
% 0 1 3 0 1
% 0 1 0 0 1

% copyright: qbb 2013-3-12
if nargin == 0
    maze = [0 2 0 0 1
        0 1 1 0 1
        0 1 3 0 1
        0 1 0 0 1];
end
% Define four directions
directions = kron (eye (2), [-1,1]);
% Number of paths
sol = 0;
[I, J] = find (maze == 2);% find the starting point
search (I, J);
disp (sol);
% This function determines whether the point can pass
    function z = cango (x, y)
        % Use try to determine the boundary
        z = true;
        try
            if ismember (maze (x, y), [1,2,5])% barricade
                z = false;
            end
        catch
            z = false;% boundary
        end
    end
    function search (x, y)
        if maze (x, y) == 3% find the exit
            disp (maze);% print path
            sol = sol + 1;% the number of solutions increases
            return% return
        end
        % Search 4 directions
        for i = 1: 4
            if cango (x + directions (1, i), y + directions (2, i))% if can go
                if maze (x + directions (1, i), y + directions (2, i)) ~= 3
                    maze (x + directions (1, i), y + directions (2, i)) = 5;% record
                end
                search (x + directions (1, i), y + directions (2, i));% continue to find the next point
                if maze (x + directions (1, i), y + directions (2, i)) ~= 3
                    maze (x + directions (1, i), y + directions (2, i)) = 0;% Back to this node, continue to find the next direction
                end
            end
        end
    end
end

