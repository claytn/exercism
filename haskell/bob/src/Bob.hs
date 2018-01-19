module Bob (responseFor) where
{-- Test cases pass. Clean up needs to be done. --}

import Data.Char (isSpace, isAlpha, isUpper)

isQuestion :: String -> Bool
isQuestion xs
    | null trimmedString = False
    | last trimmedString == '?' = True
    | otherwise = False
    where trimmedString = [x | x <- xs, not $ isSpace x]

isExclamation :: String -> Bool
isExclamation xs
    | null alphaList && null upperAlphaList = False
    | alphaList == upperAlphaList           = True
    | otherwise                             = False
    where alphaList      = [x | x <- xs, (isAlpha x)]
          upperAlphaList = [x | x <- xs, (isUpper x)]

isNothing :: String -> Bool
isNothing xs = null (filter (\c -> not $ isSpace c) xs)

responseFor :: String -> String
responseFor xs
  | question && exclamation = "Calm down, I know what I'm doing!"
  | question                = "Sure."
  | exclamation             = "Whoa, chill out!"
  | nothing                 = "Fine. Be that way!"
  | otherwise               = "Whatever."
  where question    = isQuestion xs
        exclamation = isExclamation xs
        nothing     = isNothing xs
