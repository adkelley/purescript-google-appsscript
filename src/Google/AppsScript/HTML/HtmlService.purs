module Google.AppsScript.HTML.HtmlService
  ( createHtmlOutputFromFile
  , createHtmlOutput
  , htmlService
  ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.HTML.Types (HtmlOutput, HtmlService)

foreign import htmlService :: GASEff HtmlService
foreign import createHtmlOutputFromFileImpl :: Fn2 String HtmlService (GASEff HtmlOutput)
foreign import createHtmlOutputImpl :: Fn2 String HtmlService (GASEff HtmlOutput)

-- | Creates a new HtmlOutput object from a file in the code editor.
createHtmlOutputFromFile :: String -> HtmlService -> GASEff HtmlOutput
createHtmlOutputFromFile f h = runFn2 createHtmlOutputFromFileImpl f h

-- | Creates a new HtmlOutput object that can be returned from the script.
createHtmlOutput :: String -> HtmlService -> GASEff HtmlOutput
createHtmlOutput f h = runFn2 createHtmlOutputImpl f h
