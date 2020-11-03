module Google.AppsScript.HTML.HtmlService
  ( createHtmlOutputFromFile
  ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.HTML.Types (HtmlOutput, HtmlService)

foreign import createHtmlOutputFromFileImpl :: Fn2 String HtmlService (GASEff HtmlOutput)

-- | Creates a new HtmlOutput object from a file in the code editor.
createHtmlOutputFromFile :: String -> HtmlService -> GASEff HtmlOutput
createHtmlOutputFromFile f h = runFn2 createHtmlOutputFromFileImpl f h
