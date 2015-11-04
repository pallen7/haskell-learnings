{-
The Caeser Cipher is the replacement of each letter with the letter 3 further down the alphabet, wrapping at the end
i.e. "haskell is fun" - "kdvnhoo lv ixq"
We can replace the shift factor with any factor up to 25 though...
-}
import Data.Char

-- Numbers each lowercase letter from 0-25
let2int :: Char -> Int
let2int x = ord x - ord 'a'

int2let :: Int -> Char
int2let x = chr (ord 'a' + x)

let2intUpper :: Char -> Int
let2intUpper x = ord x - ord 'A'

int2letUpper :: Int -> Char
int2letUpper x = chr (ord 'A' + x)

shift :: Int -> Char -> Char
shift n c | isLower c = int2let((let2int c + n) `mod` 26)
          | isUpper c = int2letUpper((let2intUpper c + n) `mod` 26)
          | otherwise = c

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- To crack the caeser cipher we can use the approximate percentage frequency for each letter in the alphabet
table :: [Float]
table = [8.2,1.5,2.8,4.3,12.7,2.2,2.0,6.1,7.0,0.2,0.8,4.0,2.4,6.7,7.5,1.9,0.1,6.0,6.3,9.1,2.8,1.0,2.4,0.2,2.0,0.1]

percent :: Int -> Int -> Float
percent x y = (fromIntegral x / fromIntegral y) * 100

count :: Char -> String -> Int
count c xs = sum[ 1 | x <- xs, x == c ]

lowers ::String -> Int
lowers xs = sum[ 1 | x <- xs, isLower x ]

freqs :: String -> [Float]
freqs xs = [percent (count x xs) n | x <- ['a'..'z']]
         where n = lowers xs

zs = 1 : [z + 1 | z <- zs]

chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum[((o-e)^2) | (o,e) <- zip os es]

rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs


