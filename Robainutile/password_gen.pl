% Predicato principale (punto di ingresso)
main :-
    write('Inserisci la lunghezza della password: '), read(Lunghezza),
    write('Vuoi includere lettere maiuscole? (s/n): '), get_char(Maiuscole), get_char(_),
    write('Vuoi includere caratteri speciali? (s/n): '), get_char(Speciali), get_char(_),
    crea_password(Lunghezza, Maiuscole, Speciali, Password),
    write('La tua password è: '), write(Password), nl.

% Predicato per creare la password
crea_password(Lunghezza, Maiuscole, Speciali, Password) :-
    length(Caratteri, Lunghezza),
    maplist(carattere_casuale(Maiuscole, Speciali), Caratteri),
    atom_chars(Password, Caratteri).

% Predicato per generare un carattere casuale
carattere_casuale(Maiuscole, Speciali, Carattere) :-
    random_member(Tipo, [lettera_minuscola, lettera_maiuscola, numero, carattere_speciale]),
    verifica_tipo(Tipo, Maiuscole, Speciali, Codice),
    char_code(Carattere, Codice).

% Predicato dichiarativo per verificare il tipo di carattere
verifica_tipo(lettera_minuscola, _, _, Codice) :-
    random_between(97, 122, Codice). % Codici ASCII per 'a'-'z'

verifica_tipo(lettera_maiuscola, Maiuscole, _, Codice) :-
    Maiuscole = 's',
    random_between(65, 90, Codice). % Codici ASCII per 'A'-'Z'

verifica_tipo(numero, _, _, Codice) :-
    random_between(48, 57, Codice). % Codici ASCII per '0'-'9'

verifica_tipo(carattere_speciale, _, Speciali, Codice) :-
    Speciali = 's',
    random_member(Codice, [33, 35, 36, 37, 38, 64, 94]). % Codici ASCII per caratteri speciali

% Se il tipo non è valido o le condizioni non sono soddisfatte, riprova
verifica_tipo(Tipo, Maiuscole, Speciali, Codice) :-
    \+ (Tipo = lettera_minuscola ; Tipo = lettera_maiuscola, Maiuscole = 's' ; Tipo = numero ; Tipo = carattere_speciale, Speciali = 's'),
    carattere_casuale(Maiuscole, Speciali, _), % Richiama ricorsivamente per generare un nuovo carattere
    verifica_tipo(Tipo, Maiuscole, Speciali, Codice).

% Predicato per generare un numero casuale tra due valori
random_between(Min, Max, Valore) :-
    random(ValoreRaw),
    Valore is Min + floor((Max - Min + 1) * ValoreRaw).

% Predicato per selezionare un elemento casuale da una lista
random_member(Elemento, Lista) :-
    length(Lista, Lunghezza),
    random_between(0, Lunghezza - 1, Indice),
    nth0(Indice, Lista, Elemento).

% Predicato per generare un numero casuale (alternativa se random/1 non è disponibile)
random(Valore) :-
    get_time(Time),
    Seed is floor(Time * 1000),
    setrand(Seed),
    rand(Valore).

% Predicato per inizializzare il generatore di numeri casuali
:- dynamic rand_seed/1.
setrand(Seed) :-
    retractall(rand_seed(_)),
    assertz(rand_seed(Seed)).

% Predicato per generare un numero casuale
rand(Valore) :-
    rand_seed(Seed),
    NewSeed is (Seed * 1103515245 + 12345) mod 2147483648,
    retractall(rand_seed(_)),
    assertz(rand_seed(NewSeed)),
    Valore is NewSeed / 2147483648.

% Specifica che il predicato main è il punto di ingresso
:- initialization(main).