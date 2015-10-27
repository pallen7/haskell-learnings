-- 1: Using library functions, define a function halve :: [a] -> ([a],[a])
-- that splits an even-lengthed list into two halves
-- i.e. halve [1,2,3,4,5,6]  ([1,2,3],[4,5,6])

halve1 :: [a] -> ([a],[a])
halve1 [] = ([],[])
halve1 xs = (firsthalf, secondhalf)
   where halflen xs = length xs `div` 2
         firsthalf = (take (halflen xs) xs)
         secondhalf = (drop (halflen xs) xs)
		 
-- could also use the splitAt function and other variation on take/drop and splitAt
{-
-- answer d
halved xs = splitAt (length xs `div` 2)
-}


-- 1: define safetail which works the same as tail but maps an empty list to itself using:
-- a: conditional
-- b: guarded equations
-- c: pattern matching
-- (hint: use null)

safetaila :: [a] -> [a]
safetaila xs = if null xs then [] else tail xs

safetailb :: [a] -> [a]
safetailb xs | null xs   = []
             | otherwise = tail xs

safetailc :: [a] -> [a]
safetailc []     = []
safetailc (x:xs) = xs			--- Should be using _ not x as we don't want to evaluate x

-- 6 Show how the curried function mult x y z = x*y*z can be understood in terms of lambda expressions
multxyz :: Num a => a -> a -> a -> a
multxyz = \x -> (\y ->(\z -> x*y*z))



safetaild 
 = \xs ->
   case xs of
     [] -> []
     (_:xs)	  -> xs
   