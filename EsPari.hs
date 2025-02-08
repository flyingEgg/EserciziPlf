main :: IO ()

main = do
    replicate 10 $ putStrLn "Inserisci i numeri"
    input <- getLine

    let numeri = map read (words input) :: [Int]

    let pari = filtraPari numeri

    let sommaPari = somma pari

    putStrLn ("I pari sono: " ++ show pari)
    putStrLn("La somma dei pari e': " ++ show sommaPari)

filtraPari :: [Int] -> [Int]
filtraPari = filter (\x -> x `mod` 2 == 0)


doubleIt :: Int -> Int
doubleIt x = x * 2               

somma :: [Int] -> Int
somma = foldr (+) 0