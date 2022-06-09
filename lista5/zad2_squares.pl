% ===================  SZACHOWNICA =================== %
print_end_column() :-
  write("|\n"), !.

print_column(I, N, X) :-
  (X == 0 ->
    (print_white_column(I, 0, N), print_end_column(),
    print_white_column(I, 0, N), print_end_column());

    (print_black_column(I, 0, N), print_end_column(),
    print_black_column(I, 0, N), print_end_column())
  ).

print_white_column(_, N, N) :- !.
print_white_column(I, X, N) :-
  X1 is X + 1,
  (member(X1, I) -> write("| ### "); write("|     ")),
  print_black_column(I, X1, N).

print_black_column(_, N, N) :- !.
print_black_column(I, X, N) :-
  X1 is X + 1,
  (member(X1, I) -> write("|:###:") ; write("|:::::")),
  print_white_column(I, X1, N).

/* black / black with the queen:
+-----+ +-----+
|:::::| |:###:|
|:::::| |:###:|
+-----+ +-----+
  white / white with the queen
+-----+ +-----+
|     | | ### |
|     | | ### |
+-----+ +-----+
*/