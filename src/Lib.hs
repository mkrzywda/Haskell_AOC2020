module Lib
    ( intList
    ) where

import Data.List ( sort , nub)

intList :: String -> [Int]
intList = map read . lines
