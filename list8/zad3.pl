%   compiling:  |   usage:
%   ?- [zad3].  |   ?- linear_interval(L), label(L), writeln(L), fail.
%               |   ?- interval(L), label(L), writeln(L), fail.

% Output for M #= 8 :
% ?- linear_interval(L), label(L), writeln(L), fail.
% [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1]
% [0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0]
% [0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0]
% [0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0]
% [0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0]
% [0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0]
% [0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0]
% [0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0]
% [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0]
% false. */

:- use_module(library(clpfd)).

sum_elements([], _, 0).
sum_elements([H|T], M, X) :-
  (
    M #= 0
    -> (
      X #= H + Y, 
      sum_elements(T, M, Y)
      ) ; (
        M #= M1 + 1,
        sum_elements(T, M1, X)
      )
  ).

bound([], _).
bound([H|T], M) :-
  sum_elements([H|T], M, X),
  (1 - H) * M #>= X,
  bound(T, M).

% implementation using linear bounds 
linear_interval(List) :-
  length(List, 16), 
  List ins 0..1, 
  M #= 8,
  sum(List, #=, M), 
  bound(List, M).

interval(List) :-
  length(List, 16), 
  List ins 0..1, 
  sum(List, #=, 8), 
  length(X, 8), 
  append(X, Y, List),
  chain(X, #=<),
  chain(Y, #>=).
