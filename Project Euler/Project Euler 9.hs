-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

-- a^2 + b^2 = c^2
-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
-- so 3+4+5 = 12

-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.

-- So we only know our starting number and that there is exactly one set

-- 3^2 = 9
-- 4^2 = 16
-- 5^2 = 25
-- 6^2 = 36
-- 7^2 = 49
-- 8^2 = 64
-- 9^2 = 81
-- 10^2 = 100

-- hmmmmm...
-- 3^2 + 4^2 = 5^2	= 25
-- So 6^2 + 8^2 = 10^2.... How convenient!!!  6 + 8 + 10 = 14

-- so:  We have a pattern

-- 3^2 + 4^2 = 5^2    	True = 25
-- 6^2 + 8^2 = 10^2    	True = 100    + 75
-- 9^2 + 12^2 = 15^2    True = 225    + 125
-- 12^2 + 16^2 = 20^2   True = 400    + 175
-- 15^2 + 20^2 = 25^2	True = 625    + 225
-- 18^2 + 24^2 = 30^2   True = 900    + 275
-- ...

-- Let's think about squares
-- ...   ....    .....
-- ... + .... =  .....
-- ...   ....    .....
--       ....    .....
--               .....

-- a = multiples of 3
-- b = multiples of 4
-- c = multiples of 5

-- Test to see if the above patter is the actual solution.
fx :: [(Int, Int, Int, Int)]
fx = [(a, b, c, a+b+c) | a <- [3,6..500], b <- [4,8..500], c <- [5,10..1000], a < b, b < c, a^2 + b^2 == c^2]
-- Bugger.. Unfortunately it isn't...

-- Let's go with something different:
fx2 :: [(Int, Int, Int, Int)]
fx2 = [(a, b, c, a+b+c) | a <- [100..500], b <- [150..500], c <- [200..700], a+b+c == 1000, isPythagoreanTriplet (a,b,c)]

isPythagoreanTriplet :: (Int, Int, Int) -> Bool
isPythagoreanTriplet (a,b,c) = a^2 + b^2 == c^2 && a < b && b < c

-- Ok it works but it's not very elegant

getPythagProduct :: Int
getPythagProduct = head ([a*b*c | a <- [100..500], b <- [150..500], c <- [200..700], a+b+c == 1000, isPythagoreanTriplet (a,b,c)])













