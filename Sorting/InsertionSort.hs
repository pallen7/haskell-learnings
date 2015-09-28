-- Insertion sort iterates, consuming one input element each repetition, and growing a sorted output list.
-- Each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list, and inserts it there.
-- It repeats until no input elements remain.

-- Sorting is typically done in-place, by iterating up the array, growing the sorted list behind it.
-- At each array-position, it checks the value there against the largest value in the sorted list
-- (which happens to be next to it, in the previous array-position checked).
-- If larger, it leaves the element in place and moves to the next.
-- If smaller, it finds the correct position within the sorted list, shifts all the larger values up to make a space, and inserts into that correct position.

-- So base case is empty array
-- Steps:
-- 1) 5,2,4,1 - 5 is the largest element yet encountered so it stays where it is
-- 2) 2,5,4,1 - 2 is smaller than 5 so it is moved before 5
-- 2) 2,4,5,1 - 4 is is smaller than 5 but larger than 2 so is moved into the correct position
-- 3) 1,2,4,5 - 1 is the smallest element so far so is moved to the front of the array

-- Soooo...
-- We need to be able to compare the largest value of the list with the current element
-- If the current element is smaller than the largest value in the list we need to move through the array until we find the location that it should live

-- Just a rewrite of maximum for practice
maxInList :: Ord a => [a] -> a
maxInList [] 		= error "call to max on empty list"
maxInList [x] 		= x
maxInList (x:xs)	= max x (maxInList xs)

-- Take 1 element and place in an already sorted list
placeInSortedList :: Ord a => a -> [a] -> [a]
placeInSortedList m []		= [m]
placeInSortedList m (x:xs)	| m <= x	= m : x : xs
							| otherwise	= x : (placeInSortedList m xs)

-- Takes a sorted list on lhs and an unsorted list on rhs 
insertSortRec :: Ord a => [a] -> [a] -> [a]
insertSortRec [] []			= []
insertSortRec [] (ys)		= ys
insertSortRec (xs) []		= xs
insertSortRec (xs) (y:ys)	| y >= (maxInList xs) 	= insertSortRec (xs ++ [y]) ys
							| otherwise				= insertSortRec (placeInSortedList y xs) ys

-- To do the work we need to start with a sorted array. This can be the first element in the list			
insertSort :: Ord a => [a] -> [a]
insertSort []		= []
insertSort [x]		= [x]
insertSort (x:xs)	= insertSortRec [x] xs






