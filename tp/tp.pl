%%%%%%%%%%%%%%%%%%%%%%%%
%% Predicados básicos %%
%%%%%%%%%%%%%%%%%%%%%%%%

%% Ejercicio 1
%% proceso(+P)
proceso(_).

%% Ejercicio 2
%% buffersUsados(+P,-BS)
%% buffersUsados((escribir(1, hola), BS)). -> BS = [1] ; false
%% buffersUsados(secuencia(escribir(a8,hola),escribir(a8,chau)), BS)). -> BS = [a8] ; false
%% buffersUsados(paralelo(secuencia(escribir(1,"hola"),escribir(1,"chau")),secuencia(escribir(2,"hallo"),escribir(2,"tch¨uss"))), BS). -> BS = [1, 2] ; false
buffersUsados(computar,[]).
buffersUsados(escribir(B, _), [B]).
buffersUsados(leer(B), [B]).
buffersUsados(secuencia(P_S, Q_S), BS) :-
  buffersUsados(P_S, BS_SP),
  buffersUsados(Q_S, BS_SQ),
  append(BS_SP, BS_SQ, BS_SPQ),
  sort(BS_SPQ, BS).
buffersUsados(paralelo(P_P, Q_P), BS) :-
  buffersUsados(P_P, BS_PP),
  buffersUsados(Q_P, BS_PQ),
  append(BS_PP, BS_PQ, BS_PPQ),
  sort(BS_PPQ, BS).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Organización de procesos %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Ejercicio 3
%% intercalar(+XS,+YS,?ZS)
intercalar(_,_,_).

%% Ejercicio 4
%% serializar(+P,?XS)
serializar(_,_).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contenido de los buffers %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Ejercicio 5
%% contenidoBuffer(+B,+ProcesoOLista,?Contenidos)
contenidoBuffer(_,_,_).


%% Ejercicio 6
%% contenidoLeido(+ProcesoOLista,?Contenidos)
contenidoLeido(_,_).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contenido de los buffers %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Ejercicio 7
% Casos base
esSecuenciaSegura(computar, _, _).
esSecuenciaSegura(escribir(B,_), _, BS). 
esSecuenciaSegura(leer(B), computar, BS) :- member(B, BS).

% Casos recursivos
esSecuenciaSegura(escribir(B,_), Q, BS) :-
    append([B], BS, BS_Nuevos),
    esSecuenciaSegura(Q, computar, BS_Nuevos).

esSecuenciaSegura(leer(B), Q, BS) :-
    member(B, BS),
    select(B, BS, BS_Nuevo),
    esSecuenciaSegura(Q, computar, BS_Nuevo).

% Manejo de secuencias
esSecuenciaSegura(secuencia(P, Q), _, BS) :- 
    esSecuenciaSegura(P, Q, BS).

% Manejo de paralelo dentro de secuencia
esSecuenciaSegura(paralelo(P, Q), _, BS) :-
    esSeguro(P),
    esSeguro(Q),
    buffersUsados(P, BS_P),
    buffersUsados(Q, BS_Q),
    intersection(BS_P, BS_Q, []).


% esSeguro(+P)
esSeguro(computar).
esSeguro(escribir(_,_)).
% leer solo no es seguro, no defino clausula.
esSeguro(secuencia(P, Q)) :-
  esSecuenciaSegura(P, Q, []).
esSeguro(paralelo(P, Q)) :-
  esSeguro(P),
  esSeguro(Q),
  buffersUsados(P, BS_P),
  buffersUsados(Q, BS_Q),
  intersection(BS_P, BS_Q, []).
    

%% Ejercicio 8
%% ejecucionSegura( XS,+BS,+CS) - COMPLETAR LA INSTANCIACIÓN DE XS
ejecucionSegura(_,_,_).

  %% 8.1. Analizar la reversibilidad de XS, justificando adecuadamente por qué el predicado se comporta como
  %% lo hace.



%%%%%%%%%%%
%% TESTS %%
%%%%%%%%%%%

% Se espera que completen con las subsecciones de tests que crean necesarias, más allá de las puestas en estos ejemplos

cantidadTestsBasicos(5). % Actualizar con la cantidad de tests que entreguen
testBasico(1) :- proceso(computar).
testBasico(2) :- proceso(secuencia(escribir(1,pepe),escribir(2,pipo))).
testBasico(3) :- buffersUsados(escribir(1, hola), [1]).
%% Agregados por mi
testBasico(4) :- buffersUsados(secuencia(escribir(a8,hola),escribir(a8,chau)), [a8]).
testBasico(5) :- buffersUsados(paralelo(secuencia(escribir(1,"hola"),escribir(1,"chau")),secuencia(escribir(2,"hallo"),escribir(2,"tch¨uss"))), [1, 2]).
% Agregar más tests

cantidadTestsProcesos(0). % Actualizar con la cantidad de tests que entreguen
% Agregar más tests

cantidadTestsBuffers(0). % Actualizar con la cantidad de tests que entreguen
% Agregar más tests

cantidadTestsSeguros(10).
testSeguros(1) :- not(esSeguro(secuencia(leer(1),escribir(1,agua)))).
testSeguros(2) :- esSeguro(secuencia(escribir(1,agua),leer(1))).
testSeguros(3) :- not(esSeguro(paralelo(escribir(1,sol),secuencia(escribir(1,agua),leer(1))))).
testSeguros(4) :- esSeguro(paralelo(escribir(2,sol),secuencia(escribir(1,agua),leer(1)))).
testSeguros(5) :- esSeguro(paralelo(paralelo(computar, escribir(3, sol)), paralelo(escribir(2,sol),secuencia(escribir(1,agua),leer(1))))).
testSeguros(6) :- esSeguro(computar).                                           
testSeguros(7) :- esSeguro(escribir(1,agua)).                                  
testSeguros(8) :- not(esSeguro(leer(1))).                                     
testSeguros(9) :- not(esSeguro(secuencia(leer(1),leer(1)))).                 
testSeguros(10) :- not(esSeguro(secuencia(secuencia(escribir(1,agua),secuencia(escribir(2,sol),leer(1))), leer(3)))).


tests(basico) :- cantidadTestsBasicos(M), forall(between(1,M,N), testBasico(N)).
tests(procesos) :- cantidadTestsProcesos(M), forall(between(1,M,N), testProcesos(N)).
tests(buffers) :- cantidadTestsBuffers(M), forall(between(1,M,N), testBuffers(N)).
tests(seguros) :- cantidadTestsSeguros(M), forall(between(1,M,N), testSeguros(N)).

tests(todos) :-
  tests(basico),
  tests(procesos),
  tests(buffers),
  tests(seguros).

tests :- tests(todos).
