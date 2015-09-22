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