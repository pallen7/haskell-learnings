-- Step in 3s to 999. Same with 5 but exclude multiples of 3 and add together
allMultiplesOf3to999 = sum[3,6..999]
allMultiplesOf5ButNot3to999 = sum[x | x <- [5,10..999], x `mod` 3 /= 0]
multiplesOf3and5 = allMultiplesOf3to999 + allMultiplesOf5ButNot3to999

-- All numbers divisible by 3 or 5 up to 999
oneTo999 = [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]
modAll3And5To999 = sum[x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]