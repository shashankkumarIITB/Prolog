%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P1: Last element of the list 
lastElement(K, [K]).
lastElement(K, [_ | L]) :- lastElement(K, L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P2: Last but one element of the list
secondLastElement(K, [K, _]).
secondLastElement(K, [_, A | L]) :- secondLastElement(K, [A | L]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P3: Kth element of the list
element_at(K, [K | _], 0).
element_at(K, [_ | L], N) :- element_at(K, L, N1), N is N1 + 1.

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
compressHelper([A | L], X, K) :- A = K -> compressHelper(L, X, K) ; compressHelper(L, X1, A), append([A], X1, X). 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P9: Pack consecutive duplicates into a list
pack([], []).
pack([A | L], X) :- packHelper(L, X, [A], A).
packHelper([], [], [], _).
packHelper([], [X], X, K).
packHelper([A | L], X, X1, K) :- A = K -> packHelper(L, X, X2, K), append([A], X1, X2) ; packHelper(L, X2, [A], A), append([X1], X2, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P10: Run-length encoding of a list
encode([], []).
encode([A | L], X) :- encodeHelper(L, X, 1, A).
encodeHelper([], [[N,A]], N, A).
encodeHelper([A | L], X, N, K) :- A = K -> N1 is N + 1, encodeHelper(L, X, N1, K) ; encodeHelper(L, X1, 1, A), append([[N, K]], X1, X).  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P11: Modified run-length encoding of a list
encode_modified([], []).
encode_modified([A | L], X) :- 



