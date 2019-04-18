%% Name   : Shashank Kumar
%% RollNo : 170050031
%% I, hereby, declare that everything produced in this file is my own work.
%% This has not been copied from any other person, intentionally or otherwise.
%% I acknowledge the fact that a case of plagiarism can result in severe disciplinary
%% action against me by the institute.


%% Check if all the rows have the same sum
allRowsSameSum([], 0) :- !.
allRowsSameSum(M, S) :- allRowsSameSum_helper(M, S, _).
allRowsSameSum_helper([], N, N) :- !.
allRowsSameSum_helper([A | M], S, N) :- sumlist(A, N), allRowsSameSum_helper(M, S, N).

%% Check if all the columns have the same sum
allColsSameSum([A], N) :- everyElement(A, N), !.
allColsSameSum(M, S) :- allColsSameSum_helper(M, L), everyElement(L, S).
allColsSameSum_helper([L | []], L) :- !.
allColsSameSum_helper([A | M], L) :- allColsSameSum_helper(M, L1), maplist(plus, A, L1, L).

%% Check if every element of the list is same
everyElement([E], E) :- !.
everyElement([E | L], E) :- everyElement(L, E).

%% Get the diagonals of the given matrix
getDiagonals([A], A, A) :- !.
getDiagonals([A | M], L, R) :- length(A, Len), getDiagonals_helper([A | M], L, R, 1, Len).
getDiagonals_helper([], [], [], _, _) :- !.
getDiagonals_helper([A | M], L, R, CL, CR) :- C1 is CL + 1, C2 is CR - 1, getDiagonals_helper(M, L1, R1, C1, C2),
											elementAt(A, CL, XL), elementAt(A, CR, XR),
											append([XL], L1, L), append([XR], R1, R).

%% Get the element at the Kth index
elementAt([A | _], 1, A) :- !.
elementAt([_ | L], K, X) :- K > 1, K1 is K - 1, elementAt(L, K1, X).

%% Check if the given matrix is a magic square
checkMagic([A], A) :- !.
checkMagic(M, S) :- allRowsSameSum(M, S), allColsSameSum(M, S), getDiagonals(M, L, R),
					sumlist(L, S), sumlist(R, S).
