-- Smallest number that all numbers multiply into:
-- 1 = 1
-- 1,2 = 2
-- 1,2,3 = 6
-- etc..s

--
-- Brute(ish) force recursive solution
--
smallestMultiple :: Int -> Int -> Int
smallestMultiple x y

smallestMultipleOfX :: Int -> Int -> Int -> Int
smallestMultiple x y increment
	| y `mod` x == 0 = y
	| otherwise = smallestMultiple x (y+increment) increment