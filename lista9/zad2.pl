%   compiling:  |   usage:
%   ?- [zad2].  |   ?- squares[Sizes, Width, Height, Coords].
%               |   Sizes - list of wanted square sizes (their side lengths)
%               |   Width, Height - sizes of the rectangle in which the squares will be put in
%               |   Coords - list of coordinates of placed squares [x1, y1, x2, y2, ..., xn, yn],
%               |   where (x1, y1) are coords of left bottom corner of the 1st square on the Sizes list !

% ?- squares([1,1,1,1,2,2,2,2,3,3], 7, 6, X), write(X).
% [0,0,0,1,0,2,0,3,0,4,1,0,1,2,2,4,3,0,4,3]
% X = [0, 0, 0, 1, 0, 2, 0, 3, 0|...] .

% A small visualisation
% + - - - - - - - + 
% | # # % % ^ ^ ^ |
% | # # % % ^ ^ ^ |
% | ! * *   ^ ^ ^ |
% | @ * * = = =   |
% | & $ $ = = =   |
% | ? $ $ = = =   |
% + - - - - - - - + 

% ?- squares([2, 1, 1], 3, 2, X).
% X = [0, 0, 2, 0, 2, 1] ;
% X = [0, 0, 2, 1, 2, 0] ;
% X = [1, 0, 0, 0, 0, 1] ;
% X = [1, 0, 0, 1, 0, 0].

:- use_module(library(clpfd)).

fit_squares([],[],_,_,[]).
fit_squares([s(X, S, Y, S) | B], [S | T], W, H, [X, Y | C]) :-
  X1 #= W - S, 
  X in 0..X1,
  Y1 #= H - S, 
  Y in 0..Y1,
  fit_squares(B, T, W, H, C).

squares(Sizes, Width, Height, Coords) :-
  fit_squares(Squares, Sizes, Width, Height, Coords),
  disjoint2(Squares),
  label(Coords).
