-- There are very similar patterns to recursion on lists
-- f[]     = v
-- f(x:xs) = x O f xs --- O is the function to apply

-- i.e.
-- sum[]     = 0                    -- v replaced with 0
-- sum(x:xs) = x + sum xs           -- Here we have replaced O with +

-- product[]     = 1                -- v replaced with 1
-- product(x:xs) = x * product xs   -- Here we have replaced O with *

-- This common pattern of recursively descending over a list has been wrapped up in foldr
-- This starts with the empty element and folds from r -> l

sum' = foldr (+) 0
product' = foldr (+) 1
or' = foldr (||) False
and' = foldr (&&) True

{-
Definition for foldr.

Can be thought of as similar to the below.

so if sum equals:
sum' = foldr (+) 0

sum' [1,2,3]                                -- apply sum
(+) 1 (foldr' (+) 0 [2,3])                  -- apply foldr'
(+) 1 ((+) 2 foldr((+) 0 [3]))              -- apply foldr'
(+) 1 ((+) 2 ((+) 3 (foldr'((+) 0 []))))    -- apply foldr ' with empty list
(+) 1 ((+) 2 ((+) 3 ((+) 0))

when applying the function the accumulator is the rhs and the value the lhs

-}
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v []     = v
foldr' f v (x:xs) = f x (foldr' f v xs)

length' = foldr (\x acc -> acc + 1) 1