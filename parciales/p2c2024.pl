seFormaCon([], A).
seFormaCon([A|AS], B) :- member(A, B), seFormaCon(AS, B).
