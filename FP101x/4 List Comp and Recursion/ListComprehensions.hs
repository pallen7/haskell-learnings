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

-- this allows us to define a pretty straight forward (but inefficient) prime test
prime :: Int -> Bool
prime x = factors x == [1,x]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

getVals :: Eq a => a -> [(a,b)] -> [b]
getVals key xs = [v |(k,v) <- xs, k==key]

pairs = [(1,"bob"),(1,"jim"),(2,"joe"),(3,"paul")]

-- zip takes 2 list and zips the results together into a list of pairs
myZipList = zip ['a','b','c'] [1,2,3,4]

adjacent :: [a] -> [(a,a)]
adjacent xs = zip xs $ tail xs

-- 'and' takes a list of boolean values and logically ands them all together.
-- this way we can take a list and use adjacent to see if the list is ordered
sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x,y) <- adjacent xs]

-- Pythagoras : x^2 + y^2 = z^2
-- i.e. pyths 10 = (3,4,5)(4,3,5)(6,8,10)(8,6,10)
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- A perfect number is one that equals the sum of it's factors
-- i.e. perfects 500 = [6,28,496]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (init (factors x)) == x]



f = concat [[(x,y) | y <- [4,5,6]] | x <- [1,2,3]]




