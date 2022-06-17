arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

path(X,Y,L) :-
    arc(X, Z),
    \+ member(Z, L),
    (Y = Z; path(Z,Y,[Z|L])).

osiagalny(X,X).
osiagalny(X,Y) :-
    path(X,Y,[]).
