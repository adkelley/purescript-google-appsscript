module Google.AppsScript.Base.Types
  ( Caption
  , FunctionName
  , Button(..)
  , ButtonSet(..)
  ) where

type Caption
  = String

type FunctionName
  = String

-- | An enum representing predetermined, localized dialog buttons returned by 
-- | an alert or PromptResponse.getSelectedButton() to indicate which button 
-- | in a dialog the user clicked.
data Button
  = Close
  | Ok
  | Cancel
  | Yes
  | No

-- | An enum representing predetermined, localized sets of one or more dialog 
-- | buttons that can be added to an alert or a prompt.
data ButtonSet
  = OkAlone
  | OkCancel
  | YesNo
  | YesNoCancel
