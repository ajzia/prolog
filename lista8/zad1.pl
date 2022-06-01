%   compiling:  |   usage:
%   ?- [zad1].  |   ?- coloring(X), label(X).

% ?- coloring(X), label(X).
% X = [1, 2, 1, 3, 2, 3, 1, 2, 3] ;
% X = [1, 3, 1, 2, 3, 2, 1, 3, 2] ;
% X = [2, 1, 2, 3, 1, 3, 2, 1, 3] ;
% X = [2, 3, 2, 1, 3, 1, 2, 3, 1] ;
% X = [3, 1, 3, 2, 1, 2, 3, 1, 2] ;
% X = [3, 2, 3, 1, 2, 1, 3, 2, 1].

:- use_module(library(clpfd)).

coloring(X) :-
  X = [R1,R2,R3,R4,R5,R6,R7,R8,R9],
  X ins 1..3,
  R1 #\= R2, R1 #\= R4, R1 #\= R5, R1 #\= R6,
  R2 #\= R3, R2 #\= R4, R2 #\= R9,
  R3 #\= R4, R3 #\= R5, R3 #\= R9,
  R4 #\= R5,
  R5 #\= R6, R5 #\= R7, R5 #\= R9,
  R6 #\= R7, R6 #\= R8,
  R7 #\= R8, R7 #\= R9,
  R8 #\= R9.

% Map of region and its neighbours, then assign colors 