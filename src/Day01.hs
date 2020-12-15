module Day01 (
  doDay01
  ) where

import Lib

doDay01 :: IO ()
doDay01 = do
  partA <- intList <$> readFile "in/day01_part_a"
  partB <- intList <$> readFile "in/day01_part_b"

  print $ part1 partA
  print $ part2 partB

part1 :: [Int] -> Int
part1 partA = head [ a*b | a <- partA, b <- partA, a+b == 2020 ]

part2 :: [Int] -> Int
part2 partB = head [ a*b*c | a <- partB,
                          b <- partB,
                          c <- partB,
                          a+b+c == 2020 ]
