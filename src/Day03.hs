module Day03 (
  doDay03
  ) where

-- Part A --
solve xs = length $ filter id (traverse' 3 (tail xs))

traverse' i [] = []
traverse' i (x:xs) = detect x i : traverse' (i+3) xs
    where
        detect line pos = (cycle line)!!pos == '#'

doDay03 :: IO ()
doDay03 = do
    day03 <- readFile "in/day03"
    print $ solve [x | x <- lines day03]