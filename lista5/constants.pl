bialy(B) :- 
  member(B, [' ', '\t', '\n', '\r']).

key(K) :-
  member(K, [read, write, if, then, else, fi, while, do, od, and, or, mod]).

sep(S) :-
    member(S, [':',';','+','-','*','/','(',')','<','>','=<','>=',':=','=','/=']).