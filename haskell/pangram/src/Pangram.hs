module Pangram (isPangram) where

import Data.Char (toLower, isAlpha)

filterOccur :: String -> String
filterOccur [] = []
filterOccur (x:xs)
      | isAlpha x = x:(filterOccur $ filter (/=x) xs)
      | otherwise = filterOccur xs

isPangram :: String -> Bool
isPangram text = let alphaLength = 26
                     lowerText   = map toLower text
                 in (length $ filterOccur lowerText) == alphaLength
