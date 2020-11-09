module Google.AppsScript.Sheets.Spreadsheet
  ( getSheetId
  , getSheets
  , setActiveRange
  ) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Sheets.Types (Range, Sheet, Sheets, Spreadsheet)

-- | Returns the ID of the sheet represented by this object.
foreign import getSheetId :: Sheet -> GASEff Int

-- | Gets all the sheets in this spreadsheet.
foreign import getSheets :: Spreadsheet -> GASEff Sheets

-- | Sets the specified range as the active range in the active sheet, with 
-- | the top left cell in the range as the current cell.
foreign import setActiveRange :: Range -> Sheet -> GASEff Range
