%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Name:  Shashank Kumar
%% Email: shashankkumar.cse.iitb@gmail.com
%% Date:  April 14, 2019
%% I, hereby, declare that this assignment is my own work and has not been copied from any other person's work (published or unpublished).
%% I have not provided this assignment to anyone (intentionally) who can potentially use it as his/her own with respect to the concerned course. 
%% I understand that the Institute may take disciplinary action against me if there is a belief that this is not my own work.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% N-Queens problem
% Run the command in the same directory as the file:
% clingo 0 -c n=8 nqueens.lp
% 0 => All possible sollutions
% -c flag => To specify value of n

% Create a nxn chess board
#const n=8.
board(1..n, 1..n).

% Select a subset of positions from the chess board
{queen(X,Y)} :- board(X,Y).
% Number of queens = n
:- not n = #count{X,Y: queen(X,Y)}.
% Remove all the models where there are queens on the same column
:- queen(X,Y1), queen(X,Y2), Y1!=Y2.
% Remove all the models where there are queens on the same row
:- queen(X1,Y), queen(X2,Y), X1!=X2.
% Remove all the models that in which queens are there on the diagonal
:- queen(X1,Y1), queen(X2,Y2), X1!=X2, Y1!=Y2, |Y2-Y1|=|X2-X1|.

% Display the positions on which the queen is placed
#show queen/2.
