module Main where

import Control.Arrow (Arrow((&&&)))
import Data.List.Split (splitOn)
import Control.Monad (join)
import Data.List (nub, intersect)

type Answers = String
type Group = [Answers]

parseInput :: String -> [Group]
parseInput = fmap (filter (not . null) . splitOn "\n") . splitOn "\n\n"

solveP1 :: [Group] -> Int
solveP1 = sum . fmap (length . nub . join)

solveP2 :: [[String]] -> Int
solveP2 = sum . fmap answers
  where
    answers [x] = length x
    answers xs  = (length . same) xs

    same (x:xs) = foldr intersect x xs

main :: IO ()
main = print . (solveP1 &&& solveP2) . parseInput =<< readFile "./day6inp.txt"
