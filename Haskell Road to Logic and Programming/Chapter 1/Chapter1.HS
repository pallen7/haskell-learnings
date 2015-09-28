-- 1.9 get the maximum element from a list using recursion
maxInt :: [Int] -> Int
maxInt [] 		= error "empty list"
maxInt [x] 		= x
maxInt (x:xs) 	= x `max` (maxInt xs)  -- max converted to an infix operator using ``

-- 1.10 remove the 
-- [1,2,3,2]
-- remove 2
-- first pass we move to the next element so we will have [2,3,2] and x will be 1
-- next we have the 2 so return the list with this element removed
-- then append to the front the remaining elements recursively
-- This is a bit buggy as doesn't wor
removeFst :: [Int] -> Int -> [Int]
removeFst (xs) m  	|	xs == []		= []					-- If we pass in an empty list return this
removeFst (x:xs) m  |	x == m 			= xs					-- If we have reached the element to remove then return the list minus this element
removeFst (x:xs) m	|	xs == []		= [x]					-- If we have stripped the last element and it's not m then return element as a list
removeFst (x:xs) m	|	otherwise		= x : removeFst xs m	-- Otherwist move to the next element

-- Alternative solution from the solutions
-- Better solution to mix guards and pattern matching
-- Also the book says use Integers not Eq....!!!
removeFst2 :: Eq a => a -> [a] -> [a]
removeFst2 x [] = []
removeFst2 x (y:ys) | x == y 	= ys
					| otherwise = y : (removeFst2 x ys)

					
-- 1.13 number of occurrences in a string
countChar :: String -> Char -> Int
countChar [] y		= 0
countChar (x:xs) y 	| x == y	= 1 + countChar xs y
					| otherwise	= countChar xs y

-- 1.14 Function blowup with signature String -> String that changes bang! into baannngggg!!!!!
blowup :: String -> String
blowup 	[] 			= []
blowup	(xs)		= blowupnum xs 1

blowupnum :: String -> Int -> String
blowupnum [] m		= []
blowupnum (x:xs) m	= repeatchar m x ++ blowupnum xs (m+1)

repeatchar :: Int -> Char -> String
repeatchar m x 		| m < 1 	= error "repeat < 0"
					| m == 1 	= [x]
					| otherwise	= x : repeatchar (m-1) x

-- 1.15 Write a function strString :: [String] -> [String] that sorts a list of strings in alphabetical order
-- Note: Can use min to compare 2 strings
-- 1) 	Need to implement a function to find the minimum string in the list
--		If we have an empty list return []
--		If we have 1 element return that element
-- 		otherwise call minString again and compare the current string with the output
-- 2) 	Need a function to remove the first occurrence of a given element
--		If the list is empty return an empty list
--		If list has one element and it's not the element we are looking for return that element as a list (same behaviour as multiple and no match..?)
--		If the list has one element and it is what we are looking for then return []
--		If the list has multiple elements and the first one isn't what we are looking for then move onto the next element and save that one
--		If the list has multiple elements and it is the one we are searching for then return the rest of the list
-- 3)	If we have an empty list return this
--		If we've got one element return this
--		Otherwise get the remove an element using fstString where the string to remove is the minString (uses where)

minString :: [String] -> String
minString []		= []
minString [x]		= x
minString (x:xs)	= min x (minString xs)

fstString :: [String] -> String -> [String]
fstString [] y = 	[]
fstString (x:xs) y	| x == y	= xs
					| otherwise	= x: fstString xs y

strString :: [String] -> [String]
strString []		= []
strString [x]		= [x]
strString (xs)		= x : (strString (fstString xs x)) where x = minString xs

-- Alternatively this is the solution from the book using types that are in the Ord type class meaning that you can do size comparisons
-- this means that we can create a general case for ordering a list of elements
minVal :: Ord a => [a] -> a
minVal []		= error "empty list"
minVal [x]		= x
minVal (x:xs)	= min x (minVal xs)

rmvFstMatch :: Eq a => [a] -> a -> [a]
rmvFstMatch [] y = 	[]
rmvFstMatch (x:xs) y	| x == y	= xs
						| otherwise	= x: rmvFstMatch xs y

orderMe :: Ord a => [a] -> [a]
orderMe []		= []
orderMe [x]		= [x]
orderMe (xs)	= x : (orderMe (rmvFstMatch xs x)) where x = minVal xs

-- Exercise 1.17 Write a function substring :: String -> String :: Bool
-- First we can check if xs is a prefix of ys
-- If it's not then remove the first character of ys and see if xs is a prefix of ys
prefix :: String -> String -> Bool
prefix [] (ys) 			= True
prefix (xs) []			= False
prefix (x:xs) (y:ys)	= x == y && prefix xs ys	

removeFstStr :: String -> String
removeFstStr [] 		= []
removeFstStr [x]		= []
removeFstStr (x:xs)		= xs

subStr :: String -> String -> Bool
subStr [] (ys) 			= True
subStr (xs) []			= False
subStr (xs) (ys)	|	prefix xs ys 	= True
					|	otherwise		= subStr xs (removeFstStr ys)
					
					
-- -- Official solution. More elegant:
-- substring :: String -> String -> Bool
-- substring [] ys 		= True
-- substring (x:xs) [] 	= False
-- substring (x:xs) (y:ys) = 	((x==y) && (prefix xs ys))
							-- || (substring (x:xs) ys)		-- makes sense!!



-- Our own version of map
map' :: (a -> b) -> [a] -> [b]
map' f [] 		= []
map' f (x:xs)	= (f x) : map' f xs

-- Our own version of filter
filter' :: (a -> Bool) -> [a] -> [a]
filter' p []		= []
filter' p (x:xs)	| p x		= x : filter' p xs
					| otherwise = filter' p xs

-- 1.20: Example usage : lengths [["zebra"],["dog","cat","rabbit"]]
lengths :: [[a]] -> [Int]
lengths [] 		= []
lengths (xs)	= map length xs

-- 1.21
sumLengths :: [[a]] -> Int
sumLengths []	= 0
sumLengths (xs)	= sum (lengths xs)

-- another way to express this using '.' for function composition is:
sumLengths' :: [[a]] -> Int
sumLengths'	= sum . lengths

a = 3
b = 4
f :: Integer -> Integer -> Integer
f x y = x^2 + y^2

g :: Integer -> Integer
g 0 = 1
g x = 2 * g (x-1)

mySum :: Num a => [a] -> a
mySum [] 		= 0
mySum (x:xs)	= x + (mySum xs)