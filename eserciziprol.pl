fattoriale(0, 1).
fattoriale(N, F) :- N > 0, N1 is N - 1,
                    fattoriale(N1, F1), F is N * F1.

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-
    N > 1, N1 is N - 1, N2 is N - 2,
    fibonacci(N1, F1), fibonacci(N2, F2), F is F1 + F2.


/*************************************************/
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

