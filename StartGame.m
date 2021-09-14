function [] = StartGame( )
%STARTGAME Game start
%   Solves the puzzle 8 game using AI techniques : A*
	clear all
    clc
	
    userInput = input('Insert matrix [3x3] to be solved: ');
    tamanho = size(userInput);
    if not(all(tamanho == [3 3]))
        msgbox('A matriz deve ser 3x3 !');

    elseif sum(sum(userInput))~=36
        msgbox('A matriz deve conter os valores [ 1 2 3; 4 5 6; 7 8 0] !');
    else
        goalSt = FindGoal(userInput);
		SearchBestMove(userInput , goalSt);
	end
end