-- Pattern Matching. Separate functions for different patterns. Works from top to bottom
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN"
lucky x = "Sorry you're out of luck"

sayMe :: (Integral a) => a-> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe 5 = "Five"
sayMe x = "Nope..."

-- Simple recursion
simpleGuard :: Int -> Int
simpleGuard x
	| x > 10 = 10
	| otherwise = 0

returnEvenOrZero :: Int -> Int
returnEvenOrZero x
	| even x = x
	| otherwise = 0
	
evenFibonacci4Mil :: Int -> Int -> Int -> Int
evenFibonacci4Mil x y tot
	| y > 4000000 = tot
	| otherwise = fibonacci y (x+y) ((returnEvenOrZero y)+tot)
	