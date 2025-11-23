% proximoNumPoderoso(+X, -Y)

proximoNumPoderoso(X, Y) :-
  Y is X + 1,
  numPoderoso(Y).

proximoNumPoderoso(X, Y) :-
  N is X + 1, 
  not(numPoderoso(N)),
  proximoNumPoderoso(N, Y).

numPoderoso(Y) :- 
  not((
    between(2, Y, P),
    0 =:= mod(Y, P), 
    esPrimo(P), 
    PP is P * P, 
    0 =\= mod(Y, PP)
  )).

esPrimo(P) :-
  not((between(2, P, K), K =\= P, 0 =:= mod(P, K))).
