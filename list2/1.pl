% srodkowy([1,2,3,4,5],X).
srodkowy(L,X) :- 
    length(L,N),        % liczenie dlugosci listy -> lista nie jest pusta
    1 is N mod 2,       % lista ma parzysta ilosc elementow, tak - false, nie <=> ma element srodkowy
    Y is (N + 1)/2,     % Y jest indeksem srodkowego elementu, czyli (length+1)/ 2
    nth1(Y, L, X).      % otrzymujemy k-ty element
