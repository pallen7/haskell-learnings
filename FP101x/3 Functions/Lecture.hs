-- conditional expressions can be used in haskell...
abs' :: Int -> Int
abs' n = if n >= 0 then n else -n

-- and these can also be nested...
-- and must always have to have a THEN and an ELSE as it is an expression not a statement
signum' :: Int -> Int
signum' n = if n< 0 then -1 else
              if n==0 then 0 else 1

-- but haskell is optimised for brevity so guards equations & pattern matching tend to be used instead

abs2 :: Int -> Int
abs2 n | n >= 0    = n
       | otherwise = -n
	   
-- Pattern matching
not' :: Bool -> Bool
not'    False = True
not'    True  = False

patterny :: Int -> String
patterny    1 = "low"
patterny    2 = "medium"
patterny    3 = "high"
patterny    _ = "woooow"

-- Lists are syntactic sugar for the cons operator
myList :: [Int]
myList = 1:2:3:4:[] -- the cons operator associates to the right so this means 1:(2:(3:(4:[])))

firstTwo :: [Int] -> (Int, Int)
firstTwo (a:b:_) = (a,b)
firstTwo _        = error "< 2 elements"

-- -- INtegers also allow special cases (n+k) where k>0: and n>=k
-- NOTE: this doesn't seem to work in ghci :-(
-- minusOne :: Int -> Int
-- minusOne    0     = 0
-- minusOne    (n+1) = n


-- LAMBDA EXPRESSIONS
double :: Int -> Int
double = (\x -> x+x)

-- Can be used to formalise the meaning of curried functions
add1 :: Int -> Int -> Int
add1 x y = x+y

-- can be understood as meaning (the above is actually syntactic sugar for the below)
add2 :: Int -> Int -> Int
add2 = \x -> (\y -> x+y)        -- makes it explicit that add2 takes a number x and returns a function that takes a number y and returns x+y

-- useful to make it explicit that you are returning a function.
-- const defines a constant function that will always return a specific value
const1 :: a -> b -> a
const1 x _ = x

const2 :: a -> (b -> a)
const2 x = \_ -> x         -- function that takes anything and returns x

-- also very useful so that we don't have to define the name for a function unnecessarily:
odds1 :: Int -> [Int]
odds1 n = map f [0..n]
   where f x = x*2+1    -- had to create a function unnecessarily

odds2 :: Int -> [Int]
odds2 n = map (\x -> x*2+1) [0..n]

-- SECTIONS:
-- infix operators can be wrapped in parentheses and be used as a function
plus1 = (+) 1 2
plus2 = (1+) 2    -- (x+) = \y -> x + y ..... (1+) partially applies the 1 and returns a function that expects an argument for the rhs
plus3 = (+1) 2    -- (+y) = \x -> x + y .....partially applies the 1 and returns a function that expects an argument for the lhs

-- Examples:
successor    = (1+)
doubleup     = (*2)
reciprocate  = (1/)
halve        = (/2)


