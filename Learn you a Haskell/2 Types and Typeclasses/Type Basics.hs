-- Usual types such as Bool, Float, Int etc...

-- We can use a Type Variable (in the case below we have named it 'a')
-- This is very similar to the concept of generics in C# and gives us functions that are polymorphic
head' :: [a] -> a
head' []    = error "empty list"
head' [x]   = x
head' (xs)  = head xs

-- Typeclasses are similar to interfaces in Java/C# in that they say how a type has to behave.
-- You can make types a part of a typeclass
-- => is a class constraint

-- i.e. the elem function has a type of (Eq a) => a -> [a] -> Bool.
-- As elem needs to check for equality over a list we say that a has to be 'a' type that's in the Eq typeclass

useEq :: Eq a => a -> a -> Bool
useEq x y = x == y

useOrd :: Ord a => a -> a -> Bool
useOrd x y = x > y

-- Compare takes 2 Ord members and returns an Ordering type. GT, LT EQ
usecompare :: Ord a => a -> a -> Ordering
usecompare x y = compare x y

-- Also have:
-- Show: Presentable as a string
-- Read: Opposite of Show
-- Enum: Sequentially ordered types
-- Bounded: Upper and lower bounds
-- Num: Must be a number
-- Integral: Whole numbers Int & Integer

-- fromIntegral is a useful way to work integrals.

mixIntegralWithNum :: (Integral a, Num b) => a -> b -> b
mixIntegralWithNum x y = fromIntegral x + y


