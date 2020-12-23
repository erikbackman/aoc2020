module Main where

import Data.List (sort)
import Data.Maybe (listToMaybe)
import Data.Bool (bool)
import Control.Arrow ((&&&))

decode :: String -> Int
decode = foldl (\n a -> toDigit a + 2*n) 0
  where toDigit = bool 0 1 . (`elem` "BR")

parseInput :: String -> [Int]
parseInput = fmap decode . lines

distanceOf :: (Ord a, Num a) => a -> [a] -> [(a, a)]
distanceOf n l = [ (x, y) | (x,y) <- (zip <*> tail) . sort $ l, abs (x - y) == n ]

solveP1 :: [Int] -> Int
solveP1 = maximum

solveP2 :: [Int] -> Maybe Int
solveP2 = fmap (succ . fst) . listToMaybe . distanceOf 2

main :: IO ()
main = print . (solveP1 &&& solveP2) . parseInput =<< readFile "./day5inp.txt"
