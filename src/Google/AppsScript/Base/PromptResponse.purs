module Google.AppsScript.Base.PromptResponse
  ( PromptResponse
  , getResponseText
  , getSelectedButton
  ) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Base.Types (Button)

-- | A response to a prompt dialog displayed in the user-interface environment for a Google App. 
foreign import data PromptResponse :: Type

foreign import getResponseText :: PromptResponse -> GASEff String

foreign import getSelectedButton :: PromptResponse -> GASEff Button
