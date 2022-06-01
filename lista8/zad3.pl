:- use_module(library(clpfd)).

%   compiling:  |   usage:
%   ?- [zad3].  |   ?- interval(L), label(L), writeln(L), fail.

% ?- interval(L), label(L), writeln(L), fail.
% [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1]
% [0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0]
% [0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0]
% [0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0]
% [0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0]
% [0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0]
% [0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0]
% [0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0]
% [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0]
% false.

interval(List) :-
  length(List, 16), % (length(List, X), X #= 16)
  List ins 0..1, % domain 0..1
  sum(List, #=, 8), % sum of elements on list #' 8'
  length(X, 8), % (length(X, Y), Y #= 8)
  append(X, Y, List),
  chain(X, #=<), % linear?
  chain(Y, #>=). % linear?
