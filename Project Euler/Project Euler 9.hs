-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

-- a2 + b2 = c2
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

--- SOOOOOooooo... that aint the pattern :o(