module Google.AppsScript.Base.Menu
( addItem
, addToUi
, addSeparator
, addSubMenu
) where

import Prelude (Unit)
import Data.Function.Uncurried (Fn3, runFn3)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Base.Types (Menu)


foreign import addItemImpl::Fn3 String String Menu (GASEff Menu)
foreign import addToUi::Menu -> GASEff Unit
foreign import addSeparator::Menu -> GASEff Menu
foreign import addSubMenu::Menu -> Menu -> GASEff Menu

addItem::String -> String -> Menu -> GASEff Menu
addItem cap funcname menu = runFn3 addItemImpl cap funcname menu
