data Point = Point Float Float deriving (Show) -- Same name for data type and value constructor so that we can construct using Point

data Shape =
    Circle Point Float |       
    Rectangle Point Float Float
    deriving (Show)

area                   :: Shape -> Float
area (Circle _ r)         = pi * (r ^ 2)      -- Here we pattern match against constructors. I.e. if this was Bool we could pattern match against True and False
area (Rectangle _ x y)    = x*y

-- Value constructors are functions so follow the same rules as other functions (i.e. partial application below)
circles    :: [Float] -> [Shape]
circles     = map (\x -> Circle (Point 0.0 0.0) x)

-----------------------------------------
-- **** Recursive data structures **** --
-----------------------------------------
{-
data Nat = Zero | Succ Nat
-}

data Nat = Zero | Succ Nat
    deriving Show

-- Called with: nat2int (Succ(Succ(Succ(Zero)))) gives us 3
nat2int            :: Nat -> Int
nat2int Zero        = 0
nat2int (Succ n)    = 1 + nat2int n

{-
nat2int (Succ(Succ(Zero)))
1 + nat2int (Succ(Zero))
1 + (1 + nat2int Zero)
1 + (1 + 0)
-}

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat(n-1))


-- Lists: [5] is syntactic sugar for 5:[]. [4,5] = 4:(5:[])

-- We will substitute cons (:) for our own cons (:-:)
infixr 5 :-:    -- infix that associates to the right with a binding precedence of 5

data List a = Empty | a :-: (List a)
    deriving (Show, Read, Eq, Ord)

myList = 6 :-: 5 :-: 4 :-: Empty    -- Same as [5,4,3,2,1] which is syntactic sugar for 5:4:3:2:1:[]
myList2 = 3 :-: 2 :-: 1 :-: Empty

-- Now we can implement list functions against our own implementation of list
(.++)              :: List a -> List a -> List a
Empty      .++ ys   = ys
(x :-: xs) .++ ys   = x :-: (xs .++ ys)             -- Pattern match on x :-: xs as pattern matching is actually working at the constructor level
    
-- Binary search tree. Each element can point to a left and right element. On the left is smaller and the right is bigger.
-- So each element has up to 2 elements
data Tree a = EmptyTree | Node a (Tree a) (Tree a)
    deriving (Show, Read, Eq, Ord)

singleton  :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert                         :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree              = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (treeInsert x left) right
    | x > a  = Node a left (treeInsert x right)

-- scan our tree to see if an element is in the Tree
treeElem                           :: (Ord a) => a -> Tree a -> Bool
treeElem _ EmptyTree                = False
treeElem x (Node a left right)
    | x == a = True
    | x < a  = treeElem x left
    | x > a  = treeElem x right
    
nums = [1,5,4,6,7,3,2]
numsTree = foldr treeInsert EmptyTree nums
