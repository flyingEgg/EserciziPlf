% Introduzione a Prolog con predicati di esempio

% Definizione di alcuni fatti semplici.
% Il predicato 'genitore(X, Y)' indica che X è genitore di Y.
genitore(mario, luigi).
genitore(mario, anna).
genitore(maria, luigi).
genitore(maria, anna).

% Il predicato 'maschio(X)' indica che X è un maschio.
maschio(mario).
maschio(luigi).

% Il predicato 'femmina(X)' indica che X è una femmina.
femmina(maria).
femmina(anna).

% Definizione di regole.
% Il predicato 'fratello(X, Y)' indica che X è fratello di Y.
% X è fratello di Y se X è maschio, X e Y hanno lo stesso genitore e X e Y non sono la stessa persona.
fratello(X, Y) :-
    maschio(X),
    genitore(Z, X),
    genitore(Z, Y),
    X \= Y.

% Il predicato 'sorella(X, Y)' indica che X è sorella di Y.
% X è sorella di Y se X è femmina, X e Y hanno lo stesso genitore e X e Y non sono la stessa persona.
sorella(X, Y) :-
    femmina(X),
    genitore(Z, X),
    genitore(Z, Y),
    X \= Y.

% Il predicato 'figlio(X, Y)' indica che X è figlio di Y.
% X è figlio di Y se Y è genitore di X.
figlio(X, Y) :-
    genitore(Y, X).

% Il predicato 'nonno(X, Y)' indica che X è nonno di Y.
% X è nonno di Y se X è genitore di Z e Z è genitore di Y.
nonno(X, Y) :-
    genitore(X, Z),
    genitore(Z, Y).

% Predicato per verificare se due persone sono parenti.
% Due persone sono parenti se hanno almeno un antenato in comune.
parente(X, Y) :-
    genitore(Z, X),
    genitore(Z, Y).

% Esempi di query da provare:
% ?- fratello(luigi, anna).       % Verifica se Luigi è fratello di Anna.
% ?- nonno(mario, anna).         % Verifica se Mario è nonno di Anna.
% ?- parente(luigi, anna).       % Verifica se Luigi e Anna sono parenti.
% ?- figlio(anna, maria).        % Verifica se Anna è figlia di Maria.
