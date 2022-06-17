% var = (x1 - sr)^2 + (x2 - sr)^2 + ... / n-1
wariancja(L, D) :-
  srednia(L,X),
  suma2(L, X, S),
  length(L, Y),
  D is S / (Y - 1).

suma2([],_,0).
suma2([H|T], S, X) :-
  suma2(T, S, X1),
  X is X1 + ((H - S) ** 2).

srednia(L, X) :-
  suma(L, Y),
  length(L, Z),
  X is Y / Z.

suma([], 0).
suma([X|T], S) :-
  suma(T, S1),
  S is X + S1.