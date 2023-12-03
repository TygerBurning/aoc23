module Day01 where

import Data.List.Split
import Data.Text(Text, pack, replace, unpack)
import Utils

-- Pull out charactesr that look like numbers from a string
filterNumbers :: [Char] -> [Char]
filterNumbers xs = [x | x <- xs, x `elem` ['1' .. '9']]

-- Ensure all "word" numbers (e.g. "one") are also represented by a digit (e.g. "1")
replaceNumbersStr :: String -> String
replaceNumbersStr s = unpack (replace (pack "one") (pack "one1one") (replace (pack "two") (pack "two2two") (replace (pack "three") (pack "three3three") (replace (pack "four") (pack "four4four") (replace (pack "five") (pack "five5five") (replace (pack "six") (pack "six6six") (replace (pack "seven") (pack "seven7seven") ( replace (pack "eight") (pack "eight8eight") (replace (pack "nine") (pack "nine9nine") (pack s))))))))))

findNumbers :: [Char] -> Int
findNumbers xs = toNum (head (filterNumbers xs)) * 10 + toNum (last (filterNumbers xs))

sumNumbers :: [String] -> Int
sumNumbers puzzle = sum [findNumbers xs | xs <- puzzle]

day01 :: String -> IO ()
day01 filename = do
  inh <- readFile filename
  print (sumNumbers (lines inh))
  print (sumNumbers (map replaceNumbersStr (lines inh)))