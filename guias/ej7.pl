% interseccion(+L1, +L2, -L3)
interseccion([], _, []).
interseccion([E|L1], L2, [E|L3]) :-
  member(E, L2),
  borrar(L1, E, L1_),
  interseccion(L1_, L2, L3).
interseccion([E|L1], L2, L3) :-
  not(member(E, L2)),
  interseccion(L1, L2, L3).

% partir(N, L, L1, L2)
partir(0, L, [], L).
partir(N, [E|L], [E|L1], L2) :- N_ is N-1, partir(N_, L, L1, L2).
% Analisis de reversibilidad:
% +N: debe estar instanciada porque se hace una operacion aritmetica
% sobre ella que requiere que este definida.
% ?L, ?L1, ?L2: pero en caso que L no este intanciada, L1 y L2
% deben estarlo sino se cuelga.


% sacarDuplicados(+L1, -L2)
sacarDuplicados([], []).
sacarDuplicados([X|XS], [X|Res]) :- borrar(XS, X, L), sacarDuplicados(L, Res).

% borrar(+ListaOriginal, +X, -ListaSinXs)
borrar([], _, []).
borrar([X|XS], X, Res) :- borrar(XS, X, Res).
borrar([Y|XS], X, [Y|Res]) :- Y \= X, borrar(XS, X, Res).

% permutacion(+L1, ?L2) :- 
permutacion([], []).
permutacion(L1, [Y|YS]) :-
  member(Y, L1),
  borrar(L1, Y, L1_),
  permutacion(L1_, YS).
