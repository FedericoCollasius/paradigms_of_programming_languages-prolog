% Sean los predicados P(?X) y Q(?X), qué significa la respuesta a la siguiente consulta?

% ?- P(Y), not(Q(Y)).

% Y se instancia tal que se cumpla en P pero no se cumpla en Q. 

% Qué pasaría si se invirtiera el orden de los literales en la consulta anterior?

% La definición de not dice que tendrá éxito si NO EXISTE instanciación posible para las variables no instanciadas de los términos del predicado que hagan que tenga éxito. Luego:

% not exitoso (no hay Y tal que valga Q) ->  me instancia todos los Y que cumplan P
% not no exitoso (existe al menos un Y que cumple Q) -> nunca considera P

% Sea el predicado P(?X), cómo se puede usar el not para determinar si existe una única Y tal que P(?Y) es verdadero?  

P(Y), not((P(Z), Z \= Y)). 
