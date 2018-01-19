module Bob (responseFor) where

import Data.Char (isSpace, isAlpha, isUpper)

isQuestion :: String -> Bool
isQuestion xs
    | null xs           = False
    | last xs == '?'    = True
    | isSpace $ last xs = isQuestion $ init xs
    | otherwise         = False

isYelling :: String -> Bool
isYelling xs
    | null alphaList || null upperAlphaList = False
    | alphaList == upperAlphaList           = True
    | otherwise                             = False
    where alphaList      = [x | x <- xs, (isAlpha x)]
          upperAlphaList = [x | x <- xs, (isUpper x)]

isNothing :: String -> Bool
isNothing xs = null (filter (\c -> not $ isSpace c) xs)

responseFor :: String -> String
responseFor xs
  | question && yelling = "Calm down, I know what I'm doing!"
  | question            = "Sure."
  | yelling             = "Whoa, chill out!"
  | nothing             = "Fine. Be that way!"
  | otherwise           = "Whatever."
  where question    = isQuestion xs
        yelling     = isYelling xs
        nothing     = isNothing xs
