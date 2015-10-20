-- Imagine we have a connect 4 board and 2 different colour discs.
-- We can only use 1 column. How many combinations can we have?
-- If we then have 3 different coloured discs how many combinations can we have? This will be the product but let's build
-- some patterns to check this.

-- So let's come up with a pattern swapping sequence that will always give us a new list
-- for 2 elements:
-- swap (0,1)

-- for 3 elements:
-- swap (0,1)
-- swap (1,2)


swap :: [Int] -> (Int, Int) -> [Int]
swap [] _ = error "swap called on empty list"
swap xs (a,b) = (take a xs) ++ [(xs !! b)] ++ (substr xs (a+1) (b-a-1)) ++ [(xs !! a)] ++ drop (b+1) xs

substr :: [Int] -> Int -> Int -> [Int]
substr [] _ _ = error "substr called on empty list"
substr xs x y = take y $ drop x xs

bubbleUp :: [Int] -> Int -> [[Int]]
bubbleUp [] _ = []
bubbleUp xs y
  | y+1 == length xs = [xs]
  | otherwise        = xs : bubbleUp (swap xs (y, y+1)) (y+1)