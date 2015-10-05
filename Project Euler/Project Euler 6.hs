-- The sum of the squares of the first ten natural numbers is,

-- 1^2 + 2^2 + ... + 10^2 = 385
-- The square of the sum of the first ten natural numbers is,

-- (1 + 2 + ... + 10)2 = 552 = 3025
-- Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.

-- Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

-- Should really use a formula to work this out....

sumOfSquares :: Int -> Int
sumOfSquares x = sum [a^2 |a <- [1..x]]

squareOfSums :: Int -> Int
squareOfSums x = (sum [a |a <- [1..x]]) ^ 2

diffSquares :: Int -> Int
diffSquares x = (squareOfSums x) - (sumOfSquares x)