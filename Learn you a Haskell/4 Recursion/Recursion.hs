-- As there are no loops in Haskell it's important to be able to think of things recursively
-- Usually you think of your edge case (i.e. reaching the last element in an array or reaching 0 when you've started at a given number).
-- The edge case is usually a node that doesn't have any children. Often the edge case turns out to be an identity.

-- Examples:
sum' :: Num a => [a] -> a
sum' []     = 0
sum' (x:xs) = x + sum' xs

product' :: Num a => [a] -> a
product' []     = 1					-- Edge case for multiplication is 1 as this is the identity for multiplication
product' (x:xs) = x * product' xs

max' :: Ord a => [a] -> a
max' []    = error "empty list"		-- Exception
max' [x]   = x						-- Edge case.
max' (x:xs)
     | x > nextMax  = x
	 | otherwise    = nextMax
	 where nextMax  = max' xs
	 
zip' :: [a] -> [b] -> [(a,b)]
zip' _ []         = []
zip' [] _         = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

-- Quick sort... take the first element and sort into 2 lists. One with elements gt than the first one
-- the second with lte.. then we do this recursively over each set of smaller and larger elements
quicksort :: (Ord a) => [a] -> [a]
quicksort []     = []
quicksort (x:xs) = smallerList ++ [x] ++ biggerList
        where biggerList = quicksort [y | y <- xs, y > x]
              smallerList = quicksort [y | y <- xs, y <= x]