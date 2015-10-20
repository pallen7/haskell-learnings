-- Imagine we have a connect 4 board and 2 different colour discs.
-- We can only use 1 column. How many combinations can we have?
-- If we then have 3 different coloured discs how many combinations can we have? This will be the product but let's build
-- some patterns to check this. When we have multiple discs and some are the same colour what is the effect?

-- inserts an element into a given position in a list
insert :: [a] -> a -> Int -> [a]
insert [] y n = [y]
insert xs y n = (take n xs) ++ [y] ++ (drop n xs)

-- usage [1,2] 3 0 = [[1,2,3],[1,3,2],[3,1,2]]
addElement :: [a] -> a -> Int -> [[a]]
addElement [] y n   = [[y]]
addElement xs y n
  | length xs == n  = [xs ++ [y]]
  | otherwise       = addElement xs y (n+1) ++ [insert xs y n]

-- takes a list of lists (i.e. [[1,2],[2,1]]) and performs an add Element for y on each member of the list
addElement2 :: [[a]] -> a -> [[a]]
addElement2 [] _ = []
addElement2 (x:xs) y = (addElement x y 0) ++ (addElement2 xs y)

-- takes a list and explodes it into a list of lists
explode :: [a] -> [[a]] -> [[a]]
explode [] ys = ys
explode (x:xs) ys = explode xs (addElement2 ys x)

extrapolate :: [a] -> [[a]]
extrapolate [] = [[]]
extrapolate xs = explode xs [[]]

unique :: Eq a => [a] -> [a]
unique [] = []
unique xs = foldl (\acc x -> if x `elem` acc then acc else x : acc) [] xs

combinations :: Eq a => [a] -> Int
combinations = length . unique . extrapolate