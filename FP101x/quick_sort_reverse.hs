qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where smaller = [a | a <- xs, a <= x]
        larger  = [b | b <- xs, b > x]

revqsort :: Ord a => [a] -> [a]
revqsort [] = []
revqsort (x:xs) = revqsort larger ++ [x] ++ revqsort smaller
  where smaller = [a | a <- xs, a <= x]
        larger  = [b | b <- xs, b > x]
