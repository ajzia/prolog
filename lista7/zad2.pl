%   compiling:  |   usage:
%   ?- [zad1].  |   ?- merge_sort(List1, SortedList).
%   ?- [zad2].  |

% ?- merge_sort([6,2,5,4,1], X).
% X = [1, 2, 3, 4, 5, 6].
%
% ?- merge_sort([2,0,-6,4,7,-2,-1,1], X).
% X = [-6, -2, -1, 0, 1, 2, 4, 7].
%
% ?- merge_sort([8,5,7|A], X).
% freeze(A,  (_848=[7|_856], split(A, _862, _856))),
% freeze(_848,  (_848=[]->_904=[8|_848];split([8|_848], _924, _926), merge_sort(_924, _938), merge_sort(_926, _950), merge(_938, _950, _904))),
% freeze(_904,  (_904=[_998|_1000]->freeze(_1004,  (_1004=[_1028|_1030]->(_998=<_1028-> ... = ..., merge(..., ..., ...);X=[...|...], merge(_904, _1030, _1066));X=_904));X=_1004)),
% freeze(_862,  (_862=[]->_1004=[5|_862];split([5|_862], _1172, _1174), merge_sort(_1172, _1186), merge_sort(_1174, _1198), merge(_1186, _1198, _1004))).

split(In, Out1, Out2) :-
  freeze(In,
    (
      In = [H1|T]
      -> (freeze(T,
          (
            Out1 = [H1 | TOut1],
            split(T, Out2, TOut1)  
          )
        )
      )
      ; (
        Out1 = [],
        Out2 = []  
      )
    )  
  ).


merge_sort(In, Out) :-
  freeze(In, 
    In = [_|T]
    ->(freeze(T, 
        (
          T = []
          -> (
            Out = In
          )
          ; (
            split(In, Left, Right),
            merge_sort(Left, LOut),
            merge_sort(Right, ROut),
            merge(LOut, ROut, Out)
          )  
        )
      )
    )
    ; (
      Out = []
    )
  ), !.

