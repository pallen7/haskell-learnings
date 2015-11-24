import Data.Char

main = do                                       -- We don't usually give main a type signature. This can be compiled via : "ghc filename"
    putStrLn "Hello, what's your first name?"   -- String -> IO () - The empty Tuple is referred to as Unit
    fname <- getLine                            -- Read as perform the I/O action and BIND its result value to name. IO String
    _ <- putStrLn "what's your second name?"    -- Can also bind the return from putStrLn but this is always () so it's a bit pointless
    sname <- getLine
    let uFname = map toUpper fname              -- Here we use a regular (=) let bindings in the Pure code. <- is for binding a Monadic result value
        uSname = map toUpper sname
    putStrLn ("Hey " ++ uFname ++ " " ++ uSname ++ ", you rock!")  -- The last action in a do block cannot be bound to a name.