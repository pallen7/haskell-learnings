-- A Higher Order Function is one that can take functions as parameters or return functions as return values

-- All functions in Haskell are curried and only actually take one parameter
-- this means that each parameter is applied individually and we get back a partially applied function.
-- i.e. 
-- max :: (Ord a) => a -> a -> a is equivalent to:
-- max :: (Ord a) => a -> (a -> a)


-- i.e. If we said "max 5" and didn't pass in the 2nd parameter what we would actually get back would be (Int -> Int) .. although different datatypes
-- Let's have a play with that...:


-- Partial application:
-- So let's write a function that takes 2 numbers and multiplies them.
multiply :: Num a => a -> a -> a
multiply x y = x * y

-- So now let's write our own version of the map function that takes in a  (a -> a) parameter
-- and applies the function to an array (could also do this recursively)
myMap :: Num a => (a -> a) -> [a] -> [a]
myMap f []    = []
myMap f (xs)  = [f x | x <- xs]

-- Now we can partially apply multiply and pass this partially applied function into myMap:
useMyMap = myMap (multiply 5) [1,2,3,4,5]

-- To 'section' an infix function partially apply it by only applying the parameter to one side and then
-- To 'section' an infix function partially apply it by only applying the parameter to one side and then
-- the missing operand will be 'filled in' - learn gooder english..
useSections1 = myMap (100/) [10,20,50]
useSections2 = myMap (/100) [10,20,50]

-- note: minus sign won't work in sections (-) so you need to use subtract
useSubtractSection = myMap (subtract 5) [10,15,25]

-- Another (simple) example of a higher order function
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

useApplyTwice1 = applyTwice (*2) 1
useApplyTwice2 = applyTwice (++ " after") "hello"
useApplyTwice3 = applyTwice ("before " ++) "hello"

-- Implementation of zipWith that takes a function and 2 lists and combines them into a 3rd list based on the function
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f _ []          = []
myZipWith f [] _          = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys




