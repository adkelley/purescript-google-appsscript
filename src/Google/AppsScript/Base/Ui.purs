module Google.AppsScript.Base.Ui
( Button(..)
, ButtonSet(..)
, alert
, alertButtons
, alertTitle
, createAddonMenu
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
import Google.AppsScript.Base.Types (Ui, Menu)
import Google.AppsScript.HTML.HTML (HtmlOutput)


-- | An enum representing predetermined, localized dialog buttons returned by 
-- | an alert or PromptResponse.getSelectedButton() to indicate which button 
-- | in a dialog the user clicked.
data Button = Close | Ok | Cancel | Yes | No

-- | An enum representing predetermined, localized sets of one or more dialog 
-- | buttons that can be added to an alert or a prompt.
data ButtonSet = OkAlone | OkCancel | YesNo | YesNoCancel

foreign import alertImpl :: Fn3 (Array Button) String Ui (GASEff Button)
foreign import alertBtnsImpl :: Fn4 (Array Button) String ButtonSet Ui (GASEff Button)
foreign import alertTitleImpl :: Fn5 (Array Button) String String ButtonSet Ui (GASEff Button)

-- | Creates a builder that can be used to insert a sub-menu into the editor's 
-- | Add-on menu.
foreign import createAddonMenu :: Ui -> GASEff Menu

foreign import showSidebarImpl :: Fn2 HtmlOutput Ui (GASEff Unit)
foreign import showModalDialogImpl :: Fn3 HtmlOutput String Ui (GASEff Unit)
foreign import showModelessDialogImpl :: Fn3 HtmlOutput String Ui (GASEff Unit)

btns :: Array Button
btns = [Close, Ok, Cancel, Yes, No]

-- | Opens a dialog box in the user's editor with the given message and an "OK" 
-- | button.
alert :: String -> Ui -> GASEff Button
alert msg ui = runFn3 alertImpl btns msg ui

-- | Opens a dialog box in the user's editor with the given message and set of 
-- | buttons.
alertButtons :: String -> ButtonSet -> Ui -> GASEff Button
alertButtons msg btnset ui = runFn4 alertBtnsImpl btns msg btnset ui

-- | Opens a dialog box in the user's editor with the given title, message, and 
-- | set of buttons.
alertTitle :: String -> String -> ButtonSet -> Ui -> GASEff Button
alertTitle title msg btnset ui = runFn5 alertTitleImpl btns title msg btnset ui

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
