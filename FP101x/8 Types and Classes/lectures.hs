-- Type declarations:
-- We can define types but defining a new name for an existing type.
-- i.e. type String = [Char]

type Pos = (Int, Int)

left :: Pos -> Pos
left (x,y) = (x-1,y)

-- Type declarations can also be nested. i.e:
type Board = [Pos]

-- types cannot be recursive: i.e. type Tree = (Int, [Tree]) is not allowed as these are only synonyms

-- Types can also be parameterised
type Dict k = [(k,String)]

find :: Eq k => k -> Dict k -> String
find key dict = head [v | (k,v) <- dict, k==key]

-- Types are only synonyms and if we want ot create a totally new type we need to use a DATA DECLARATION
data MyBool = False | True

-- The 2 values of False/True are called the CONSRUCTORS for the type MyBool
-- and the same constructor cannot be used in more than one type

data Answer = Yes | No | Unknown