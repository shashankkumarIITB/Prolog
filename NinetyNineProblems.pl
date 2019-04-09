%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P1: Last element of the list 
lastElement(K, [K]).
lastElement(K, [_ | L]) :- lastElement(K, L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P2: Last but one element of the list
secondLastElement(K, [K, _]).
secondLastElement(K, [_, A | L]) :- secondLastElement(K, [A | L]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P3: Kth element of the list (index starts from 1)
element_at(K, [K | _], 1).
element_at(X, [_ | L], N) :- element_at(X, L, N1), N is N1 + 1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P4: Find length of the list
lengthList(0, []).
lengthList(N, [_ | L]) :- lengthList(N1, L), N is N1 + 1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P5: Reverse the list
reverseList(A, B) :- reverseListHelper(A, B, []).
reverseListHelper(A, [], A).
reverseListHelper(A, [B | L], K) :- reverseListHelper(A, L, [B | K]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P6: Check if the list is palindrome
isPalindrome(L) :- isPalindromeHelper(L, [], L).
isPalindromeHelper([], L, L).
isPalindromeHelper([A | L], L1, L2) :- isPalindromeHelper(L, [A | L1], L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P7: Flatten the list
flattenList([], []).
flattenList([A | L], X) :- is_list(A) -> flattenList(A, X1), flattenList(L, X2), append(X1, X2, X) ; flattenList(L, X1), append([A], X1, X). 

% Append two lists
appendList([], Y, Y).
appendList(X, [], X).
appendList(X, Y, Z) :- reverseList(X1, X), appendListHelper(X1, Y, Z).
appendListHelper([], Y, Y).
appendListHelper([A | X], Y, Z) :- appendListHelper(X, [A | Y], Z).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P8: Eliminate consecutive duplicates
compress([], []).
compress([A | L], X) :- compressHelper(L, X1, A), append([A], X1, X).
compressHelper([], [], _).
compressHelper([A | L], X, K) :- A =:= K -> compressHelper(L, X, K) ; compressHelper(L, X1, A), append([A], X1, X). 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P9: Pack consecutive duplicates into a list
pack([], []).
pack([A | L], X) :- packHelper(L, X, [A], A).
packHelper([], [], [], _).
packHelper([], [X], X, _).
packHelper([A | L], X, X1, K) :- A =:= K -> packHelper(L, X, X2, K), append([A], X1, X2) ; packHelper(L, X2, [A], A), append([X1], X2, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P10: Run-length encoding of a list
encode([], []).
encode([A | L], X) :- encodeHelper(L, X, 1, A).
encodeHelper([], [[N,A]], N, A).
encodeHelper([A | L], X, N, K) :- A =:= K -> N1 is N + 1, encodeHelper(L, X, N1, K) ; encodeHelper(L, X1, 1, A), append([[N, K]], X1, X).  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P11: Modified run-length encoding of a list
encode_modified([], []).
encode_modified([A | L], X) :- encode_modifiedHelper(L, X, 1, A).
encode_modifiedHelper([], [A], 1, A).
encode_modifiedHelper([], [[N,A]], N, A) :- N > 1.
encode_modifiedHelper([A | L], X, N, K) :- A =:= K -> N1 is N + 1, encode_modifiedHelper(L, X, N1, K) ; encode_modifiedHelper(L, X1, 1, A), encode_modifiedAppend(X, X1, N, K).
encode_modifiedAppend(X, X1, N, K) :- N > 1 -> append([[N,K]], X1, X) ; append([K], X1, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P12: Decoding run-length modified encoding of a list
decode([],[]).
decode([A | L], X) :- is_list(A) -> decode(L, X1), decodeAppend(A, X1, X) ; decode(L, X1), append([A], X1, X).
decodeAppend([N | K], X1, X) :- decodeAppendHelper(N, K, X1, X).
decodeAppendHelper(0, _, X, X).
decodeAppendHelper(N, K, X1, X) :- N1 is N - 1, append(K, X1, X2), decodeAppendHelper(N1, K, X2, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P13: Direct modified encoding run-length encoding of a list
% Already implemented in P11
encode_direct(L, X) :- encode_modified(L, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P14: Duplicate elements of a list
dupli([], []).
dupli([A | L], X) :- dupli(L, X1), append([A, A], X1, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P15: Duplicate elements for a given numberof times of a list
dupli([], _, []).
dupli([A | L], N, X) :- dupli(L, N, X1), dupliAppend(N, A, X1, X).
dupliAppend(0, _, X, X).
dupliAppend(N, K, X1, X) :- N1 is N - 1, append([K], X1, X2), dupliAppend(N1, K, X2, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P16: Drop every Nth element from the list
drop([], _, []).
drop(L, N, X) :- dropHelper(L, N, N, X).
dropHelper([], _, _, []).
dropHelper([A | L], K, N, X) :- N =:= 1 -> dropHelper(L, K, K, X) ; N1 is N - 1, dropHelper(L, K, N1, X1), append([A], X1, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P17: Split a given list
split([], _, [], []).
split(L, 0, [], L).
split([A | L], N, X1, X2) :- N1 is N - 1, split(L, N1, X3, X2), !, append([A], X3, X1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P18: Slice a list between the given indices (index starts from 1)
slice([], _, _, []).
slice(_, I, K, []) :- I > K.
slice([A | L], I, K, X) :- I =:= 1 -> (K \= 0 -> K1 is K - 1, slice(L, I, K1, X1), !, append([A], X1, X) ; true) ; I1 is I - 1, K1 is K - 1, slice(L, I1, K1, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P19: Rotate a list N places to the left
rotate([], _, []).
rotate(L, N, L) :- N = 0 ; N > 0, length(L, N).
rotate(L, N, X) :- N > 0 -> split(L, N, X1, X2), append(X2, X1, X) ; length(L, K), N1 is K + N, rotate(L, N1, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P20: Remove the Kth element from the list (index starts from 1)
remove_at([], _, []).
remove_at(L, 0, L) :- !.
remove_at([A | L], K, X) :- K =:= 1 -> remove_at(L, 0, X) ; K1 is K - 1, remove_at(L, K1, X1), append([A], X1, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P21: Insert en element at the Kth position in the list (index starts from 1)
insert_at(_, L, 0, L) :- !.
insert_at(E, [A | L], K, X) :- K =:= 1 -> insert_at(E, L, 0, X1), append([A], X1, X2), append([E], X2, X) ; K1 is K - 1, insert_at(E, L, K1, X1), append([A], X1, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P22: Create a list with the given range
range(I, K, []) :- I > K.
range(I, I, [I]) :- !.
range(I, K, X) :- I1 is I + 1, range(I1, K, X1), append([I], X1, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P23: Create a randomly generated list of the specified size
rnd_select([], _, []).
rnd_select(_, 0, []) :- !.
rnd_select(L, N, X) :- length(L, Len), Len1 is Len + 1, random(1, Len1, K), element_at(E, L, K), N1 is N - 1, rnd_select(L, N1, X1), append([E], X1, X).

