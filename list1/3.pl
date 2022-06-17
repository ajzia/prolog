prime(LO, HI, N) :-
    between(LO, HI, N),
    prime_num(N).

prime_num(2).
prime_num(3).
prime_num(X) :-
    X > 3,
    \+ 0 is X mod 2,
    \+ div(X, 3).

div(X, Y) :-
    Y * Y =< X,
    (0 is X mod Y; 
    Z is Y+2,
    div(X, Z)).