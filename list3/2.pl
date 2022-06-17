max_sum([], 0).
max_sum(L, X) :-
	max_sum(L, 0, 0, X).

max_sum([], _, X, X).
max_sum([H|T], C, B, X) :-
	(C+H > 0 -> Y is C+H; Y is 0),
	(Y > B -> B1 is Y; B1 is B),
	max_sum(T, Y, B1, X).
