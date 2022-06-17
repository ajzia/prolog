left(Left, Right, [Left, Right | _]).
left(Left, Right, [_, R | T]) :-
  left(Left, Right, [R|T]).

next_to(X, Y, [X, Y | _]).  % x in on the left of y
next_to(X, Y, [Y, X | _]).  % x is on the right of y
next_to(X, Y, [_|T]) :-
  next_to(X, Y, T).

first(F, [F|_]).
middle(M, [_, _, M, _, _]).

rybki(Kto) :-
  Houses = [
    [_, _, _, _, _],  
    [_, _, _, _, _],
    [_, _, _, _, _],
    [_, _, _, _, _],
    [_, _, _, _, _]],

  % number, nationality, colour, drink, smoke, pet
  first([norweg, _, _, _, _], Houses), % 1st
  member([anglik, czerwony, _, _, _], Houses), % 2nd

  left([_, zielony, _, _, _], [_, bialy, _, _, _], Houses), % 3rd green <- white
  
  member([dunczyk, _, herbata, _, _], Houses), % 4th 

  next_to([_, _, _, light, _], [_, _, _, _, koty], Houses), % 5th

  member([_, zolty, _, cygara, _], Houses), % 6th
  member([niemiec, _, _, fajka, _], Houses), % 7th
  middle([_, _, mleko, _, _], Houses), % 8th

  next_to([_, _, _, light, _], [_, _, woda, _, _], Houses),  % 9th

  member([_, _, _, bez_filtra, ptaki], Houses), % 10th
  member([szwed, _, _, _, psy], Houses), % 11th

  next_to([norweg, _, _, _, _], [_, niebieski, _, _, _], Houses), % 12th

  next_to([_, _, _, _, konie], [_, zolty, _, _, _], Houses), % 13th

  member([_, _, pwio, mentolowe, _], Houses), % 14th
  member([_, zielony, kawa, _, _], Houses), % 15th
  member([Kto, _, _, _, rybki], Houses).
