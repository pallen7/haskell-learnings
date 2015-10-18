-- Typically used with the sole purpose of passing to a HOF.
-- synax: \xs -> do stuff

-- As functions are curried there is no need to use lambdas in situations like the below (but it's fun anyway)
noUseLambda = map (*3) [1..5]
useLambda = map (\x -> x*3) [1..5]

-- Need to read up on this more. Lambdas are (apparently) useful to make it obvious you are creating new functions
flipWithLambda :: (a -> b -> c) -> b -> a -> c
flipWithLambda f = \x y -> f y x

useFlip = map (flipWithLambda subtract 20) [1..5]

lambda1 = (\x -> x+1) 10
lambda2 = (\x y -> x + y ) 1 2

addOne = map (+1) [1..5]
addOneWithLambda = map (\x -> x+1) [1..5]

-- Comes in a lot more handy when you want to carry out a few operations on a given value without defining a function
doALotOfStuff = map (\x -> x^2 * 3) [1..10]


-- ** FOLDS::
-- Fold a list from left to right with foldl (or right to left with foldr) whilst applying a function to an accumulator
-- With foldl the accumulator is the first parameter of the function and we work through the list from l->r
-- also needs to take in a seed
mySum :: [Int] -> Int
mySum xs = foldl(\acc x -> acc + x) 0 xs

-- Due to currying we can also do this:
simpleSum :: [Int] -> Int
simpleSum = foldl (+) 0

useMySum = mySum [1,2,3,4,5]
useMySimpleSum = simpleSum [1,2,3,4,5]


-- Difference between foldl & foldr
minusLeftFold :: [Int] -> Int
minusLeftFold xs = foldl(\acc x -> acc - x) 0 xs

minusRightFold :: [Int] -> Int
minusRightFold xs = foldr(\x acc -> x - acc) 0 xs

useMinusLeftFold = minusLeftFold [2,3,1]
useMinusRightFold = minusRightFold [2,3,1]


-- Also the type of the list we are folding and the return value don't have to be the same:
myElem :: Eq a => [a] -> a -> Bool
myElem xs y = foldl (\acc x -> if x == y then True else acc) False xs

useMyElem = myElem [1,2,3,4,5] 4


-- foldl1 and foldr1 are the same as the other folds but you don't need to supply a starting value
myOtherSum :: [Int] -> Int
myOtherSum xs = foldl1(\acc x -> acc + x) xs

useMyOtherSum = myOtherSum [1,2,3,4,5]

-- Function application with dollar
-- Definition of $
-- ($) :: (a -> b) -> a -> b
-- f $ x = f x
-- Where as regular functional application has the highest precedence. $ has the lowest precedence
-- This helps us to remove parentehses. When a $ is encountered the expression on the right is applied and
-- as a paramter to the function on the left

squares :: Int -> Int
squares x = sum (map (\x -> x^2) [1..x])

squares2 :: Int -> Int
squares2 x = sum $ map (\x -> x^2) [1..x]

sqrt' = sqrt $ 1 + 2 + 6

-- $ also lets us treat function application just like another function. This allows us
-- to use $3 to pass 3 to a list of functions where map expects a function
useMap = map ($ 3) [(10+), (*4), (^2), (sqrt)]

-- Function composition is defined in maths as:
-- f(g(x)) = f.g(x) : essentially we take the result of one function (on the rhs) and use the result
-- as the parameter for the lhs function
-- Remember that it is for COMPOSING FUNCTIONS so the below doesn't work

-- ** BAD: useComp1 = sum . tail [1,2,3,4,5]

-- but this does work:
useComp1 = (sum . tail) [1,2,3,4,5]

-- Example of using function composition to compose a function that takes 2 parameters
useComp2 = sum . replicate 5 $ max 4 5







