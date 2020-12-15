module Lib
    ( intList
    ) where

intList :: String -> [Int]
intList = map read . lines
