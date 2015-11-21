{- Simulate the transmission of a binary string and then convert that string back into an integer
base 10 2435 = (2*1000 + 4*100 + 3*10 + 5*1)
base 2  1101 = (1*8 + 1*4 + 0*2 + 1*1)
-}

-- Create a type for Bit
type Bit = Int

-- so we can think of the conversion of a list of bits into integers as:
-- reverse bits
-- bin2int:
-- bit * 1
-- bit * 2
-- bit * 4
-- bit * 8
-- (1*a) + (2*b) + (4*c) + (8*d)
-- can be restructured as:
-- a + (2*b) + (4*c) + (8*d)
-- a + 2 * (b + (2*c) + (4*d))
-- a + 2 * (b + 2 * (c + (2*d)))
-- a + 2 * (b + 2 * (c + 2 * (d + (2 * 0))))
-- etc...
revbin2int :: [Bit] -> Int
revbin2int = foldr(\num acc -> num + acc * 2) 0

bin2int :: [Bit] -> Int
bin2int = \xs -> revbin2int $ reverse xs

-- int2bin can be created with repeated division of 2
-- 13 / 2 = 6 rem 1
-- 6  / 2 = 3 rem 0
-- 3  / 2 = 1 rem 1
-- 1  / 2 = 0 rem 1

-- 4 / 2 = 2 rem 0
-- 2 / 2 = 1 rem 0
-- 1 / 2 = 0 rem 1

int2bin    :: Int -> [Bit]
int2bin 0  = []
int2bin x  = (x `mod` 2) : int2bin (x `div` 2)

