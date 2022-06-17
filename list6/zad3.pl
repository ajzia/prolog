% zad 3, lista 6
% phrase(ab,X), format("~s~n", [X]).
ab --> [].
ab --> [a], ab, [b].

% phrase(ab,X), format("~s~n", [X]).
c(0) --> [].
c(X) -->  [c], {X = X1 + 1}, c(X1).

ab(0) --> [].
ab(X) --> [a], {X = X1 + 1}, ab(X1), [b].
abc --> ab(X), c(X).

% phrase(abfib,X), format("~s~n", [X]).
% Napisz gramatykę metamorficzne akceptujące słowa z języka anbfib(n)
abfib --> [].
abfib --> {num(X), fib(X, Y)}, a(X), b(Y).

a(0) --> !, [].
a(X) -->  [a], {X1 is X - 1}, a(X1).

b(0) --> !, [].
b(X) -->  [b], {X1 is X - 1}, b(X1).

num(0).
num(X) :-
  num(X1),
  X is X1 + 1.

fib(0, 0) :- !.
fib(1, 1) :- !.
fib(X, Y) :-
  X1 is X-1,
  X2 is X-2,
  fib(X1, F1),
  fib(X2, F2),
  Y is F1 + F2.
