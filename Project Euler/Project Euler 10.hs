-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
-- Find the sum of all the primes below two million.

-- Let's create some functions to find primes
ldf :: Int -> Int -> Int
ldf x y
  | x^2 > y        = y
  | y `mod` x == 0 = x
  | otherwise      = ldf (x+1) y
  
isPrime :: Int -> Bool
isPrime x = (ldf 2 x) == x

sumPrimesUpToX :: Int -> Int
sumPrimesUpToX x = sum $ 2 : [a | a <- [3,5..x], isPrime a]