left(Left, Right, [Left, Right | _]).
left(Left, Right, [_, R | T]) :-
  left(Left, Right, [R|T]).

next_to(X, Y, [X, Y | _]).  % x -> y
next_to(X, Y, [Y, X | _]).  % y -> x
next_to(X, Y, [_|T]) :-
  next_to(X, Y, T).

rybki(Kto) :-
  Houses = [
    [norweg, _, _, _, _],  % 1st
    [_, niebieski, _, _, _], % 12th
    [_, _, mleko, _, _], % 8th
    [_, _, _, _, _],
    [_, _, _, _, _]],

  % number, nationality, colour, drink, smoke, pet
  member([anglik, czerwony, _, _, _], Houses), % 2nd

  left([_, zielony, _, _, _], [_, bialy, _, _, _], Houses), % 3rd green <- white
  
  member([dunczyk, _, herbata, _, _], Houses), % 4th 

  next_to([_, _, _, light, _], [_, _, _, _, koty], Houses), % 5th

  member([_, zolty, _, cygara, _], Houses), % 6th
  member([niemiec, _, _, fajka, _], Houses), % 7th

  next_to([_, _, _, light, _], [_, _, woda, _, _], Houses),  % 9th

  member([_, _, _, bez_filtra, ptaki], Houses), % 10th
  member([szwed, _, _, _, psy], Houses), % 11th

  next_to([_, _, _, _, konie], [_, zolty, _, _, _], Houses), % 13th

  member([_, _, piwo, mentolowe, _], Houses), % 14th
  member([_, zielony, kawa, _, _], Houses), % 15th
  member([Kto, _, _, _, rybki], Houses).
