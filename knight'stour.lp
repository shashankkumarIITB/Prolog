%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Name:  Shashank Kumar
%% Email: shashankkumar.cse.iitb@gmail.com
%% Date:  April 14, 2019
%% I, hereby, declare that this assignment is my own work and has not been copied from any other person's work (published or unpublished).
%% I have not provided this assignment to anyone (intentionally) who can potentially use it as his/her own with respect to the concerned course. 
%% I understand that the Institute may take disciplinary action against me if there is a belief that this is not my own work.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Knight's Tour problem

% Create a nxn chess board
#const n=8.
board(1..n, 1..n).

% Choose a starting position for the knight
start(1,1).

% Define moves for the knight
% delta(x,y) => move x units left and y units upward 
delta(X,Y) :- X=-2..2, Y=-2..2, X*Y=2.
delta(X,Y) :- X=-2..2, Y=-2..2, X*Y=-2.

% Define valid moves for the knight
% Move from (X,Y) to (X1,Y1)
move(X,Y,X1,Y1) :- board(X,Y), board(X1,Y1), delta(|X1-X|,|Y1-Y|).

% Define the knight knight on the board
knight(X,Y) :- start(X,Y).
knight(X,Y) :- knight(X1,Y1), board(X,Y), move(X1,Y1,X,Y).


% Condition so that the knight doesn't move back to the initial postion before taking next step 

#show knight/2.
