% esTriangulo(+T)
% con T = tri(A,B,C)
% Triangulo valido <-> 
%	- cada lado menor que suma de los otros dos y mayor que su diferencia

desde(X, X).
desde(X, Y) :- N is X+1, desde(N, Y).

esTriangulo(tri(A,B,C)) :-
  A > 0,
  B > 0,
  C > 0,
  A < B + C,
  B < A + C,
  C < A + B.

desdeRev(X,Y) :- nonvar(Y), Y >= X.
desdeRev(X,Y) :- var(Y), desde(X,Y).

perimetro(tri(A,B,C),P) :- 
	ground(tri(A,B,C)), 
	esTriangulo(tri(A,B,C)),
	P is A+B+C.

perimetro(tri(A,B,C), P) :-
	not(ground(tri(A,B,C))),
	desdeRev(3,P),
	armarTriplas(P,A,B,C),
	esTriangulo(tri(A,B,C)).


% armarTriplas(+P,-A,-B,-C)
armarTriplas(P,A,B,C) :- 
	between(1,P,A),
	LB is P - A, between(1,LB,B),
	C is P -A -B.

generarTriplas(A, B, C) :-
  desdeRev(1, N), between(1, N, A), LB is N - A, between(1, LB, B), C is N - A - B.


% triangulo(-T): genera triangulos validos sin repetir resultados

triangulos(tri(A,B,C)) :- perimtero(T, _).
