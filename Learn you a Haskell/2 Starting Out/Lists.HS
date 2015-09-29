-- concatenation ++
-- note: works from left to right so large lists will have a performance cost
concat' :: [a] -> [a] -> [a]
concat' (xs) (ys) = xs ++ ys

-- item at the beginning of a list (aka cons operator)
cons' :: a -> [a] -> [a]
cons' x (ys) = x : ys

-- lists are just syntactic sugar for 1:2:3:[]
buildList :: [Int]
buildList = 1:2:3:[]

-- Get different elements of lists

-- head
head' :: [a] -> a
head' [] 	= error "empty list"
head' (xs) 	= head xs

-- tail
tail' :: [a] -> [a]
tail' [] 	= error "empty list"
tail' (xs) 	= tail xs

-- last
last' :: [a] -> a
last' [] 	= error "empty list"
last' (xs) 	= last xs

-- init
init' :: [a] -> [a]
init' [] 	= error "empty list"
init' (xs) 	= init xs

-- !! gets an element from a 0 indexed list

-- elem tells us if an element is a part of a list
elem' :: Ord a => a -> [a] -> Bool
elem' x []	 	= False
elem' x (ys)	= x `elem` ys
