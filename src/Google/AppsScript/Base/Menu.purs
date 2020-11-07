module Google.AppsScript.Base.Menu
  ( addItem
  , addSeparator
  , addSubMenu
  , addToUi
  , Menu
  ) where

import Data.Function.Uncurried (Fn3, runFn3)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Base.Types (Caption, FunctionName)
import Prelude (Unit)

-- | A custom menu in an instance of the user interface for a Google App. 
foreign import data Menu :: Type

foreign import addItemImpl :: Fn3 String String Menu (GASEff Menu)

-- | Inserts the menu into the instance of the editor's user interface.
foreign import addToUi :: Menu -> GASEff Unit

-- | Adds a visual separator to the menu.
foreign import addSeparator :: Menu -> GASEff Menu

-- | Adds a sub-menu to the menu.
foreign import addSubMenu :: Menu -> Menu -> GASEff Menu

-- | Adds an item to the menu. The label for a menu item should be in sentence 
-- | case (only the first word capitalized).
addItem :: Caption -> FunctionName -> Menu -> GASEff Menu
addItem cap funcname menu = runFn3 addItemImpl cap funcname menu
