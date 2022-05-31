%   compiling:  |   usage:
%   ?- [zad1].  |   merge(List1, List2, MergedList).
%               |   ! List1 and List2 are sorted in a non descending order !

% merge([1,3], [2,4], X).
% X = [1, 2, 3, 4].
%
% merge([1,3|A], [2,4|B], X).
% X = [1, 2, 3|_1626],
% freeze(A,  (A=[_1666|_1668]->freeze([4|B],  ([4|B]=[_1702|_1704]->(_1666=<_1702-> ... = ..., merge(..., ..., ...);_1626=[...|...], merge(A, _1704, _1740));_1626=A));_1626=[4|B])).

merge(In1, In2, Out) :-
  freeze(In1,
    (
      (
        In1 = [H1 | T1] 
        -> (freeze(In2,
            (
              In2 = [H2 | T2]
              -> (
                H1 =< H2 
                -> (
                  Out = [H1 | X], merge(T1, In2, X)
                )
                ; (
                  Out = [H2 | X], merge(In1, T2, X)
                )
              )
              ; (
                Out = In1
              )
            )
          )
        )
        ; (
          Out = In2
        )
      )
    )
  ).
