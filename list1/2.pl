on(1, 2).
on(2, 3).
on(3,5).
on(5,7).
on(1,8).

above(X, Y) :- on(X, Y).
above(X, Y) :- 
    on(X, Z),
    above(Z, Y).