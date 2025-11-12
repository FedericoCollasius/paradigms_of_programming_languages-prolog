padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
abuelo(X, Y) :- padre(X, Z), padre(Z, Y).

% I. El resultado de la consulta abuelo(X, manuel)
% sera X = juan

% II. Defino predicados hijo, hermano y descendiente
hijo(X, Y) :- padre(Y, X).
hermano(X, Y) :- padre(Z, X), padre(Z, Y).
descendiente(X, Y) :- padre(Y, X).
descendiente(X, Y) :- padre(Y, Z), descendiente(X, Z).

% IV. Consulta para encontrar nietos de juan:
% abuelo(juan, Y).

% V. Consulta para encontrar hermanos de pablo:
% hermano(X, pablo) o heramano(pablo, Y)

% VI. Considerar el agregado del siguiente hecho:
ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).

% VII. Explicar la respuesta a la consulta:
% ancestro(juan, X). 

% Devuelve:
% X = juan
% X = carlos
% X = luis
% X = daniel
% X = diego
% X = pablo
% X = manuel
% X = ramiro

% Que sucede si se pide mas de un resultado?
% La recursión se vuelve infinita dado que
% Prolog va a estar buscando instanciar 
% ancestro(Z2, pedro), padre(juan, Z2)
% indefinidamente 

ancestroCorregido(X, Y) :- padre(X, Y).
ancestroCorregido(X, Y) :- padre(X, Z), ancestroCorregido(Z, Y).
