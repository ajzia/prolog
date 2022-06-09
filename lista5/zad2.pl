:- [zad2_squares].

% ============= QUEENS ============= %
queens(N, P) :-
  numlist(1, N, L),
  permutation(L, P),
  good(P).

good(X) :-
  \+ bad(X).

bad(X) :-
  append(_, [H1 | L1], X),
  append(L2, [H2 | _], L1),
  length(L2, K),
  abs(H1 - H2) =:= K + 1.
% ============= QUEENS ============= %

% =========== CHESSBOARD =========== %
print_row(0) :- 
  write("+\n"), !.

print_row(N) :-
  write("+-----"),
  N1 is N - 1,
  print_row(N1).
%

print_board(_, N, 0, _) :- 
  print_row(N), !.

print_board(L, N, C, X) :-
  print_row(N),
  N1 is N - C + 1,
  indices(L, N1, I),
  print_column(I, N, X),
  (X == 0 -> X1 is 1; X1 is 0),
  C1 is C - 1,
  print_board(L, N, C1, X1).

indices(L, X, I) :-
  findall(N, nth1(N, L, X), I).

% with good permutation of queens
board(N) :-
  queens(N, L1),
  print_board(L1, N, N, 0).

% with chosen placement of queen (given by the user, every element has to be in [1, ..., N] in order to be seen of the chessboard)
board_random(L) :-
  length(L, N),
  print_board(L, N, N, 0).