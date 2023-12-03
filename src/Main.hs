module Main where

import System.Environment

import Day01

main :: IO()
main = do 
    userInput <- getArgs
    case head userInput of
        "00" -> putStrLn "Hello, Haskell!"
        "01" -> day01 "src/days/day01.txt"
