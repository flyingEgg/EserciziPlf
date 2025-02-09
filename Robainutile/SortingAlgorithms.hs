-- SELECTION SORT 
selectionSort :: (Ord a) => [a] -> [a]
selectionSort [] = []
selectionSort xs = let
    elementoMinimo = minimum xs
    rimanenti = removeFirst elementoMinimo xs
    in elementoMinimo : selecionSort rimanenti


removeFirst :: Eq a => a -> [a] -> [a]
removeFirst _ [] = []
removeFirst x (y:ys)
    | x==y  = ys                        -- Se y è il minimo, è già ordinato
    | otherwise = y : removeFirst x ys  -- y non è il minimo, continuo a cercare


-- BUBBLE SORT
bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort arr = bubbleSortHelper arr (length arr)
  where
    -- Funzione che esegue un passaggio del bubble sort
    bubbleSortHelper :: (Ord a) => [a] -> Int -> [a]
    bubbleSortHelper arr n
      | n <= 1 = arr
      | otherwise = bubbleSortHelper (bubblePass arr) (n - 1)

    -- Funzione che esegue un singolo passaggio sulla lista
    bubblePass :: (Ord a) => [a] -> [a]
    bubblePass [] = []
    bubblePass [x] = [x]
    bubblePass (x:y:xs)
      | x > y     = y : bubblePass (x : xs) -- Scambia se x > y
      | otherwise = x : bubblePass (y : xs) -- Altrimenti lascia i due in ordine

-- QUICK SORT
quicksort:: (Ord a) =>  [a] -> [a]
quicksort []        = [];
quicksort (x : xs) = quicksort xs_inf ++ [x] ++ quicksort xs_sup
 where
  xs_inf = filter (<= x) xs -- in alternativa: xs_inf = [x' | x' <- xs, x' <= x]
  xs_sup = filter (> x) xs -- in alternativa: xs_sup = [x' | x' <- xs, x' > x]

  