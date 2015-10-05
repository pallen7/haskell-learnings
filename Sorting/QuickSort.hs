-- Quick sort... take the first element and sort into 2 lists. One with elements gt than the first one
-- the second with lte.. then we do this recursively over each set of smaller and larger elements
-- Unfortunately this is more or less ripped off from Learn you a haskell
-- written with 'where' instead of 'let in'
quicksort :: (Ord a) => [a] -> [a]
quicksort []     = []
quicksort (x:xs) = smallerList ++ [x] ++ biggerList
        where biggerList = quicksort [y | y <- xs, y > x]
              smallerList = quicksort [y | y <- xs, y <= x]