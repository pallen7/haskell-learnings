-- Guards allow you to check boolean expressions and act depending on the result
-- 'othwerise' is basically 'True' so can be used as the bottom guard to ensure that a value is returned
speedy :: Double -> Double -> String
speedy	km minutes
	| (km / minutes) * 60 < 10 		= "You're pretty slow"
	| (km / minutes) * 60 < 12 		= "Not too bad"
	| (km / minutes) * 60 < 14 		= "Pretty quick. Keep going.."
	| otherwise 					= "Wow. You're amazing"

-- We can use the 'where' bindings to store the results of intermediate computations
-- If you are using more than one variable name in the where they have to be aligned in a straight
-- line. Also tabs don't work they have to be evenly spaced with space chars not tabs... :(
speedier :: Double -> Double -> String
speedier	km minutes
	| speed < slow 		= "You're pretty slow"
	| speed < average	= "Not too bad"
	| speed < quick		= "Pretty quick. Keep going.."
	| otherwise 		= "Wow. You're amazing"
	where
        speed = (km / minutes) * 60
        slow = 10
        average = 12
        quick = 14

-- WHERE SCOPE: where is scoped to the given pattern in which it was defined so it will work across guards but not across
-- different patterns

-- where bindings can also be used to pattern match. i.e.
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname
		  
-- where bindings can also be used to define functions:
speeds :: [(Float, Float)] -> [Float]
speeds xs = [theSpeed k m | (k, m) <- xs]
    where theSpeed km minutes = (km / minutes) * 60


-- Let is similar to where bindings but let expressions are expressions!! They are more local than where
-- bindings (i.e. can't span several guards) but can be used anywhere you can use an expression.
cylinder :: Double -> Double -> Double
cylinder r h =
  let sideArea = 2 * pi * r * h		-- let <bindings> in <expression>
      topArea = pi * r^2
  in  sideArea + 2 * topArea

-- They can appear in list comprehensions so speedy can be written as such (note there is no need for in here)
speedz :: [(Float, Float)] -> [Float]
speedz xs = [kmph | (k, m) <- xs, let kmph = (k / m) * 60]

-- case expressions are used for pattern matching. The advantage of case expressions is that they can be used
-- where pattern matching can't. i.e.
listDescription :: String -> String
listDescription xs = "The list is " ++
				case xs of
					[]	-> "empty"
					[y]	-> "singleton"
					ys -> "a longer list"
