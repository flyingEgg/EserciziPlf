
sommaPari :: [Int] -> Int                       -- Funzione che data una lista, somma tutti i pari
sommaPari xs = let  
    evens = filtra even xs  
    in foldr (+) 0 evens    

sommaDispari :: [Int] -> Int                    -- Funzione che data una lista, somma tutti i dispari
sommaDispari xs = let   
    odds = filtra odd xs    
    in foldr (+) 0 odds 


filtra :: (a -> Bool) -> [a] -> [a]             -- Funzione di filtraggio 
filtra _ []     = []    
filtra p (x:xs) 
    | p x       = x : filtra p xs   
    | otherwise = filtra p xs   

testa :: [a] -> a                               -- Estrazione di testa da lista
testa (x : _) = x   

coda :: [a] -> [a]                              -- Estrazione di coda da lista
coda (_ : xs) = xs  

lunghezza :: [a] -> Int                         -- Lunghezza di una lista
lunghezza [] = 0    
lunghezza (_ : xs) = 1 + lunghezza xs   

inverti :: [a] -> [a]                           -- Inversione di una lista
inverti  [] = []    
inverti (x:xs) = inverti xs ++ [x]  

nEsimoFibonacci :: Int -> Int                   -- Dato n, n-esimo numero della successione di Fibonacci
nEsimoFibonacci 0 = 0   
nEsimoFibonacci 1 = 1   
nEsimoFibonacci n   
    | n > 1 = nEsimoFibonacci(n - 1) + nEsimoFibonacci(n - 2)

fattoriale :: Int -> Int                        -- Dato n, calcolo di n!
fattoriale 0 = 1    
fattoriale 1 = 1    
fattoriale n    
    | n > 1 = n * fattoriale(n - 1)

fondi :: (Ord a) => [a] -> [a] -> [a]
fondi xs [] = xs
fondi [] ys = ys
fondi lx@(x : xs) ly@(y : ys) 
    | x < y =  x :     fondi xs ly
    | x == y = x : y : fondi xs ys
    | x > y =  y :     fondi lx ys




rimuoviDoppi :: (Eq a) => [a] -> [a]            -- Data una lista, rimozione dei doppi
rimuoviDoppi [] = []    
rimuoviDoppi (x:xs) 
    | x `elem` xs = rimuoviDoppi xs 
    | otherwise = x : rimuoviDoppi xs   


checkPalindroma :: (Eq a) => [a] -> Bool        -- Data una lista, controllo se è palindroma (con esistente funzione "inverti")
checkPalindroma xs
    | xs == inverti xs     = True
    | otherwise            = False

contaOccorrenze :: (Eq a) => a -> [a] -> Int    -- Dati "a" ed una lista, conta delle occorrenze di "a" nella lista 
contaOccorrenze a [] = 0
contaOccorrenze a (x:xs)
    | a == x        = 1 + contaOccorrenze a xs
    | otherwise     = contaOccorrenze a xs

isPresent :: (Eq a) => a -> [a] -> Bool         -- Dati "a" ed una lista, interrogazione se "a" è o non è presente in essa
isPresent a []  = False
isPresent a xs
    | a `elem` xs = True
    | otherwise   = False 

doppio :: [Int] -> [Int]                        -- Data una lista di interi, raddoppia ogni elemento
doppio [] = []
doppio (x:xs) =
    let d = 2 * x
    in [d] ++ doppio xs

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = 
    quickSort xs_sx ++ [x] ++ quickSort xs_dx
    where
        xs_sx = filter (<= x) xs
        xs_dx = filter (> x) xs
    