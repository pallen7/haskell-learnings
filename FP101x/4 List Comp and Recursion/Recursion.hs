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








