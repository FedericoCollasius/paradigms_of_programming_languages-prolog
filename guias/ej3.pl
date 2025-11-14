natural(0).
natural(suc(X)) :- natural(X).

menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
menorOIgual(X,X) :- natural(X).

% Explicar que sucede al realizar la
% consulta menorOIgual(0, X):
% Va a haber un loop infinito.
% menorOIgual(0, X) va a unificar
% a 0 = X y a X con = Suc(Y) y luego
% va a llamar menorOIgual(0, Y).
% Esto va a unificar 0 con X y a 
% Y con Suc(Y) y va a darse la misma llamada

menorOIgualMejorado(X, X) :- natural(X).
menorOIgualMejorado(X, suc(Y)) :- natural(Y), menorOIgualMejorado(X, Y).

% Intuición: Si X ≤ Y, entonces X ≤ Y+1
