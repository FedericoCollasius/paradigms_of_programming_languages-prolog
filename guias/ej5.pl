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


