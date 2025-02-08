fattoriale :: Integer -> Integer
fattoriale 0 = 1
fattoriale n
    | n > 0 = n * fattoriale (n - 1)

inverti :: [Integer] -> [Integer]
inverti [] = []
inverti (x:xs) = do
    inverti xs ++ [x]

isPalindroma :: [Integer] -> Bool
isPalindroma [] = True
isPalindroma ns
    |  ns == inverti ns = True
    | otherwise         = False

-- es Media aritmetica
somma :: [Integer] -> Integer
somma []     = 0
somma (x:xs) = x + somma xs

lunghezza :: [Integer] -> Integer
lunghezza []     = 0
lunghezza (_:xs) = 1 + lunghezza xs

media :: [Integer] -> Integer
media [] = 0
media xs = somma xs `div` lunghezza xs
-- #############################

-- es Scartare i multipli dispari di 5
multiplodisparifive :: Integer -> Bool
multiplodisparifive n
    | n `mod` 5 == 0 = controlladispari n
    | otherwise      = False
    where
        controlladispari num = num `mod` 2 /= 0

scartaMultipliDispariFive :: [Integer] -> [Integer]
scartaMultipliDispariFive [] = []
scartaMultipliDispariFive (x:xs)
    | multiplodisparifive x == False = [x] ++ scartaMultipliDispariFive xs
    | otherwise                      = scartaMultipliDispariFive xs 
-- #############################

-- es Scarta anni bisestili da lista di interi non negativi
verificaBisestile :: Integer -> Bool
verificaBisestile 0 = True
verificaBisestile y
    | y `mod` 400 == 0 = True
    | y `mod` 100 == 0 = False
    | y `mod` 4 == 0   = True
    | otherwise        = False

scartaBisestili :: [Integer] -> [Integer]
scartaBisestili [] = []
scartaBisestili (x:xs)
    | verificaBisestile x == False = [x] ++ scartaBisestili xs
    | otherwise                    = scartaBisestili xs
-- #############################

-- es Somma dei quadrati dei numeri pari
trovaQuadratiPari :: (Integral a) => [a] -> [a]
trovaQuadratiPari [] = []
trovaQuadratiPari (x:xs)
    | x `mod` 2 == 0 = [(x * x)] ++ trovaQuadratiPari xs
    | otherwise      = trovaQuadratiPari xs 

sommaQuadratiPari :: [Integer] -> Integer
sommaQuadratiPari [] = 0
sommaQuadratiPari xs = somma (trovaQuadratiPari xs)
-- #############################

-- es Numero minimo della seconda coppia di numeri di una lista di coppie
minCoppia :: (Ord a) => (a, a) -> a
minCoppia (n, m)
    | n < m     = n
    | otherwise = m

secondo :: [(Int, Int)] -> (Int, Int)
secondo (_:x:_) = x

minSec :: [(Int, Int)] -> Int
minSec []   = -1
minSec xs   = minCoppia (secondo xs)

-- Extra: lista con i numeri minimi di ogni coppia della lista in input
minOgniCoppia :: [(Int, Int)] -> [Int]
minOgniCoppia [] = error "Lista vuota"
minOgniCoppia xs = map minCoppia xs
-- #############################

-- es Numero massimo della prima coppia *(come scritto sopra)
maxCoppia :: (Ord a) => (a, a) -> a
maxCoppia (n, m)
    | n > m     = n
    | otherwise = m

primo :: [(Int, Int)] -> (Int, Int)
primo (x:_) = x

maxPrimo :: [(Int, Int)] -> Int
maxPrimo [] = -1
maxPrimo xs = maxCoppia (primo xs)
-- #############################

-- es Media Geometrica
mediaGeometrica :: [Float] -> Float
mediaGeometrica [] = 0
mediaGeometrica xs = (product (xs) ** (1/fromIntegral(length xs)))
-- #############################