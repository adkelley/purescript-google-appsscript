module Google.AppsScript.Sheets.SpreadsheetApp
  ( spreadsheetApp
  , getActiveRange
  , getUi
  , openById
  , getActiveSheet
  , getActiveSpreadsheet
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Base.Types (Ui)
import Google.AppsScript.Sheets.Types (Id, Range, Sheet, Spreadsheet, SpreadsheetApp)

-- | Access and create Google Sheets files
foreign import spreadsheetApp :: GASEff SpreadsheetApp

-- | Returns an instance of the spreadsheet's user-interface environment that 
-- | allows the script to add features like menus, dialogs, and sidebars.
foreign import getUi :: SpreadsheetApp -> GASEff Ui

-- | Opens the spreadsheet with the given ID.
foreign import openById :: Id -> SpreadsheetApp -> GASEff Sheet

foreign import getActiveRangeImpl :: Sheet -> GASEff (Nullable Range)

-- | Returns the Just (selected range) in the active sheet, or Nothing if there is no 
-- | active range.
getActiveRange :: Sheet -> GASEff (Maybe Range)
getActiveRange sheet = toMaybe <$> getActiveRangeImpl sheet

foreign import getActiveSpreadsheetImpl :: SpreadsheetApp -> GASEff (Nullable Spreadsheet)

-- | Returns the currently active spreadsheet, or null if there is none.
getActiveSpreadsheet :: SpreadsheetApp -> GASEff (Maybe Spreadsheet)
getActiveSpreadsheet app = toMaybe <$> getActiveSpreadsheetImpl app

-- | Sets the specified range as the active range, with the top left cell in the 
-- | range as the current cell.
foreign import setActiveRange :: Range -> Sheet -> GASEff Range

-- | Gets the active sheet in a spreadsheet.
foreign import getActiveSheet :: SpreadsheetApp -> GASEff Sheet

-- | Sets the active sheet in a spreadsheet.
foreign import setActiveSheet :: Sheet -> SpreadsheetApp -> GASEff Sheet
