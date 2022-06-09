%   compiling:  |   usage:
%   ?- [zad2].  |   ?- backpack(Values, Weights, Capacity, Vars).
%               |   ! Values and Weights have to have the same length. !

% ?- backpack([10,7,1,3,2],[9,12,2,7,5],15,X).
% X = [1, 0, 0, 0, 1].
%
% ?- backpack([6,5,4,3,2,1],[6,1,5,2,4,3],10,X).
% X = [1, 1, 0, 1, 0, 0].
%
% ?- backpack([15,30,18,9,2,8,9,5,17],[9,6,11,8,19,20,12,7,5],50,X).
% X = [1, 1, 1, 0, 0, 0, 1, 1, 1].

:- use_module(library(clpfd)).

backpack(Values, Weights, Capacity, Vars) :-
  length(Values, L),
  length(Weights, L),
  length(Vars, L),
  scalar_product(Values, Vars, #= , Goal),  % scalar product, Values[1] * Vars[1] + ... + Values[n] * Vars[n] #= Goal (which is maximalized by using max(Obj))
  scalar_product(Weights, Vars, #=<, Capacity),
  Vars ins 0..1,
  once(labeling([max(Goal)], Vars)).
