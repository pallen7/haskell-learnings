{-
From: https://www.youtube.com/channel/UCXqr8j5SdhYvgd6dIVER4Qg

A way to structure sequential computation by providing tools for chaining operations together
while observing a set of rules

class Monad (m :: * -> *) where
    (>>=) :: m a -> (a -> m b) -> m b
    (>>) :: m a -> m b -> m b
    return :: a -> m a
    fail :: String -> m a
-}

--
-- *** VIDEO 1 ***
-- "then" operator (>>)
--
-- putStrLn is an IO action with a signature of IO ()
simple1 = putStrLn "Hello World"

-- We can chain with IO () functions with the "then"" operator >>
-- This ignores the return value of the previous IO action
simple2 = putStr "Hello " >> putStrLn "World"

-- The "do" operator is syntactic sugar that can be used to remove the >> operator
simple3 = do
        putStr "Hello "
        putStrLn "World"

--
-- *** VIDEO 2 ***
-- "bind" operator (>>)
--
-- Here the binding operator is expecting a type of IO a (getLine = IO String).
-- We can then access that value and provide a function for how to map to another IO action:
binding1 = putStrLn "Please enter your name: " >> getLine >>= \x -> putStrLn ("Hello " ++ x)

-- This 'binding' allows us to chain actions together:
binding2 = putStr "Please enter your name: " >> getLine >>= \x ->
                putStr "Please enter your age: " >> getLine >>= \y ->
                    putStrLn (x ++ " is " ++ y)

-- Again we can use the do keyword (syntactic sugar) to bind inputs
binding3 = do
        putStr "Please enter your name: "
        x <- getLine
        putStr "Please enter your age: "
        y <- getLine
        putStrLn (x ++ " is " ++ y)


--
-- *** VIDEO 3 ***
-- The return keyword
--
-- We can write then in terms of bind if we discard the output from the first function call
bindAsThen = putStr "Hello " >>= \_ -> putStrLn "World"








