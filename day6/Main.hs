module Main where

import Control.Arrow ((&&&))
import Data.List.Split (splitOn)
import Control.Monad (join)
import Data.List (nub, intersect)

type Input = [[String]]

parseInput :: String -> Input
parseInput = fmap lines . splitOn "\n\n"

solveP1 :: Input -> Int
solveP1 = sum . fmap (length . nub . join)

solveP2 :: Input -> Int
solveP2 = sum . fmap answers
  where
    answers [x]    = length x
    answers (x:xs) = length . foldr intersect x $ xs

main :: IO ()
main = interact $ show . (solveP1 &&& solveP2) . parseInput
