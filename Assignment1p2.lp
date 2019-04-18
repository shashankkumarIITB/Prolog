%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Name:        Shashank Kumar
%% Roll Number: 170050031
%% Date:		April 14, 2019
%% I, hereby, declare that this assignment is my own work and has not been copied from any other person's work (published or unpublished).
%% I have not provided this assignment to anyone (intentionally) who can potentially use it as his/her own with respect to the concerned course. 
%% I understand that the Institute may take disciplinary action against me if there is a belief that this is not my own work.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#const n=100.
#const diff=10.
% Define what numbers are composite in 1 to n
composite(N) :- N=1..n, I=2..N-1, N\I=0.
% Define primes using composite 
prime(N) :- N=2..n, not composite(N).
% Count the number of primes with the specified difference
pair(X,Y) :- X=2..n, Y=2..n, prime(X), prime(Y), Y-X=diff.
ans(N) :- N=#count{X,Y : pair(X,Y)}.
#show ans/1.
% Uncomment the below line to view all the pairs
% #show pair/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
