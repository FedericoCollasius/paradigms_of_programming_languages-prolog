last_(L, U) :- append(_, [U], L).

reverse_([], []).
reverse_([L|LS], R) :- 
  reverse(LS, R_),
  append(R_, [L], R).
% L = [1,2,3,4, 5]
% L1 = [1, 2]
% L2 = [3, 4, 5]
% reverso([3, 4, 5])
% reverso([1, 2], [2, 1])

% prefijo(?P, +L)
prefijo(P, L) :- append(P, _, L).

% sufijo(?S, +L)
sufijo(S, L) :- append(_, S, L).

% L = [1,2,3,4,5]
% L = [1,2] ++ [3,4,5]
% S = [3,4] ++ [5]
% sublista(?S, +L)
sublista([], _).
sublista(S, L) :- append(P, _, L), append(_, S, P).

% pertenece(?X, +L)
pertenece(X, L) :- sublista([X], L).