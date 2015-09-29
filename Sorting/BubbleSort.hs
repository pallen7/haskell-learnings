-- Wiki blurb:
-- Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps through the list to be sorted,
-- compares each pair of adjacent items and swaps them if they are in the wrong order. The pass through the list is repeated until no swaps are needed,
-- which indicates that the list is sorted. The algorithm, which is a comparison sort, is named for the way smaller elements "bubble" to the top of the list.
-- Although the algorithm is simple, it is too slow and impractical for most problems even when compared to insertion sort.
-- [1] It can be practical if the input is usually in /sort order but may occasionally have some out-of-order elements nearly in position.

-- Can make this more elegant. Takes a list and goes l->r swapping so that we have the largest element at the end		
traverse :: Ord a => [a] -> [a]
traverse []			= error "traversal of empty list"
traverse [x]		= [x]
traverse (x:xs) 	| x > head xs 	= (head xs) : traverse (x : tail xs)
					| otherwise		= x : traverse xs

-- uses traverse to get largest element to the end and then traverses again through the rest of the list
bubblesort :: Ord a => [a] -> [a]
bubblesort []		= error "can't sort empty list"
bubblesort [x]		= [x]
bubblesort (xs)		= bubblesort (init semisorted) ++ [last semisorted]
					where semisorted = traverse xs
