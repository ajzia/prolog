wyrazenie([X], X, X).
wyrazenie(Lista, X, Wyrazenie) :-
  append([H1|T1], [H2|T2], Lista),
  wyrazenie([H1|T1], Y1, Y1),
  wyrazenie([H2|T2], Y2, Y2),

  zrob_wyrazenie(Wyrazenie, Y1, Y2),

  (X = Wyrazenie ; X is Wyrazenie).

zrob_wyrazenie(Wyrazenie, X, Y) :-
  member(Wyrazenie, [X+Y, X-Y, X*Y]);
  (\+ Y == 0, Wyrazenie = (X/Y)).
