--A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

--Find the largest palindrome made from the product of two 3-digit numbers.

-- seems sensible(??) to find the highest palindromes starting from 999*999
-- then apply palindrome 'mod' x == 0 and palindrome / x > 99

-- In hindsight the below is pretty bad...:

-- 1) Create an isPalindrome function
isPalindrome :: Int -> Bool
isPalindrome x = reverse (show x) == show x

getHighestPalindrome :: Int -> Int
getHighestPalindrome 0 = 0
getHighestPalindrome x
  | isPalindrome x = x
  | otherwise      = getHighestPalindrome (x-1)

highestProduct :: Int -> Int -> Int
highestProduct 1 y = 1
highestProduct x y
  | y `mod` x == 0 = x
  | otherwise = highestProduct (x-1) y
  
runPalindrome :: Int -> Int
runPalindrome 0 = 0
runPalindrome x
  | (getHighestPalindrome x) `div` (highestProduct 999 (getHighestPalindrome x)) < 1000  = x
  | otherwise = runPalindrome (getHighestPalindrome (x-1))

doThisTerribleStuff = runPalindrome (999*999)