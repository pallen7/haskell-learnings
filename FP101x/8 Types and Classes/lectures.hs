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

-- Types are only synonyms and if we want to create a totally new type we need to use a DATA DECLARATION

data MyBool = False | True

-- The 2 values of False/True are called the CONSTRUCTORS for the type MyBool
-- and the same constructor cannot be used in more than one type
-- You can think of MyBool as an abstract base class
-- Then True and False extend MyBool. i.e. you can only create instances of True and False not Bool.
-- True and False don't have their own types. They are both of type bool

data Answer = Yes | No | Unknown deriving (Show, Read)

flip' :: Answer -> Answer
flip' Yes     = No
flip' No      = Yes
flip' Unknown = Unknown

-- Constructors in a data declaration can also have types:
data Shape = Circle Float
           | Rect Float Float deriving (Show)

-- If we do :type Circle Haskell implicitly defines constructors (i.e. :t Circle gives us "Float -> Shape" : Rect is "Float -> Float -> Shape")
           
-- square can use the Rect constructor to create a square
square              :: Float -> Shape
square n             = Rect n n

area                :: Shape -> Float
area (Circle r)      = pi * r ^ 2
area (Rect x y)      = x * y

