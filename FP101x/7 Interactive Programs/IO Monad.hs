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
import Data.List
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

-- query to determine how many words of the words in the second string start with the first string. Note this returns an int..:
query1 :: String -> String -> Int
query1 str input = length.filter (isPrefixOf str) $ words input

-- Here if we input a string we can see how many words start with that prefix
runQuery1 :: IO ()
runQuery1 = do
        str <- getLine
        let x = query1 str "cat catfish cattle nocat dog"
        print x

-- Now using "return" we can return an "IO Int" from the query.
-- This means that we can build composable blocks instead of placing all of our logic in 1 do construct
query2 :: String -> IO Int
query2 str = do
        input <- getLine 
        return $ length.filter (isPrefixOf str) $ words input

-- This means we can now use query2 in our do statements and combine with other IO actions
runQuery2 :: IO ()
runQuery2 = do
        result <- getLine >>= query2
        print result

-- so:
-- a <- return b == let a = b


