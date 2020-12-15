module Day01 (
  doDay1
  ) where

import Lib

doDay1 :: IO ()
doDay1 = do
  day01 <- intList <$> readFile "in/day01_part_a"
  day02 <- intList <$> readFile "in/day01_part_b"

  print $ part1 day01
  print $ part2 day02

part1 :: [Int] -> Int
part1 day01 = head [ a*b | a <- day01, b <- day01, a+b == 2020 ]

part2 :: [Int] -> Int
part2 day02 = head [ a*b*c | a <- day02,
                          b <- day02,
                          c <- day02,
                          a+b+c == 2020 ]
