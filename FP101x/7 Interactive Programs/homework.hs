putStr'        :: String -> IO ()
putStr' []      = return ()
putStr' (x:xs)  = putChar x >> putStr' xs

putStrLn'      :: String -> IO ()
putStrLn'       [] = putChar '\n'
putStrLn'       xs = putStr' xs >>= \x -> putChar '\n'

getLine' :: IO String
getLine'  = get []

get :: String -> IO String
get xs = do x <- getChar
            case x of
                '\n' -> return xs
                _ -> get (xs ++ [x])

interact'   :: (String -> String) -> IO ()
interact' f  = do input <- getLine'
                  putStrLn' (f input)

-- sequence_'             :: Monad m => [m a] -> m ()
-- sequence_' []           = return ()
-- sequence_' (m : ms)     = m >>= \_ -> sequence_' ms

sequence_'             :: Monad m => [m a] -> m ()
sequence_' ms           = foldr (>>) (return()) ms

sequence'              :: Monad m => [m a] -> m [a]
sequence' ms            = foldr func (return []) ms
                            where
                                func :: (Monad m) => m a -> m [a] -> m [a]
                                func m acc = do x <- m
                                                xs <- acc
                                                return (x:xs)
                                      
                                      
                                      