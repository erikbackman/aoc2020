module Main where

import Control.Arrow (Arrow((&&&)))

parseInput :: String -> [String]
parseInput = const []

solveP1 :: [String] -> ()
solveP1 = const ()

solveP2 :: [String] -> ()
solveP2 = const ()

main :: IO ()
main = print . (solveP1 &&& solveP2) . parseInput =<< readFile "./example.txt"
