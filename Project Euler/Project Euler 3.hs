-- x `div` y (infix integer division)
largestFactor :: Int -> Int -> Int
largestFactor value factor
	| value `mod` factor == 0 = value `div` factor
	| (factor * factor) >= value = value
	| otherwise = largestFactor value (factor+1)

	
largestPrime :: Int -> Int
largestPrime x
	| x == 2 || largestFactor x 2 == x = x
	| otherwise = largestPrime (largestFactor x 2)