greater([], 0).
greater([H|T], N) :-
	count(T, H, S),
	greater(T, N1),
	N is N1+S.

count([], _, 0).
count([H|T], X, S) :-
	count(T, X, S1),
	(X > H -> (S is S1+1); S is S1).

even_permutation(Xs, Ys) :-
  permutation(Xs, Ys),
	greater(Ys, N),
	0 is N mod 2.
    
odd_permutation(Xs, Ys) :-
  permutation(Xs, Ys),
	greater(Ys, N),
	1 is N mod 2.
 