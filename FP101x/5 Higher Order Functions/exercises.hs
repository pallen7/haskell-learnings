{-
1 Show how [f x | x <- xs, p x] can be re-expressed using map and filter
-}
doubleodd = map (*2) . filter odd

{-
2 define all, any, takewhile & dropwhile
-}
all' :: (a -> Bool) -> [a] -> Bool
all' f xs = and [f x | x <- xs]
useall = all' even [2,4,6,9]

any' :: (a -> Bool) -> [a] -> Bool
any' f xs = or [f x | x <- xs]
useany = any' odd [2,4,6,9]

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (x:xs)
    | f x       = x : takeWhile' f xs
    | otherwise = []

usetakeWhile = takeWhile' (>10) [1..]

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' f (x:xs)
    | f x       = dropWhile' f xs
    | otherwise = x : xs

usedropWhile = dropWhile' (<10) [1..20]

{-
3 map f and filter p using foldr
-}
map' :: (a -> b) -> [a] -> [b]
map' f = foldr(\x xs -> f x : xs) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr(\x xs -> if f x then x : xs else xs) []

{-
4 use foldl to write dec2int that converts [2,3,4,5] to 2345
-}
dec2int :: [Int] -> Int
dec2int = foldl(\acc n -> acc*10 + n) 0

filter2' :: (a -> Bool) -> [a] -> [a]
filter2' f = foldl(\x xs -> if f x then x : xs else xs) []


