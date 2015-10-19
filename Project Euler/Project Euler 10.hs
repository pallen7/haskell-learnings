-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
-- Find the sum of all the primes below two million.

-- The below is a fairly slow trial division method with a few shortcuts
-- Need to write a faster primality test...!!

-- Must feed an odd number into the below function and we'll just test odd numbers
ldf :: Int -> Int -> Int
ldf x y
  | x^2 > y        = y
  | y `mod` x == 0 = x
  | otherwise      = ldf (x+2) y
  
-- Only feed in odd numbers 7+
isPrime :: Int -> Bool
isPrime x
  | x `mod` 3 == 0 = False
  | x `mod` 5 == 0 = False
  | otherwise      = (ldf 3 x) == x

sumPrimesUpToX :: Int -> Int
sumPrimesUpToX x = sum $ 2:3:5: [a | a <- [7,9..x], isPrime a]

