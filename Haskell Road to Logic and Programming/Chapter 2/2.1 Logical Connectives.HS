-- connectives
--
-- and				^		conjunction
-- or				v		disjunction
-- not				¬		negation
-- if-then			==>		implication
-- if, and only if	<=>		equivalence

-- Bool is defined as:
-- data Bool = False | True

-- Negation (Not)
-- P		¬P
-- True		False
-- False	True
not'		:: Bool -> Bool
not' True	= False
not' False	= True

-- Conjunction (And)
-- P		Q		P^Q
-- True		True	True
-- True		False	False
-- False	True	False
-- False	False	False
and' :: Bool -> Bool -> Bool
True `and'` x		= x
False `and'` x 		= False

-- Disjunction (Or)
-- P		Q		PvQ
-- True		True	True
-- True		False	True
-- False	True	True
-- False	False	False
or' :: Bool -> Bool -> Bool
False `or'` x		= x
True `or'` x 		= True

-- Exercise 2.2 XOR Truth table
-- P		Q		P(xor)Q
-- True		True	False
-- True		False	True
-- False	True	True
-- False	False	False

-- Implication (If P then Q)
-- P		Q		P=>Q
-- True		True	True
-- True		False	False
-- False	True	True
-- False	False	True

-- fixity declarations specify the precedence level of operations.
-- infix can only be used with functions that are declared with symbols
-- 0 lowest 9 highest
infix 1 ==>

(==>) :: Bool -> Bool -> Bool
True ==> x 	= x
False ==> x = True

-- Equivalence (If - if and only if)
-- P		Q		P <=> Q
-- True		True	True
-- True		False	False
-- False	True	False
-- False	False	True
infix 1 <=>

(<=>) :: Bool -> Bool -> Bool
x <=> y		= x == y











