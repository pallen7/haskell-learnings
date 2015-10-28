-- Generators
-- In mathematics comprehension notation can be used to construct new sets from existing sets
-- <- means to "draw from"
-- | means "such that"
-- x <- [1..5] is a generator (generates a new set)
--  i.e.

list1 = [x^2 | x <- [1..5]]

-- A list comprehension can have more than one generator and all possible pairings are produced:
list2 = [(x,y) | x <-[1,2,3], y <- ['a'..'b']]

-- Later generators are processed after earlier generators so they can depend upon values drawn from earlier generators
list3 = [(x,y) | x <-[1,2,3], y <-[x..3]]

concat' :: [[a]] -> [a]
concat' xss = [x | xs <- xss, x <- xs]

-- Wildcard patterns can also be used with list comprehensions
-- i.e.
length' :: [a] -> Int
length' xs = sum[1 | _ <- xs]

-- Guards can be used in list comps and they are pretty much like Where clauses (to my small brain..)
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

-- this allows us to define a pretty straight forward (but ineffecient) prime test
prime :: Int -> Bool
prime x = factors x == [1,x]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

getVals :: Eq a => a -> [(a,b)] -> [b]
getVals key xs = [v |(k,v) <- xs, k==key]

pairs = [(1,"bob"),(1,"jim"),(2,"joe"),(3,"paul")]