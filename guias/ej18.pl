% corteMasParejo(+L, -L1, -L2)

corteMasParejo(L, L1, L2) :-
  append(L1, L2, L),
  sum_list(L1, N),
  sum_list(L2, M),
  K is abs(N - M),
  not(corteMasChico(K, L)).

corteMasChico(K, L) :-
  append(L3, L4, L),
  sum_list(L3, N_),
  sum_list(L4, M_),
  K_ is abs(N_ - M_),
  K_ < K.   
