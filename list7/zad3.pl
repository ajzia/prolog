%   compiling:  |   usage:
%   ?- [zad3].  |   ?- philosophers.

% ?- philosophers.
% [5]Mysli
% [1]Mysli
% [3]Mysli
% [5]Chce lewy widelec
% [5]Podniosl lewy widelec
% [5]Chce prawy widelec
% [5]Podniosl prawy widelec
% [5]Je
% [5]Odklada lewy widelec
% [5]Odklada prawy widelec
% [5]Mysli

id(Id) :-
  write("["), write(Id), write("]").

say(Id, Msg) :-
  mutex_lock(writing),
  id(Id),
  write(Msg),
  sleep(0.1),
  mutex_unlock(writing).

think(Id) :-
  say(Id, "Mysli\n").

pick_up_fork(Id, Fork, Side) :-
  mutex_lock(Fork),
  (
    Side == 1
    -> say(Id, "Podniosl lewy widelec\n")
    ; say(Id, "Podniosl prawy widelec\n")
  ).

eat(Id) :-
  say(Id, "Je\n").

put_forks(Id, Fork1, Fork2) :-
  say(Id, "Odklada lewy widelec\n"),
  mutex_unlock(Fork1),
  say(Id, "Odklada prawy widelec\n"),
  mutex_unlock(Fork2).


dinner(Seat, Fork1, Fork2) :-
  think(Seat),
  random(Wait1),
  Wait is Wait1 / 50,
  sleep(Wait),
  say(Seat, "Chce lewy widelec\n"),
  pick_up_fork(Seat, Fork1, 1),
  say(Seat, "Chce prawy widelec\n"),
  pick_up_fork(Seat, Fork2, 2),
  eat(Seat),
  put_forks(Seat, Fork1, Fork2),
  dinner(Seat, Fork1, Fork2).


philosophers :-
  mutex_create(Fork1),
  mutex_create(Fork2),
  mutex_create(Fork3),
  mutex_create(Fork4),
  mutex_create(Fork5),
  thread_create(dinner(1, Fork5, Fork1), _, [detached(true)]),
  thread_create(dinner(2, Fork1, Fork2), _, [detached(true)]),
  thread_create(dinner(3, Fork2, Fork3), _, [detached(true)]),
  thread_create(dinner(4, Fork3, Fork4), _, [detached(true)]),
  thread_create(dinner(5, Fork4, Fork5), _, [detached(true)]).
