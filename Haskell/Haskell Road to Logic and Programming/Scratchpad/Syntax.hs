pattern_match :: Bool -> Int -> String
pattern_match True x = "this is true"
pattern_match False x = pattern_match True x
