module Google.AppsScript.Base.Types
  ( Caption
  , FunctionName
  , Button(..)
  , ButtonSet(..)
  , Menu
  , Ui
  , buttons
  ) where

-- | An instance of the user-interface environment for a Google App that 
-- | allows the script to add features like menus, dialogs, and sidebars.
foreign import data Ui :: Type

-- | A custom menu in an instance of the user interface for a Google App. 
foreign import data Menu :: Type

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

buttons :: Array Button
buttons = [ Close, Ok, Cancel, Yes, No ]
