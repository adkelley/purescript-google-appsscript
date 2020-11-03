module Google.AppsScript.Base.Types
  ( Ui
  , Menu
  ) where

-- | An instance of the user-interface environment for a Google App that 
-- | allows the script to add features like menus, dialogs, and sidebars.
foreign import data Ui :: Type

-- | A custom menu in an instance of the user interface for a Google App. 
foreign import data Menu :: Type
