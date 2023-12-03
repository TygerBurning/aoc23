module Utils where

import Data.Char

-- Converts a Char into the appropriate Int - e.g. '2' to 2.
toNum :: Char -> Int
toNum x = ord x - ord ('0')