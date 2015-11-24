import Control.Monad

{-
words - Takes a string and splits into a list of strings based on spaces
unwords - Takes a list of strings and turns into a single space separated string
-}
reverseWords :: String -> String
reverseWords  = unwords . map reverse . words

runReverser = do
    putStrLn "Enter sentences to reverse"
    reverseLoop

reverseLoop = do
    line <- getLine
    if null line
        then return ()      -- end the recursive function call
    else do
        putStrLn $ reverseWords line
        reverseLoop         -- recurse around the function

useReturn = do
    a <- return "hello"     -- return wraps "hello" in a box and <- unwraps the box
    b <- return "world"
    putStrLn (a ++ " " ++ b)

useputChar = do
    putChar 'a'
    putChar 'b'
    putChar 'c'
    putChar '\n'

-- Print takes any value that's an instance of the show class and outputs to the terminal (same as putStrLn . show)
useprint = do
    print True
    print 10
    print "bob"
    
-- When is found in Control.Monad and takes a bool and an IO (actually any monad) action and returns an IO action
-- or () if the predicate is not matched
useWhen = do
    putStrLn "what's the password?"
    pword <- getLine
    when (pword == "secret") $ do
        putStrLn "what prize would you like?"
        prize <- getLine
        putStrLn $ "You have won: " ++ prize

useSequence = do
    xs <- sequence [getLine, getLine, getLine] -- Makes an IO action that will getLine 3 times and we can bind the result to a name
    print xs



