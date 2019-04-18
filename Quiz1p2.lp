%% Name   : Shashank Kumar
%% RollNo : 170050031
%% I, hereby, declare that everything produced in this file is my own work.
%% This has not been copied from any other person, intentionally or otherwise.
%% I acknowledge the fact that a case of plagiarism can result in severe disciplinary
%% action against me by the institute.

%% Generating a Langford sequence

#const n = 4.  % pass n as command line argument...

val(1..n). % the numbers 1..n to place.

index(1..2*n). % the 2n positions in the sequence.

seq(I, J) :- index(I), val(J).
{subset(I, J)} :- seq(I,J).

% Number of elements should be 2*n in the subset
:- not 2*n = #count{I : subset(I,J)}.

% Every value occurs atmost 2 times
:- subset(I1, J), subset(I2, J), subset(I3, J), I1 != I2, I2 != I3, I1 != I3.

% No index can have two different values 
:- subset(I, J1), subset(I, J2), J1 != J2.

% Ensure that difference between the two occurances is J + 1
:- subset(I1, J), subset(I2, J), I1 != I2, |I2 - I1| != J + 1.

% Ensure that the first element is smaller than the last
% :- subset(1, J1), subset(2*n, J2), J1 < J2. 

#show subset/2.
