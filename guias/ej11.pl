vacio(nil).

raiz(bin(_, V, _), V).

altura(nil, 0).
altura(bin(I, V, D), H) :-
  altura(I, HI),
  altura(D, HD),
  Max is max(HI, HD),
  H is Max+1 
  
cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(I, V, D), N) :-
  cantidadDeNodos(I, NI),
  cantidadDeNodos(D, ND),
  N is 1+ NI + ND.

