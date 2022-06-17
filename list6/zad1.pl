% zad 1, lista 6

% Uruchomienie:
% file("../lista5/ex1.prog", X, Y), phrase(program(PROGRAM), Y).  # file to u mnie odpowiednik całego programu 1 z listy 5
  
:- ["../lista5/zad1"].

program([]) --> [].
program([Ins | Prog]) -->
  instruction(Ins),
  [sep(';')],
  program(Prog).

instruction(assign(X, Y)) -->
  [id(X)],
  [sep(':=')],
  expression(Y).

instruction(read(X)) -->
  [key(read)],
  [id(X)].

instruction(write(X)) -->
  [key(write)],
  [X].

instruction(if(X, Y)) -->
  [key(if)],
  condition(X),
  [key(then)],
  program(Y),
  [key(fi)].

instruction(if(X, Y, Z)) -->
  [key(if)],
  condition(X),
  [key(then)],
  program(Y),
  [key(else)],
  program(Z),
  [key(fi)].

instruction(while(X, Y)) -->
  [key(while)],
  condition(X),
  [key(do)],
  program(Y),
  [key(od)].

expression(X) -->
  component(X).

expression(X + Y) -->
  component(X),
  [sep('+')],
  expression(Y).

expression(X - Y) -->
  component(X),
  [sep('-')],
  expression(Y).

component(X * Y) -->
  element(X),
  [sep('*')],
  component(Y).

component(X / Y) -->
  element(X),
  [sep('/')],
  component(Y).

component(X mod  Y) -->
  element(X),
  [key(mod)],
  component(Y).

component(X) -->
  element(X).

element(id(X)) -->
  [id(X)].

element(int(X)) -->
  [int(X)].

element(( X )) -->
  [sep('(')],
  expression(X),
  [sep(')')].

condition(X ; Y) -->
  conjunction(X),
  [key(or)],
  condition(Y).

condition(X) -->
  conjunction(X).

conjunction(X , Y) -->
  simple(X),
  [key(and)],
  conjunction(Y).

conjunction(X) -->
  simple(X).

simple(X =:= Y) -->
  expression(X),
  [sep('=')],
  expression(Y). 

simple(X =\= Y) -->
  expression(X),
  [sep('/=')],
  expression(Y). 

simple(X < Y) -->
  expression(X),
  [sep('<')],
  expression(Y). 

simple(X > Y) -->
  expression(X),
  [sep('>')],
  expression(Y). 

simple(X >= Y) -->
  expression(X),
  [sep('>=')],
  expression(Y).  

simple(X =< Y) -->
  expression(X),
  [sep('=<')],
  expression(Y).  

simple(( X )) -->
  [sep('(')],
  condition(X),
  [sep(')')].