-- Patterns. Examples:
-- Pattern matching works from top to bottom and you need to ensure every pattern is matched
-- or you will get a non-exhaustive pattern exception
luckyNumber :: Int -> String
luckyNumber 1 = "You are lucky"
luckyNumber 2 = "You are not lucky"
luckyNumber x = "Don't know..."

-- Useful for recursion
addUp :: Int -> Int
addUp 0 = 0
addUp x = x + addUp (x - 1)

-- Pattern Matching with Tuples
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Underscore _ represents a generic variable when we don't really care what the value is:
-- If we want to pattern match to several variables we must wrap them in () i.e (x:xs)
fst' :: (Int, Int) -> Int
fst' (x, _) = x

-- When matching arrays we can use the : notation to strip values from the front
-- Always remember [1,2,3] is just syntactic sugar for 1:2:3:[]
toTriple :: [Int] -> (Int, Int, Int)
toTriple [] 		= (0,0,0)
toTriple (x:y:z:_)	= (x,y,z)		-- This has to come before the other patterns or you will get a pattern overloaded
toTriple (x:y:_)	= (x,y,0)		-- error as Haskell can't tell which pattern to use as it works top to bottom
toTriple (x:_)		= (x,0,0)

-- Alternatively:
toTriple2 :: [Int] -> (Int, Int, Int)
toTriple2 [] 			= (0,0,0)
toTriple2 (x:[])		= (x,0,0)
toTriple2 (x:y:[])		= (x,y,0)
toTriple2 (x:y:z:[])	= (x,y,z)
toTriple2 (x:y:z:_)		= error "too many elements"

-- Version of the head function using pattern matching
head' :: [a] -> a
head' [] 		= error "empty list"
head' (x:_)		= x

length' :: [a] -> Int
length' [] 		= 0
length' (_:xs)	= 1 + (length' xs)

sum' :: Num a => [a] -> a
sum' [] 		= 0
sum' (x:xs)		= x + sum' xs

-- As patterns (@) allow you to break a list up (i.e. (x:xs)) but still keep the remainder of the list (xs) without removing the head
firstLetter :: String -> String
firstLetter [] 			= "no first letter"
firstLetter all@(x:xs)	= "First letter of '" ++ all ++ "' is " ++ [x]

