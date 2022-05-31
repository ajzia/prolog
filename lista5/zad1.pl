:- [przyporzadkuj].

file(Z, X, Y) :-
  open(Z, read, X),
  scanner(X, Y),
  write(Y).

scanner(X, Y) :-
  czytaj(X, Z),
  close(X),
  przyporzadkuj(Z, [], Y).

czytaj(S, X) :- 
  get_char(S, C),
  czytaj_dalej(S, C, X).



czytaj_dalej(_, end_of_file, []) :- % koniec strumienia znaków
  !.

czytaj_dalej(S, C1, X) :- % pomijanie białego znaku
  bialy(C1),
  !,
  get_char(S, C2),
  czytaj_dalej(S, C2, X).

czytaj_dalej(S, C1, [H | T]) :- % czytanie slowa z niebiałych znakow
  czytaj_slowo(S, C1, C2, '', H),
  czytaj_dalej(S, C2, T).



czytaj_slowo(_, end_of_file, end_of_file, N, N) :-  % koniec strumienia
  !.

czytaj_slowo(_, C, C, N, N) :-  % znak biały - koniec słowa
  bialy(C),
  !.

czytaj_slowo(_, C, C, N, N) :- % C jest kluczem
  char_type(C, lower),
  atom_chars(N, L2),
  \+ same_type(L2, lower), % sprawdzamy, czy poprzednie znaki są tego samego typu, jeśli tak - idziemy dokleić znak do słowa, jeśli nie - kończymy słowo
  !.   

czytaj_slowo(_, C, C, N, N) :- % C jest separatorem
  char_type(C, punct),
  atom_chars(N, L),
  \+ same_type(L, punct),
  !.

czytaj_slowo(_, C, C, N, N) :- % C jest liczba
  char_type(C, digit),
  atom_chars(N, L2),
  \+ same_type(L2, digit),
  !.    

czytaj_slowo(_, C, C, N, N) :- % C jest uppercase
  char_type(C, upper),
  atom_chars(N, L2),
  \+ same_type(L2, upper),
  !.

czytaj_slowo(S, C1, C3, N1, N) :- 
  atom_concat(N1, C1, N2),
  get_char(S, C2),
  czytaj_slowo(S, C2, C3, N2, N).