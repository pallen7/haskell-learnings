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