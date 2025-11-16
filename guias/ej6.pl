% aplanar(+Xs, -Ys)
aplanar([], []).
aplanar([X|XSS], [X|Resto]) :-
  atom(X),
  aplanar(XSS, Resto).
aplanar([X|XSS], [X|Resto]) :-
  number(X),
  aplanar(XSS, Resto).
aplanar([XS|XSS], Res) :-
  aplanar(XS, ListaAplanada),
  aplanar(XSS, RestoAplanado),
  append(ListaAplanada, RestoAplanado, Res).


