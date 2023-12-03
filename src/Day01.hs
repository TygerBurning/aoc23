module Day01 where

import Data.List.Split
import Data.Text (Text, pack, replace, unpack)
import Utils

-- Pull out charactesr that look like numbers from a string
filterNumbers :: [Char] -> [Char]
filterNumbers xs = [x | x <- xs, x `elem` ['1' .. '9']]

-- Replace string numbers with decimal based numbers (i.e. "two" -> "2")
replaceStr :: Text -> Text -> Text -> Text
replaceStr input output s = do
  Data.Text.replace input output s

replaceNumbersStr :: String -> String
replaceNumbersStr s = unpack (replaceStr (pack "one") (pack "one1one") (replaceStr (pack "two") (pack "two2two") (replaceStr (pack "three") (pack "three3three") (replaceStr (pack "four") (pack "four4four") (replaceStr (pack "five") (pack "five5five") (replaceStr (pack "six") (pack "six6six") (replaceStr (pack "seven") (pack "seven7seven") ( replaceStr (pack "eight") (pack "eight8eight") (replaceStr (pack "nine") (pack "nine9nine") (pack s))))))))))

-- replaceStr (pack "three") (pack "3") sp
-- replaceStr (pack "four") (pack "4") sp
-- replaceStr (pack "five") (pack "5") sp
-- replaceStr (pack "six") (pack "6") sp
-- replaceStr (pack "seven") (pack "7") sp
-- replaceStr (pack "eight") (pack "8") sp
-- replaceStr (pack "nine") (pack "9") sp

findNumbers :: [Char] -> Int
findNumbers xs = toNum (head (filterNumbers xs)) * 10 + toNum (last (filterNumbers xs))

sumNumbers :: [String] -> Int
sumNumbers puzzle = sum [findNumbers xs | xs <- puzzle]

day01 :: String -> IO ()
day01 filename = do
  inh <- readFile filename
  print (sumNumbers (lines inh))
--   print (sumNumbers (map replaceNumbersStr [(head (lines inh))]))
-- 55934 too high
  print (sumNumbers (map replaceNumbersStr (lines inh)))