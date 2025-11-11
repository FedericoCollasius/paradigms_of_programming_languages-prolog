unico(L, U) :-
  select(U, L, R),
  not((member(U, R))).

sinRepetidos([]).
sinRepetidos([X|XS]) :-
  unico([X|XS], X),
  sinRepetidos(XS).
