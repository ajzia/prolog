/* rodzic(X,Y). */
rodzic(jan, janusz).
rodzic(janusz, asia).
rodzic(janusz, tomek).
rodzic(janusz, monia).
rodzic(edyta, asia).
rodzic(edyta, monia).
rodzic(edyta, tomek).

/* mezczyzna(X) */
mezczyzna(jan).
mezczyzna(janusz).
mezczyzna(tomek).

/* kobieta(X) */
kobieta(edyta).
kobieta(asia).
kobieta(monia).

/* ojciec(X,Y). */
ojciec(X,Y) :- 
    rodzic(X,Y), 
    mezczyzna(X).

/* matka(X,Y). */
matka(X,Y) :- 
    rodzic(X,Y), 
    kobieta(X).

/* diff(X,Y). */
diff(X,Y) :- X \= Y.

/* zadanie */
jest_matka(X) :- 
    matka(X,_).

jest_ojcem(X) :- 
    ojciec(X, _).

jest_synem(X) :- 
    mezczyzna(X),
    rodzic(_,X).

siostra(X,Y) :- 
    kobieta(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    diff(X,Y).

dziadek(X,Y) :- 
    ojciec(X,Z),
    rodzic(Z,Y).

rodzenstwo(X,Y) :- 
    rodzic(Z,X),
    rodzic(Z,Y),
    diff(X,Y).