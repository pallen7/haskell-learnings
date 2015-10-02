-- Similar to Set comprehensions
-- Take a set of values
-- Bind each element
-- Maybe apply a filter
-- Do something with each value
-- Turn the result into a new set

-- i.e.
doubleList :: [Int] -> [Int]
doubleList xs = [x*2 | x <- xs]

doubleListBetween :: Int -> Int -> [Int]
doubleListBetween a b = [x*2 | x <- [a..b]]

doubleEvenNumbers :: [Int] -> [Int]
doubleEvenNumbers xs = [x*2 | x <- xs , even x]

-- The return type from the list can be different to the input type
evenOrOdd :: [Int] -> [(Int, String)]
evenOrOdd xs = [if even x then (x,"even") else (x,"odd") | x <- xs]

-- Not in Haskell is /=
removeEvilNumbers :: [Int] -> [Int]
removeEvilNumbers xs = [x | x <- xs, x /= 5, x /= 7, x /= 13]

-- We can combine values from several lists
-- This ends up as a cartesian (I think...) product
suits :: [String]
suits = ["Clubs", "Hearts" ,"Spades", "Diamonds"]

values :: [String]
values = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]

makeCards :: [String] -> [String] -> [String]
makeCards xs ys = [x ++ " of " ++ y | x <- xs, y <- ys]

-- Tuples have a set amount of elements (2 = pair, 3 = triple). The elements can be different types but
-- each tuple has to be the same shape. i.e.
getFirst :: [(String, Bool)] -> [String]
getFirst (xs) = [fst x | x <- xs, snd x == True]

-- Note: fst and snd only work on Pairs, not triples or Tuples with more than 2 elements

-- zip: takes 2 lists and 'zips' them together into a list of tuples
-- Example usage zipping a finite list with an infinite one. This works as Haskell is lazy
-- useZip ["Jon","Bob","Fred","Paul"] [1..]

useZip :: [String] -> [Int] -> [(String, Int)]
useZip xs ys = zip xs ys



