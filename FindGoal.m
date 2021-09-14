function [ goalSt ] = FindGoal( userInput )
%FINDGOAL Find goal state
%   this function finds a goal state between 2 goal states.
%   Depending on the initial state there is only 1 possible goal state.
    
    % userInput = [0 8 7 ; 6 5 4 ; 3 2 1];
    % counting the board
    vectInput = reshape (userInput.', 1, 9);
    
    count=0;
    col = 1 ;
    for col = 1:8
        test =  vectInput(col) ;
        colCount = col+1;
        while colCount <= 9
            if vectInput(colCount) > 0 % zero não conta
                if test > vectInput (colCount)
                    count = count+1;
                end
            end
            colCount= colCount+1;
        end
    end      
    
    % the matrix is odd or even ?
    if mod(count,2)
        goalSt = [1 2 3; 8 0 4; 7 6 5]; %1 odd
    else
        goalSt = [0 1 2; 3 4 5; 6 7 8]; %0 even
    end
end

