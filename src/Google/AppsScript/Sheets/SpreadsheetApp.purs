module Google.AppsScript.Sheets.SpreadsheetApp
( SpreadsheetApp
, app
, getActiveRange
, getUi
, openById
, getActiveRange
, getActiveSheet
) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Ui (Ui)
import Google.AppsScript.Sheets.Range (Range)
import Google.AppsScript.Sheets.Sheet (Sheet)
import Google.AppsScript.Sheets.Types (Id)

-- | Access and create Google Sheets files
foreign import data SpreadsheetApp :: Type


-- | Access and create Google Sheets files
foreign import app :: GASEff SpreadsheetApp

-- | Returns an instance of the spreadsheet's user-interface environment that 
-- | allows the script to add features like menus, dialogs, and sidebars.
foreign import getUi :: SpreadsheetApp -> GASEff Ui

-- | Opens the spreadsheet with the given ID.
foreign import openById :: Id -> SpreadsheetApp -> GASEff Sheet

-- | Returns the selected range in the active sheet, or null if there is no 
-- | active range.
-- | TODO: Convert the return type to GASEff (Maybe Range)
foreign import getActiveRange :: Sheet -> GASEff Range

-- | Sets the specified range as the active range, with the top left cell in the 
-- | range as the current cell.
foreign import setActiveRange :: Range -> Sheet -> GASEff Range

-- | Gets the active sheet in a spreadsheet.
foreign import getActiveSheet :: SpreadsheetApp -> GASEff Sheet

-- | Sets the active sheet in a spreadsheet.
foreign import setActiveSheet :: Sheet -> SpreadsheetApp -> GASEff Sheet