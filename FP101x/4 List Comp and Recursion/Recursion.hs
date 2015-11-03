{-
From Wikipedia.
Traditionally, tail call elimination is optional. However, in functional programming languages, tail call elimination is often guaranteed by the language standard, and this guarantee allows using recursion, in particular tail recursion, in place of loops. In such cases, it is not correct (though it may be customary) to refer to it as an optimization. The special case of tail recursive calls, when a function calls itself, may be more amenable to call elimination than general tail calls.
-}
factorial1 :: Int -> Int
factorial1 n = product [1..n]

factorial2 :: Int -> Int
factorial2 0 = 1   -- identity for multiplication
factorial2 x = x * factorial2 (x-1)

{-
The above can be thought of as:

factorial 3
3 * factorial 2
3 * (2 * factorial 1)
3 * (2 * (1 * factorial 0))
3 * (2 * (1 * 1))
3 * (2 * 1)
3 * 2
6

If we call factorial (-1) this will cause a stack overflow as the base case will never be reached.
The recursive definition diverges on integers <0

-}

{-
The below n+k style used in the Programming in Haskell book has now been deprecated

factorial2 :: Int -> Int
factorial2 0 = 1
factorial2 (x+1) = (x+1) * factorial2 x
-}

-- Recursion on lists
product' :: Num a => [a] -> a
product' []     = 1
product' (x:xs) = x * product' xs

length' :: [a] -> Int
length' []     = 0
length' (_:xs) = 1 + length' xs

reverse' :: [a] -> [a]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]

-- recursion over multiple arguments
-- for every argument you need a base case...
zip' :: [a] -> [b] -> [(a,b)]
zip' []      _     = []
zip' _      []     = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

drop' :: Int -> [a] -> [a]
drop' 0 xs     = xs
drop' _ []     = []
drop' n (_:xs) = drop' (n-1) xs

append :: [a] -> [a] -> [a]
[]     `append` ys   = ys
(x:xs) `append` ys   = x : append xs ys 

-- The below 2 are examples of multiple recursion where we call the function more than once in its own body:
qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where larger  = [a | a <- xs, a > x]
        smaller = [b | b <- xs, b <= x]

{-
can be thought of as:
q [3,1,4,2,5]
      (q [1,2])       ++ [3] ++     (q [4,5])
(q [] ++ [1] ++ q[2]) ++ [3] ++ ([] ++ [4] ++ q [5])
[] ++ [1] ++ [2]... etc...

-}

--fibonacci = [0,1,1,2,3,5,8,13] etc...
--elements    [0,1,2,3,4,5,6,7]

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-2) + fibonacci (n-1)

{-
fibonacci 
-}


replicate' :: Int -> a -> [a]
replicate' 0 x = []
replicate' n x = x : replicate' (n-1) x

-- !! in standard prelude
elementAtPos :: [a] -> Int -> a
[]     `elementAtPos` _ = error "invalid location"
(x:xs) `elementAtPos` 0 = x
(x:xs) `elementAtPos` n = elementAtPos xs (n-1)

expo :: Int -> Int -> Int
_ `expo` 0 = 1
n `expo` 1 = n
n `expo` x = n * expo n (x-1)

-- and
and' :: [Bool] -> Bool
and' []     = True
and' (b:bs) = and' bs && b

merge :: [Int] -> [Int] -> [Int]
merge xs [] = xs
merge [] ys = ys
merge (x:xs)(y:ys) = if x < y then x : merge xs (y:ys) else y: merge (x:xs) ys

halve :: [Int] -> ([Int],[Int])
halve xs = splitAt (length xs `div` 2) xs

-- split [1,5,3,6]
-- split [1,5] split [3,6]
-- merge [1] merge [5] merge [3] merge [6]

msort :: [Int] -> [Int]
msort []  = []
msort [x] = [x]
msort xs  = merge (msort zs) (msort ys)
  where (ys, zs) = halve xs


