type Bit = Int

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

all2 :: (a -> Bool) -> [a] -> Bool
all2 p xs = foldl (&&) True (map p xs)

any' :: (a -> Bool) -> [a] -> Bool
any' f xs = or [f x | x <- xs]
useany = any' odd [2,4,6,9]

any2 :: (a -> Bool) -> [a] -> Bool
any2 p xs = foldr (||) True (map p xs)

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

{-
5 why is sumsqreven = compose [sum, map (^2), filter even] invalid?
-- because sum maps from [a] -> a
-}
compose :: [a -> a] -> (a -> a)
compose = foldr (.) id

{-
6 curry: convert a function that takes a pair into a function that takes it's arguments one at a time
-}
curry' :: ((a,b) -> c) -> a -> b -> c
curry' f = \x y -> f (x,y)

{-
6 uncurry
-}
uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f = \(x,y) -> f x y

{-
7 unfold
Rewrite chop8, map f, iterate f using unfold
-}
unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
unfold p h t x
    | p x        = []
    | otherwise  = h x : unfold p h t (t x)

int2bin = unfold (== 0) (`mod` 2) (`div` 2)

chop8a             :: [Bit] -> [[Bit]]
chop8a []           = []
chop8a bits         = take 8 bits : chop8a (drop 8 bits)

chop8b = unfold null (take 8) (drop 8)

mapb       :: (a -> b) -> [a] -> [b]
mapb f      = unfold null (f . head) (tail)

iterate2      :: (a -> a) -> a -> [a]
iterate2 f     = unfold (const False) id f



