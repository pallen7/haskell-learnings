{-
A parser is a program that analyses a piece of text to determine it's syntactic structure

i.e. 2*3+4

means ->

     +
    / \
   *   4
  / \
 2   3
 
Almost every real life program uses some form of parser to pre-process

type Parser = String -> Tree

However a parser might not require all of it's input string, so we also return any unused output:
type Parser = String -> (Tree, String)

It may also be parsed in many ways so we want to return a list of pairs of trees and strings.
i.e. if we can't parse the list will be empty or if it's ambiguous it may return many pairs
type Parser = String -> [(Tree, String)]

also it doesn't matter if we're going to produce a Tree so use a polymorphic type:
type Parser a = String -> [(a, String)]

For simplicity we will only consider failure (empty list) or success (singleton list)

-}

type Parser a = String -> [(a, String)]

-- To build complicated parsers we start off with the simplest parser possible that takes a string and parses the first char
-- Returns a Parser of type Char
item :: Parser Char
item = \inp -> case inp of
                    []     -> []
                    (x:xs) -> [(x,xs)]


