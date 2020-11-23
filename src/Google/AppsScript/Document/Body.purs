module Google.AppsScript.Document.Body (replaceText) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Document.Types (Body, Element)

-- | Replaces all occurrences of a given text pattern with a given replacement 
-- | string, using regular expressions.
-- TODO: Turn String into a regular expression
foreign import replaceText :: String -> String -> Body -> GASEff Element