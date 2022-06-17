jednokrotnie(X,L) :-
   select(X, L, L2),
   \+ member(X, L2).
 
dwukrotnie(X,L) :-
    distinct(dwa(X,L)).
 
dwa(X,L) :-
    select(X, L, L2),
    jednokrotnie(X,L2).
