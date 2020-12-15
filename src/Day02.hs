module Day02 (
  doDay02
  ) where

import Text.ParserCombinators.ReadP (readP_to_S, char, satisfy, skipSpaces, munch1, ReadP)
import Data.Char (isLetter, isDigit)

data Password = Password Int Int Char String

parsePassword :: ReadP Password
parsePassword = do
    num1 <- read <$> munch1 isDigit
    char '-'
    num2 <- read <$> munch1 isDigit
    skipSpaces
    lett <- satisfy isLetter
    char ':'
    skipSpaces
    pass <- munch1 isLetter
    return $ Password num1 num2 lett pass

instance Read Password where
    readsPrec _ = readP_to_S parsePassword

isValOne :: Password -> Bool
isValOne (Password min max lett pass) = occurence >= min && occurence <= max where
        occurence = length . filter (== lett) $ pass

isValTwo :: Password -> Bool
isValTwo (Password in1 in2 lett pass) = (pass !! (in1 - 1) == lett) /= (pass !! (in2 - 1) == lett)

doDay02 :: IO ()
doDay02 = do
    day02 <- readFile "in/day02"
    print . length . filter (== True) . map (isValOne . read) . lines $ day02
    print . length . filter (== True) . map (isValTwo . read) . lines $ day02