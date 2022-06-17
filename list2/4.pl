lista(N,X) :- 
    N2 is N * 2,
    length(X,N2),        
    numlist(1, N, Elements),
    every_number(Elements, X).
    % check_indexes(Elements, Elements, X).

every_number([], _).
every_number([X|T], L) :-
    first_element(X, L, L1),
    even_distance(X, L1),
    every_number(T, L).

first_element(H, [H|T], T) :- !.
first_element(H, [_|T], L) :-
    first_element(H, T, L).

even_distance(X, L) :-
    nth0(I1, L, X),
    0 is I1 mod 2.
