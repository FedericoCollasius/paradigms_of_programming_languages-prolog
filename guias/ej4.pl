juntar([], L, L).
juntar([X|XS], [Y|YS], [X|Juntadas]) :- juntar(XS, [Y|YS], Juntadas).
