--
-- Define implication and equivalence
--
-- Implication (if P then Q)
infix 1 ==>
(==>) :: Bool -> Bool -> Bool
True ==> x 	= x
False ==> x = True

-- Equivalence (iff - if and only if)
infix 1 <=>
(<=>) :: Bool -> Bool -> Bool
x <=> y		= x == y

--
-- For a proposition to be logically valid all calculated values must equate to True
-- regardless of the values of the inputs
-- i.e.:
-- P ==> P, P || ¬P and P ==> (Q ==> P)
--
-- Truth table for P || ¬P
-- P		||		¬		P
-- True		True	False	True
-- False	True	True	False

-- So regardless of the value of P the result of this proposition will always be true
-- This is known as excluded-middle... Either P is True or the negation of P is true
-- Below is the Haskell for this:
excluded_middle :: Bool -> Bool
excluded_middle p 	= p || not p

-- We can then write a function to check the validity of a 1 parameter proposition that takes a function
-- Bool -> Bool
-- valid1 excluded-middle returns True. bf = Boolean Function
valid1 :: (Bool -> Bool) -> Bool
valid1 bf = (bf True) && (bf False)


-- This can be extended out so that we can check a proposition with 2 Boolean parameters always equals
-- True
valid2 :: (Bool -> Bool -> Bool) -> Bool
valid2 bf = (bf True True) && (bf True False) && (bf False True) && (bf False False)

-- Using valid2 we can prove that P ==> (Q ==> P) is logical valid but (P ==> Q) ==> Q is not
formula1 :: Bool -> Bool -> Bool
formula1 p q 	= p ==> (q ==> p)

formula2 :: Bool -> Bool -> Bool
formula2 p q 	= (p ==> q) ==> p


-- The 2 truth tables below show this:
-- Note that the bracket returns the value of ==> and this is what the outer P ==> uses as the 2nd parameter

-- P 		==>		(Q 		==>		P)
-- True		True 	True	True 	True
-- True		True 	False	True 	True
-- False	True 	True	False 	False
-- False	True 	False	True 	False

-- (P 		==>		Q) 		==>		P
-- True		True 	True	True 	True
-- True		False 	False	True 	True
-- False	True 	True	False 	False		-- This returns false so can't be logically valid
-- False	True 	False	True 	False


-- We can use list comprehensions to check more parameters and use the conjunction function 'and' to check
-- all values in the list are True. i.e. and [True, True, False] would return False
-- Note that list comprehensions draw every combination from every list so can easily test True/False combinations
valid3 :: (Bool -> Bool -> Bool -> Bool) -> Bool
valid3 bf	= and [bf p q r 	|	p <- [True, False]
								,	q <- [True, False]
								,	r <- [True, False]]

-- Just used to test valid3
formula3 :: Bool -> Bool -> Bool -> Bool
formula3 x y z = True

-- Opeartor precedence:
-- Conjunction and Disjunction (And/Or) bind more strongly than Implication and Equivalence (if/iff (==> <=>))

-- LOGICAL EQUIVALENCE states 2 formulas are logically equivalent if no matter what the truth values
-- of the letters occurring in the formulas the values obtained are the same.
-- If formulas are logically equivalent then a triple equals sign is used (can't do that in notepad++ so using <=>)

-- The first law of De Morgan ¬(P && Q) <=> (¬P) || (¬Q)

-- Exercise 2.9. Show using a truth table that (P xor Q) xor Q <=> P

--							...					...		
-- (P 		xor 	Q) 		xor 	Q 		<=> P
-- (True	False	True)	True	True		True
-- (True	True	False)	True	False		True
-- (False	True	True)	False	True		False
-- (False	False	False)	False	False		False








