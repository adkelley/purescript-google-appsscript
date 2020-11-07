module Google.AppsScript.Base.Ui
  ( alert
  , alertButtons
  , alertTitle
  , createAddonMenu
  , createMenu
  , prompt
  , promptButtons
  , promptTitle
  , showSidebar
  , showModalDialog
  , showModelessDialog
  {-
  , prompt
  -}
  ) where

import Prelude
import Data.Function.Uncurried (Fn2, Fn5, Fn4, Fn3, runFn2, runFn5, runFn4, runFn3)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Base.Types (Button(..), ButtonSet, Caption, Menu, PromptResponse, Ui)
import Google.AppsScript.HTML.Types (HtmlOutput)

foreign import alertImpl :: Fn3 (Array Button) String Ui (GASEff Button)

foreign import alertButtonsImpl :: Fn4 (Array Button) String ButtonSet Ui (GASEff Button)

foreign import alertTitleImpl :: Fn5 (Array Button) String String ButtonSet Ui (GASEff Button)

-- | Creates a builder that can be used to insert a sub-menu into the editor's 
-- | Add-on menu.
foreign import createAddonMenu :: Ui -> GASEff Menu

-- | Creates a builder that can be used to add a menu to the editor's user interface. 
foreign import createMenu :: Caption -> Ui -> GASEff Menu

foreign import showSidebarImpl :: Fn2 HtmlOutput Ui (GASEff Unit)

foreign import showModalDialogImpl :: Fn3 HtmlOutput String Ui (GASEff Unit)

foreign import showModelessDialogImpl :: Fn3 HtmlOutput String Ui (GASEff Unit)

-- | Opens an input dialog box in the user's editor with the given message and an "OK" button.
foreign import prompt :: String -> Ui -> PromptResponse

-- | Opens an input dialog box in the user's editor with the given message and set of buttons. 
foreign import promptButtons :: (Array Button) -> String -> Ui -> PromptResponse

-- | Opens an input dialog box in the user's editor with the given title, message, and set of buttons. 
foreign import promptTitle :: (Array Button) -> String -> Ui -> PromptResponse

buttons :: Array Button
buttons = [ Close, Ok, Cancel, Yes, No ]

-- | Opens a dialog box in the user's editor with the given message and an "OK" 
-- | button.
alert :: String -> Ui -> GASEff Button
alert msg ui = runFn3 alertImpl buttons msg ui

-- | Opens a dialog box in the user's editor with the given message and set of 
-- | buttons.
alertButtons :: String -> ButtonSet -> Ui -> GASEff Button
alertButtons msg buttonset ui = runFn4 alertButtonsImpl buttons msg buttonset ui

-- | Opens a dialog box in the user's editor with the given title, message, and 
-- | set of buttons.
alertTitle :: String -> String -> ButtonSet -> Ui -> GASEff Button
alertTitle title msg buttonset ui = runFn5 alertTitleImpl buttons title msg buttonset ui

-- | Opens a sidebar in the user's editor with custom client-side content.
showSidebar :: HtmlOutput -> Ui -> GASEff Unit
showSidebar html ui = runFn2 showSidebarImpl html ui

-- | Opens a modal dialog box in the user's editor with custom client-side content.
showModalDialog :: HtmlOutput -> String -> Ui -> GASEff Unit
showModalDialog html title ui = runFn3 showModalDialogImpl html title ui

-- | Opens a modeless dialog box in the user's editor with custom client-side 
-- | content.
showModelessDialog :: HtmlOutput -> String -> Ui -> GASEff Unit
showModelessDialog html title ui = runFn3 showModelessDialogImpl html title ui
