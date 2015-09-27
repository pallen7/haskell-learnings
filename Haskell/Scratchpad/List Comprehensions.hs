doubleIntList :: [Int] -> [Int]
doubleIntList []	= []
doubleIntList (xs)	= [x*2 | x <- xs]

doubleNumList :: Num a => [a] -> [a]
doubleNumList []	= []
doubleNumList (xs)	= [x*2 | x <- xs]

takeEvens :: Integral a => [a] -> [a]
takeEvens []	= []
takeEvens (xs)	= [x | x <- xs, even x]