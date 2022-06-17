:- [constants].

przyporzadkuj([], Y, Y). % pusta lista odczytu

przyporzadkuj([H|T], X, Y) :-  % H jest kluczem
  key(H),
  !,
  append(X, [key(H)], Y1),
  przyporzadkuj(T, Y1, Y).

przyporzadkuj([H|T], X, Y) :-  % H jest separatorem
  sep(H),
  !,
  append(X, [sep(H)], Y1),
  przyporzadkuj(T, Y1, Y).

przyporzadkuj([H|T], X, Y) :-  % H jest liczba 
  atom_number(H, N),
  !,
  append(X, [int(N)], Y1),
  przyporzadkuj(T, Y1, Y).

przyporzadkuj([H|T], X, Y) :-  % H jest uppercase 
  atom_chars(H, L),
  same_type(L, upper),
  !,
  append(X, [id(H)], Y1),
  przyporzadkuj(T, Y1, Y).

same_type([], _).
same_type([H|T], X) :-
  char_type(H, X), 
  same_type(T, X).