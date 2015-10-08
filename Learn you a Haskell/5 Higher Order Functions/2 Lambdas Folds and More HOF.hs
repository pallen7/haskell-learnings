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
