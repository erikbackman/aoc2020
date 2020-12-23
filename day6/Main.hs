module Main where

import Control.Arrow (Arrow((&&&)))
import Data.List.Split (splitOn)
import Data.List (nub)

parseInput :: String -> [String]
parseInput = fmap (filter (`notElem` "\n")) . splitOn "\n\n"

solveP1 :: [String] -> Int
solveP1 = sum . fmap (length . nub)

solveP2 :: [String] -> ()
solveP2 = const ()

main :: IO ()
main = print . (solveP1 &&& solveP2) . parseInput =<< readFile "./day6inp.txt"
