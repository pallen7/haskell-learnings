{- A function is higher order if it takes a function as an argument or returns a function
as a result

- Common patterns can be abstracted into Higher Order Functions to avoid repetitions
- Domain specific languages can be defined as collections of higher-order functions. I.e. the simple
language used to process lists
- Algebraic properties help use reason about programs. These hold irrespective of what you pass to the functions.

-}


-- i.e: twice takes a function as it's first argument. We need the brackets to be explicit on the first parameter
-- as the parameters assocate to the right:
-- same as: (a -> a) -> (a -> a)
twice :: (a -> a) -> a -> a
twice f x = f (f x)

-- Processing lists:
map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs]

usemap1 = map' (+1) [1,2,3]
usemap2 = map' reverse ["abc", "123", "def"]

-- map can also be applied to itself to map over a list of lists (the outer map maps the inner map to the inner list)
usemap3 = map'(map'(+1)) [[1,2,3],[4,5,6]]

-- The map function can also be defined using recursion which is preferable for reasoning purposes (learn about that later!!)
map2 :: (a -> b) -> [a] -> [b]
map2 _ []     = []
map2 f (x:xs) = f x : map f xs

usemap4 = map2 (+1) [1,2,3]

-- Filter
filter' :: (a -> Bool) -> [a] -> [a]
filter' f xs = [x | x <- xs, f x]

usefilter1 = filter' even [1,2,3,4]

-- Map and filter are often used together
usemapfilter = sum (map' (^2) (filter' even [1,2,3,4,5,6]))

-- Other common HOF list functions
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
    | otherwise = xs

usedropWhile = dropWhile' (<10) [1..20]



