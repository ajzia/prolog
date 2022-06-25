:- use_module(library(bounds)).

valid(L) :- 
  L in 1..4, 
  all_different(L).

sudoku_with_constraints([[X11,X12,X13,X14], [X21,X22,X23,X24], 
  [X31,X32,X33,X34], [X41,X42,X43,X44]]) :-
  valid([X11,X12,X13,X14]), 
  valid([X21,X22,X23,X24]),
  valid([X31,X32,X33,X34]), 
  valid([X41,X42,X43,X44]),
  valid([X11,X21,X31,X41]), 
  valid([X12,X22,X32,X42]),
  valid([X13,X23,X33,X43]), 
  valid([X14,X24,X34,X44]),
  valid([X11,X12,X21,X22]), 
  valid([X13,X14,X23,X24]),
  valid([X31,X32,X41,X42]), 
  valid([X33,X34,X43,X44]),
  labeling([], [X11,X12,X13,X14,X21,X22,X23,X24,X31,X32,X33,X34,X41,X42,X43,X44]).

sudoku_without_constraints([[X11,X12,X13,X14], [X21,X22,X23,X24], [X31,X32,X33,X34], [X41,X42,X43,X44]]) :-
  Digits = [1,2,3,4],
  % rows
  permutation([X11,X12,X13,X14], Digits),
  permutation([X21,X22,X23,X24], Digits),
  permutation([X31,X32,X33,X34], Digits),
  permutation([X41,X42,X43,X44], Digits),
  % columns
  permutation([X11,X21,X31,X41], Digits),
  permutation([X12,X22,X32,X42], Digits),
  permutation([X13,X23,X33,X43], Digits),
  permutation([X14,X24,X34,X44], Digits),
  % squares
  permutation([X11,X12,X21,X22], Digits),
  permutation([X13,X14,X23,X24], Digits),
  permutation([X31,X32,X41,X42], Digits),
  permutation([X33,X34,X43,X44], Digits).
