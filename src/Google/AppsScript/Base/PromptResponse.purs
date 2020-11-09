module Google.AppsScript.Base.PromptResponse
  ( PromptResponse
  , getResponseText
  , getSelectedButton
  ) where

import Data.Function.Uncurried (Fn3, runFn3)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Base.Types (Ui, Button, buttons)

-- | A response to a prompt dialog displayed in the user-interface environment for a Google App. 
foreign import data PromptResponse :: Type

foreign import getResponseText :: PromptResponse -> GASEff String

foreign import getSelectedButtonImpl :: Fn3 (Array Button) PromptResponse Ui (GASEff Button)

getSelectedButton :: PromptResponse -> Ui -> GASEff Button
getSelectedButton promptResponse ui = runFn3 getSelectedButtonImpl buttons promptResponse ui
