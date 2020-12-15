module Main where

import Text.Printf (printf)
import Data.Foldable (traverse_, for_)
import System.IO
import System.Environment (getArgs)
import Text.Read (readMaybe)

import Day01
import Day02


currentDay = doDay02

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> currentDay
    [dayNumber] -> case readMaybe dayNumber of
      Just 1 -> doDay01
      Just 2 -> doDay02
      Just _ -> putStrLn "I haven't implemented that day yet!"
      Nothing -> putStrLn "That's not a number!"
    _ -> putStrLn "Please enter a day number!"