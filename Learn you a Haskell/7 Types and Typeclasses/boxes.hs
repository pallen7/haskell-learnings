{-
Attempt to create a type simialar to the Maybe type
-}
data Box a = Something a | Nowt
    deriving (Show, Read, Eq, Ord)

instance Functor Box where
    fmap f (Something a)  = Something (f a)
    fmap f Nowt           = Nowt