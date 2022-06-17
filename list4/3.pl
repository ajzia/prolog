% n choose k https://stackoverflow.com/a/33838722
choose(1, [H|_], [H]).
choose(N, [H|T1], [H|T2]) :- 
  N1 is N - 1,
  choose(N1, T1, T2).
choose(N, [_|T], L) :- 
  choose(N, T, L).

scal([], X, X).
scal([H|T], Temp, Result) :-
  union(H, Temp, Temp1),
  scal(T, Temp1, Result).

maly(0, []).
maly(X, L) :-
  M = [
    [1, 4, 5, 8], 
    [2, 5, 6, 9], 
    [3, 6, 7, 10], 
    [8, 11, 12, 15], 
    [9, 12, 13, 16], 
    [10, 13, 14, 17], 
    [15, 18, 19, 22], 
    [16, 19, 20, 23], 
    [17, 20, 21, 24]
  ],
  choose(X, M, L1),
  scal(L1, [], L).

sredni(0, []).
sredni(X, L) :-
  S = [
    [1, 2, 4, 6, 11, 13, 15, 16], 
    [2, 3, 5, 7, 12, 14, 16, 17], 
    [8, 9, 11, 13, 18, 20, 22, 23], 
    [9, 10, 12, 14, 19, 21, 23, 24]
  ],
  choose(X, S, L1),
  scal(L1, [], L).

duzy(0, []).
duzy(X, L) :-
  X ==1,
  L = [1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24].


ile_malych(L, C) :-
  M = [
    [1, 4, 5, 8], 
    [2, 5, 6, 9], 
    [3, 6, 7, 10], 
    [8, 11, 12, 15], 
    [9, 12, 13, 16], 
    [10, 13, 14, 17], 
    [15, 18, 19, 22], 
    [16, 19, 20, 23], 
    [17, 20, 21, 24]
  ],
  policz(L, M, 0, C).

ile_srednich(L, C) :-
  S = [
    [1, 2, 4, 6, 11, 13, 15, 16], 
    [2, 3, 5, 7, 12, 14, 16, 17], 
    [8, 9, 11, 13, 18, 20, 22, 23], 
    [9, 10, 12, 14, 19, 21, 23, 24]
  ],
  policz(L, S, 0, C).

ile_duzych(L, C) :-
  duzy(1, S),
  policz(L, [S], 0, C).

policz(_, [], C, C).
policz(L, [H|T], C, Result) :-
  intersection(H, L, H)
  -> (
    C1 is C + 1,
    policz(L, T, C1, Result)
  )
  ;
  policz(L, T, C, Result).
%

print_horizontal_edge(El, List) :-
  member(El, List) -> write("+---") ; write("+   ").
%
print_vertical_edge(El, List) :-
  member(El, List) -> write("|   ") ; write("    ").
%
print_matchsticks(List) :-
    print_matchsticks(1, 25, List, 3, 0, 1).
%
print_matchsticks(Count, Limit, List, Horizontal, Vertical, Orientation) :-
  \+ (Count = Limit)
  -> (
    1 is Orientation  
    -> (
        Horizontal > 0
        -> (
          Count1 is Count + 1, Horizontal1 is Horizontal - 1, print_horizontal_edge(Count, List), print_matchsticks(Count1, Limit, List, Horizontal1, Vertical, Orientation)
        )
        ; (
          write("+\n") , print_matchsticks(Count, Limit, List, 0, 4, 0)
        )
      )
    ; (
        Vertical > 0
        -> (
          Count1 is Count + 1, Vertical1 is Vertical - 1, print_vertical_edge(Count, List), print_matchsticks(Count1, Limit, List, Horizontal, Vertical1, Orientation)
        )
        ; (
          (write("    \n") , print_matchsticks(Count, Limit, List, 3, 0, 1))
        ) 
    )
  ); 
  write("+").


%
zapalki(K, D, S, M) :-
  % generowanie kwadratow
  duzy(D, Duze),
  sredni(S, Srednie),
  maly(M, Male),

  % laczenie kwadratow
  union(Srednie, Duze, Temp1),
  union(Male, Temp1, Temp2),
  length(Temp2, Len),
  K is 24 - Len,

  % sprawdzanie czy mamy dobre rozwiazanie
  ile_duzych(Temp2, D),
  ile_srednich(Temp2, S),
  ile_malych(Temp2, M),

  % printowanie
  write("Rozwiazanie:\n"),
  print_matchsticks(Temp2).
