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
notEvilNumber :: [Int] -> [Int]
notEvilNumber xs = [x | x <- xs, x /= 5, x /= 7, x /= 13]

-- We can combine values from several lists
-- This ends up as a cartesian (I think...) product

suits :: [String]
suits = ["Clubs", "Hearts" ,"Spades", "Diamonds"]

values :: [String]
values = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]

makeCards :: [String] -> [String] -> [String]
makeCards xs ys = [x ++ " of " ++ y | x <- xs, y <- ys]


