module Day03 (
  doDay03
  ) where

-- Part A --
solvePartA xs = length $ filter id (traversePartA' 3 (tail xs))

traversePartA' i [] = []
traversePartA' i (x:xs) = detect x i : traversePartA' (i+3) xs
    where
        detect line pos = (cycle line)!!pos == '#'

-- Part B -- 
data Slope = Slope Int Int
    deriving Show

slopes = [Slope 1 1,
          Slope 3 1,
          Slope 5 1,
          Slope 7 1,
          Slope 1 2]

solvePartB xs slopes = product $ map (\s -> solve xs s) slopes

solve xs slope = length $ filter id (traversePartB' slope 0 xs)

traversePartB' :: Slope -> Int -> [String] -> [Bool]
traversePartB' _ _ [] = []
traversePartB' slope i (x:xs) = (detect x i) : traversePartB' slope (i+h) (drop (v-1) xs)
    where
        (Slope h v) = slope
        detect line pos = (cycle line)!!pos == '#'


doDay03 :: IO ()
doDay03 = do
    day03 <- readFile "in/day03"
    putStr "Day03 - Part A:"
    print $ solvePartA [x | x <- lines day03]
    putStr "Day03 - Part B:"
    print $ solvePartB [x | x <- lines day03] slopes
