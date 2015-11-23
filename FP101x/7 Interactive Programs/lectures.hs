import System.IO

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

