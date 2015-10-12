-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

-- What is the 10 001st prime number?

divides :: Int -> Int -> Bool
divides x y = x `mod` y == 0

lowestDivisible :: Int -> Int -> Int
lowestDivisible x y
  | divides x y = y
  | y^2 >= x = x
  | otherwise = lowestDivisible x (y+1)

isPrime :: Int -> Bool
isPrime x = lowestDivisible x 2 == x

findPrime :: Int -> Int -> Int
findPrime x y
  | isPrime x && y == 1  = x
  | isPrime x            = findPrime (x+1) (y-1)
  | otherwise            = findPrime (x+1) (y)
  
findPrimeN :: Int -> Int
findPrimeN x = findPrime 2 x
