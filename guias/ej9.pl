desde(X, X).
desde(X, Y) :- N is X+1, desde(N, Y).

% Si se instancia X y no Y entonces va a generar
% todos los numeros desde X hasta infinito.
% No se cuelga, simplemente los genera.

% Si se instancia Y y no X entonces va a generar
% una sola solucion, la del hecho, y despues
% se va a colgar a causa de N is X+1.
% Idem si no se instancia ninguna.

% Si se instancian ambas devuelve true o false

% desdeReversible(+X, ?Y)
desdeReversible(X, X).
desdeReversible(X, Y) :-
  nonvar(Y),
  Y => X.
desdeReversible(X, Y) :-
  var(Y), N is X+1, desde(N, Y).

