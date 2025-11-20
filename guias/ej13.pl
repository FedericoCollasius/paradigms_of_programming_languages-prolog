desde(X, X).
desde(X, Y) :- N is X+1, desde(N, Y).

% coprimos(X, Y) -> X = 1, Y = 1, X = 1, Y = 2, X = 2 
% La condicion es clara ... D is gcd(X, Y), D is 1.
% The thing is, X Y deben estar instanciados para usarse en gcd
% Tiene que haber una manera piola de hacer pares

generarPares(X, Y) :-
  desde(1, N),
  between(1, N, X),
  Y is N - X. 

% coprimos(-X, -Y)
coprimos(X, Y) :-
  generarPares(X, Y),
  D is gcd(X, Y),
  D is 1.
