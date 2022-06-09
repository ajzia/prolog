%   compiling:  |   usage:
%   ?- [zad3].  |   ?- linear_interval(L), label(L), writeln(L), fail.
%               |   ?- interval(L), label(L), writeln(L), fail.

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

bound(L, M) :-
  L = [X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16],
  % implications expressed by inequalities (1 - X) * M >= Y, where M - maximum number of ones
  ((1-X1) * M #>= X9 + X10 + X11 + X12 + X13 + X14 + X15 + X16),
  ((1-X2) * M #>= X10 + X11 + X12 + X13 + X14 + X15 + X16),
  ((1-X3) * M #>= X11 + X12 + X13 + X14 + X15 + X16),
  ((1-X4) * M #>= X12 + X13 + X14 + X15 + X16),
  ((1-X5) * M #>= X13 + X14 + X15 + X16),
  ((1-X6) * M #>= X14 + X15 + X16),
  ((1-X7) * M #>= X15 + X16),
  ((1-X8) * M #>= X16).

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
