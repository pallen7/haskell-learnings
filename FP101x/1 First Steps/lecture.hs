--Exercises:

-- 1)
double :: Int -> Int
double x = x + x

quadruple :: Int -> Int
quadruple x = double . double $ x

take4 = take (quadruple 1) [1,2,3,4,5]

factorial n = product [1..n]

average ns = sum ns `div` length ns

-- 2) Fixed syntax errors below:
func = a `div` length xs
 where
  a = 10
  xs = [1,2,3,4,5]

mylist = [1,2,3,4,5]
  
-- 3) Show how the library function last that selects the last element of a list can be defined using the functions introduced in this lecture.	
mylast [] = error "empty list"
mylast xs = xs !! (length xs - 1)

-- 4) Can you think of another possible definition?
mylast2 xs = head (reverse xs)

-- 5) Similarly, show how the library function init that removes the last element from a list can be defined in two different ways.
myinit xs = take (length xs - 1) xs
myinit2 = remove 