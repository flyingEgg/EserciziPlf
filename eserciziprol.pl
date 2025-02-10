fattoriale(0, 1).
fattoriale(N, F) :- N > 0, N1 is N - 1,
                    fattoriale(N1, F1), F is N * F1.

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-
    N > 1, N1 is N - 1, N2 is N - 2,
    fibonacci(N1, F1), fibonacci(N2, F2), F is F1 + F2.


/* es Media aritmetica */
media([], 0).
media(Xs, M) :-
    somma(Xs, S),
    conta(Xs, L),
    write(S / L),
    M is (S/ L).
    
somma([], 0).
somma([X|Xs], S) :-
    somma(Xs, S1),
    S is S1 + X.

conta([], 0).
conta([_|Xs], L) :-
    conta(Xs, L1),
    L is L1 + 1.
/*************************************************/

/* es Scarta anni bisestili da lista di interi non negativi */
scarta_bisestili([], []).
scarta_bisestili([A|As], Bs) :-
    A mod 400 =:= 0,
    scarta_bisestili(As, Bs).
scarta_bisestili([A|As], Bs) :-
    A mod 100 =\= 0,
    A mod 4 =:= 0,
    scarta_bisestili(As, Bs).
scarta_bisestili([A|As], [B|Bs]) :-
    scarta_bisestili(As, Bs).
/*************************************************/

/* es Scarta anni bisestili da lista di interi non negativi */
scarta_multiplo_cinque([], []).

scarta_multiplo_cinque([X|Xs], Ys) :-
    X mod 5 =:= 0,
    X mod 2 =\= 0,
    scarta_multiplo_cinque(Xs, Ys).

scarta_multiplo_cinque([X|Xs], [X|Ys]) :-
    \+ (X mod 5 =:= 0, X mod 2 =\= 0),
    scarta_multiplo_cinque(Xs, Ys).
/*************************************************/


/* es Media Geometrica */
prodotto([], 1).
prodotto([X|Xs], Prodotto) :-
    prodotto(Xs, Prodotto1),
    Prodotto is X * Prodotto1.

media_geometrica([], 0).
media_geometrica(Xs, Media) :-
    length(Xs, Lunghezza),
    prodotto(Xs, Prodotto),
    Media is Prodotto ** (1 / Lunghezza).
/*************************************************/

/* es Numero massimo della prima coppia */
max_coppia((0, 0), 0).
max_coppia((A, B), M) :-
    A > B,
    M is A.
max_coppia((A, B), M) :-
    B > A,
    M is B.

massimo_prima_coppia([], no).
massimo_prima_coppia([X|_], Max) :-
     max_coppia(X, M),
     Max is M.
/*************************************************/

/* es Numero minimo della prima coppia */
min_coppia((0, 0), 0).
min_coppia((A, B), Min) :-
    A < B,
    Min is A.
min_coppia((A, B), Min) :-
    B < A,
    Min is B.

splitta([X|_], S) :- S is X.

min_seconda_coppia([_|Xs], Min) :-
    splitta(Xs, S),
    min_coppia(S, M),
    Min is M.
/*************************************************/