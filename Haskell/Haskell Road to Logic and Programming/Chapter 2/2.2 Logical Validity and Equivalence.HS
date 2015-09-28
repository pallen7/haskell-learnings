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

-- Validity check for boolean functions with 1 parameter
valid1 :: (Bool -> Bool) -> Bool
valid1 bf = (bf True) && (bf False)

-- Excluded middle:
-- Either the proposition is true or it's negation is true
form1a :: Bool -> Bool
form1a p = p || not p
