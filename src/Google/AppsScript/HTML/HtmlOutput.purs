module Google.AppsScript.HTML.HtmlOutput
  ( html
  , setTitle
  , setWidth
  , setHeight
  , setSandboxMode
  ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.HTML.Types (HtmlOutput, HtmlService)

foreign import html :: GASEff HtmlService

foreign import setTitleImpl :: Fn2 String HtmlOutput (GASEff HtmlOutput)

foreign import setWidthImpl :: Fn2 Int HtmlOutput (GASEff HtmlOutput)

foreign import setHeightImpl :: Fn2 Int HtmlOutput (GASEff HtmlOutput)

-- the only supported mode now is IFRAME
-- so there is no point in passing it as a parameter
foreign import setSandboxMode :: HtmlOutput -> GASEff HtmlOutput

-- | Sets the title of the output page. For web apps, this is the title of the 
-- | entire page, while for HtmlOutput shown in Google Sheets, this is the dialog title.
setTitle :: String -> HtmlOutput -> GASEff HtmlOutput
setTitle t h = runFn2 setTitleImpl t h

-- | Sets the initial width of a custom dialog in Google Docs, Sheets, or Forms. 
setWidth :: Int -> HtmlOutput -> GASEff HtmlOutput
setWidth w h = runFn2 setWidthImpl w h

-- | Sets the initial height of the custom dialog in Google Docs, Sheets, or Forms. 
setHeight :: Int -> HtmlOutput -> GASEff HtmlOutput
setHeight w h = runFn2 setHeightImpl w h
