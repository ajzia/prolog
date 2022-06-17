in(i).
out(o).
next(n).
prev(p).

browse(Term) :-
  browse(Term, [], []).

browse(Parent, Left, Right) :-
  write(Parent),
  nl,
  write(Left),
  nl,
  write(Right),
  nl,
  write('command: '),
  nl,
  read(Move),
  (
    in(Move)
    -> (
      Parent =.. [_, Parent1 | Right1 ]
      -> (browse(Parent1, [], Right1))
      ; true
    )
    ; true
  ),
  (
    next(Move)
    -> (
      Right = [H|T]
      -> (
        Flag is 0,
        append([Parent], Left, Left2),
        browse(H, Left2, T)  
      )
      ; Flag is 1
    )
    ; Flag is 1
  ),
  (
    prev(Move)
    -> (
      Left = [H1|T1]
      -> (
        Flag1 is 0,
        append([Parent], Right, Right2),
        browse(H1, T1, Right2)  
      )
      ; Flag1 is 1
    )
    ; Flag1 is Flag
  ),
  (
    (out(Move) ; Flag1 = 0)
    -> true
    ; browse(Parent, Left, Right)
  ).