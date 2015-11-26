import System.IO
{-
Monad signature:
class Monad (m :: * -> *) where
    (>>=)       :: m a -> (a -> m b) -> m b       -- The bind operator
    (>>)        :: m a -> m b -> m b              -- Then operator to allow chaining
    return      :: a -> m a
    fail        :: String -> m a
-}

-- Using the then operator to sequence 2 IO calls
-- putStr returns IO () as it is an action
thenUsage = putStr "Hello world" >> putStrLn " from me"

-- Using the bind operator we can feed in the result of getLine (IO String)
-- as the first paramater matching m a
-- Then we use the function \x -> putStr ("abc" ++ x) to map a plain value x to IO String.
bindUsage = putStrLn "Please enter your name" >> getLine >>= \x -> putStrLn ("Hello there " ++ x)

-- Here we are showing how we can bind multiple times. Parentheses used to make clear where (a -> m b) is happening
bindUsage2 = putStrLn "Please enter your first name" >> getLine >>= (\a ->
                putStrLn "Please enter your surname" >> getLine >>= (\b ->
                    putStrLn ("Hello " ++ a ++ " " ++ b)))

-- The then operator can be written in terms of the bind operator by ignoring the input
bindUsage3 = putStr "Hello there " >>= \_ -> putStrLn "you"

-- Using return:
countLetters    :: String -> IO Int
countLetters xs  = return $ length xs

usereturn2 :: IO ()
usereturn2 = do
    x <- getLine >>= countLetters
    print x
        
-- Do means that we don't end up with long chains of binds and thens..:
writeTwo :: IO (Char, Char)
writeTwo = do
            x <- getChar
            getChar
            y <- getChar
            return (x,y)

getCh :: IO Char
getCh = do hSetEcho stdin False
           c <- getChar
           hSetEcho stdin True
           return c
            
getLine' :: IO String
getLine' = do x <- getChar
              if x == '\n' then
                return []
              else
                do xs <- getLine'
                   return (x:xs)

putStr' :: String -> IO ()
putStr' []     = return ()
putStr' (x:xs) = do putChar x
                    putStr' xs

putStrLn' :: String -> IO ()
putStrLn' xs = do putStr' xs
                  putChar '\n'
                  
-- Mix imperative (IO) and functional code:
strLen :: IO ()
strLen = do putStr' "Enter a string: "
            xs <- getLine'
            putStr' "The string has "
            putStr' (show (length xs))
            putStrLn' " characters"

--
--HANGMAN:
--
hangman :: IO ()
hangman =
    do putStrLn' "Think of a word:"
       word <- secretGetLine
       putStrLn' "Try to guess it:"
       guess word

secretGetLine :: IO String
secretGetLine = do x <- getCh
                   if x == '\n' then
                      do putChar x
                         return []
                   else
                      do putChar '-'
                         xs <- secretGetLine
                         return (x:xs)

guess :: String -> IO ()
guess word = do putStr' "> "
                xs <- getLine'
                if xs == word then
                    putStrLn' "You got it!"
                else
                    do putStrLn' (diff word xs)
                       guess word

                       
diff :: String -> String -> String
diff xs ys = [if elem x ys then x else '-' | x <- xs]

