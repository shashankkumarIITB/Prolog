%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Name:        Shashank Kumar
%% Roll Number: 170050031
%% Date:		April 14, 2019
%% I, hereby, declare that this assignment is my own work and has not been copied from any other person's work (published or unpublished).
%% I have not provided this assignment to anyone (intentionally) who can potentially use it as his/her own with respect to the concerned course. 
%% I understand that the Institute may take disciplinary action against me if there is a belief that this is not my own work.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% p3.lp  to check if we can make m marks on a ruler of length n.

order(m). % number of marks to make is m.

pos(0..n). % length of ruler is n. n+1 markable positions 0..n

used(0).  % first mark is at 0.

{used(N)} :- pos(N). % mark some subset of positions.

:- not m = #count{N:used(N)}.  % use only models with exactly m marks.

%% add your code here ....

% Check if measurement of length L is possible
% Measure between two marked positions and record it in the measure set
{measure(L)} :- used(X), used(Y), X!=Y, |X-Y|=L.
% Measure between the last position and one of the marked positions
{measure(L)} :- used(X), |n-X|=L.
% Remove all those models where all n measurements are not possible using the marked positions
:- not n = #count{L:measure(L)}.

%% do not change anything below this line

#show used/1.
