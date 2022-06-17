%   compiling:  |   usage:
%   ?- [zad1].  |   ?- schedule(X, S, MS).
%               |   X - amount of time, S - list with starting moments of each task, MS - ending time of the last working task

% ?- schedule(20, S, MS).
% S = [4, 8, 0, 8, 0, 5, 0],
% MS = 11.

:- use_module(library(clpfd)).

resources(5, 5).

tasks([
%  D  R1 R2
  [2, 1, 3], 
  [3, 2, 1], 
  [4, 2, 2], 
  [3, 3, 2], 
  [3, 1, 1], 
  [3, 4, 2], 
  [5, 2, 1]]).

make_tasks([], _, [], [], _).
make_tasks([[D, R1, _] | T], H, [task(S, D, E, R1, _) | L1], [S | L2], MakeSpan) :-
  S in 0..H,
  E #= S + D, MakeSpan #>= E,
  make_tasks(T, H, L1, L2, MakeSpan).

make_tasks2([], _, [], [], _).
make_tasks2([[D, _, R2] | T], H, [task(S, D, E, R2, _) | L1], [S | L2], MakeSpan) :-
  S in 0..H,
  E #= S + D, MakeSpan #>= E,
  make_tasks2(T, H, L1, L2, MakeSpan).

schedule(Horizon, Starts, MakeSpan) :-
  tasks(Tasks),
  resources(Limit1, Limit2),
  MakeSpan in 0..Horizon,
  make_tasks(Tasks, Horizon, T1, Starts, MakeSpan),
  make_tasks2(Tasks, Horizon, T2, Starts, MakeSpan),
  cumulative(T1, [limit(Limit1)]),
  cumulative(T2, [limit(Limit2)]),
  once(labeling([min(MakeSpan), ff], [MakeSpan | Starts])).
