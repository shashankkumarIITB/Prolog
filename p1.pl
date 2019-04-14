%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Name:        Shashank Kumar
%% Roll Number: 170050031
%% Date:		April 14, 2019
%% I, hereby, declare that this assignment is my own work and has not been copied from any other person's work (published or unpublished).
%% I have not provided (intentionally or otherwise) this assignment to anyone who can potentially use it as his/her own with respect to the concerned course. 
%% I understand that the Institute may take disciplinary action against me if there is a belief that this is not my own work.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Cardinality N of a multiset M 
%% Cardinality of a null set is 0
crdnlty([], 0).
%% Maintain a list of distinct elements in M
%% The count of this list gives the cardinality of M
crdnlty(M, N) :- crdnlty_helper(M, [], N).
%% No need to backtrack after the base condition is met
crdnlty_helper([], _, 0) :- !.
%% If the element does not belong to the list, add it to the list then recurse on the remaining elements in the multiset
crdnlty_helper([A | M], L, N) :- member(A, L) -> crdnlty_helper(M, L, N) ; append([A], L, L1), crdnlty_helper(M, L1, N1), N is N1 + 1.

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Number N of elements in multiset M which occur more than K times
%% N is equal to zero for empty multiset
crdnltyHigh([], _, 0) :- !.
%% For K = 0, N = cardinality of M
crdnltyHigh(M, 0, N) :- crdnlty(M, N), !.
crdnltyHigh(M, K, N) :- crdnltyHigh_helper(M, K, N).
%% Similar to the base condition of crdnltyHigh function
crdnltyHigh_helper([], _, 0) :- !.
%% Recurse over the multiset M
%% Get the count and remove the occurrences of the element
%% Check if it's count is greater than the threshold count K 
crdnltyHigh_helper([A | M], K, N) :- count(A, [A | M], E), remove(A, M, M1), (E >= K -> crdnltyHigh_helper(M1, K, N1), N is N1 + 1 ; crdnltyHigh_helper(M1, K, N)). 
%% Helper function count that provides the count E of occurrences of element A in the list L
%% E is zero for en empty list irrespective of what A is
count(_, [], 0) :- !.
%% Recurse over the list L counting the number of occurrences of A
count(A, [B | L], E) :- A =:= B -> count(A, L, E1), E is E1 + 1 ; count(A, L, E). 
%% Helper function remove deletes the elements from the list M that match A and returns the new list
%% Return an empty list in response of an empty list as input
%% No need to backtrack once the base condition is met
remove(_, [], []) :- !.
%% Recurse over the list M and append the element to M1 is it is not equal to A
remove(A, [B | M], M1) :- A =:= B -> remove(A, M, M1) ; remove(A, M, M2), append([B], M2, M1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Return the number N1 of the maximum frequency N2 of the elements occuring in M
%% N1 = N2 = 0 for empty multiset
crdnltyMax([], 0, 0) :- !.
crdnltyMax(M, N1, N2) :- crdnltyMax_helper(M, N1, N2, 1).
%% Increment the count of K and check for crdnltyHigh as long as the answer is not 0
%% This will provide the highest cardinality N1 element and the it's count N2 can be found using crdnltyHigh function call
crdnltyMax_helper(M, N1, N2, K) :- crdnltyHigh(M, K, N3), (N3 =\= 0 -> K1 is K + 1, crdnltyMax_helper(M, N1, N2, K1) ; N2 is K - 1, crdnltyHigh(M, N2, N1)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
